package com.ruoyi.web.controller.system;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.ShortStatus;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.reward.domain.SysShort;
import com.ruoyi.reward.service.SysShortService;
import com.ruoyi.system.domain.Account;
import com.ruoyi.system.domain.SysMenu;
import com.ruoyi.system.domain.SysNotice;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.IAccountService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysMenuService;
import com.ruoyi.system.service.ISysNoticeService;
import com.ruoyi.web.GetShortFactory;
import org.near.toolkit.common.DoMainUtil;
import org.near.toolkit.model.Money;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 首页 业务处理
 *
 * @author ruoyi
 */
@Controller
public class SysIndexController extends BaseController {
    final
    ISysMenuService menuService;
    final
    ISysConfigService configService;
    final
    SysShortService sysShortService;
    final
    IAccountService accountService;

    public SysIndexController(ISysMenuService menuService, ISysConfigService configService, SysShortService sysShortService, IAccountService accountService) {
        this.menuService = menuService;
        this.configService = configService;
        this.sysShortService = sysShortService;
        this.accountService = accountService;
    }

    @Autowired
    ISysNoticeService sysNoticeService;

    /**
     * 系统首页
     */

    @GetMapping("/index")
    public String index(ModelMap mmap) {
        // 取身份信息
        SysUser user = ShiroUtils.getSysUser();
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("sideTheme", configService.selectConfigByKey("sys.index.sideTheme"));
        mmap.put("skinName", configService.selectConfigByKey("sys.index.skinName"));
        mmap.put("copyrightYear", Global.getCopyrightYear());
        mmap.put("demoEnabled", Global.isDemoEnabled());
        return "index";
    }

    /**
     * 切换主题
     *
     * @param mmap
     * @return
     */
    @GetMapping("/system/switchSkin")
    public String switchSkin(ModelMap mmap) {
        return "skin";
    }

    /**
     * 系统介绍
     *
     * @param mmap
     * @return
     */
    @GetMapping("/system/main")
    public String main(ModelMap mmap) {
        mmap.put("version", Global.getVersion());
        SysUser user = ShiroUtils.getSysUser();
        SysShort sysShort = new SysShort();
        sysShort.setShortKey(user.getLoginName());
        List<SysShort> list = sysShortService.selectSysShortList(sysShort);
        if (!CollectionUtils.isEmpty(list)) {
            SysShort item = list.get(0);
            mmap.put("sysShort", item);
        }
        Account account = new Account();
        String loginName = ShiroUtils.getLoginName();
        account.setAccountId(loginName);
        String balanceStr = "0.0";
        List<Account> accounts = accountService.selectAccountList(account);
        if (!CollectionUtils.isEmpty(accounts)) {
            Account item = accounts.get(0);
            Money money = new Money();
            money.setCent(item.getBalance());
            balanceStr = money.getAmount().toString();
        }
        mmap.put("account", balanceStr);

        PageHelper.startPage(1, 1, " create_time desc");
        SysNotice sysNotice = new SysNotice();
        List<SysNotice> sysNotices = sysNoticeService.selectNoticeList(sysNotice);
        if (!CollectionUtils.isEmpty(sysNotices)) {
            logger.info("sysNotices:{}", sysNotices);
            SysNotice item = sysNotices.get(0);
            mmap.put("notice", item);
            mmap.put("status", item.getStatus());
        } else {
            mmap.put("status", "1");
        }
        return "main";
    }

    @Autowired
    ISysConfigService sysConfigService;
    @Autowired

    GetShortFactory getShortFactory;


    @PostMapping("/system/build")
    @ResponseBody
    @SentinelResource(value = "webLogin-build", blockHandler = "exceptionHandler", fallback = "fallback")
    @com.ruoyi.common.annotation.Log(title = "生成推广链接", businessType = BusinessType.OTHER)
    public AjaxResult build(HttpServletRequest request) {
        String loginName = ShiroUtils.getLoginName();
        String wxAuthUrl = sysConfigService.selectConfigByKey("wxAuthUrl");
        String doMain = DoMainUtil.getDoMain(wxAuthUrl);
        String longUrl = "http://" + doMain + "/?userId=" + loginName;
        SysShort sysShort = new SysShort();
        sysShort.setShortKey(loginName);
        List<SysShort> sysShorts = sysShortService.selectSysShortList(sysShort);
        if (CollectionUtils.isEmpty(sysShorts)) {
            sysShort.setShortStatus(ShortStatus.OK.getCode());
            sysShort.setLongUrl(longUrl);
            String shortUrl = getShortFactory.getShortUrl(longUrl);
            sysShort.setShortUrl(shortUrl);
            int i = sysShortService.insertSysShort(sysShort);
            if (i > 0) {
                return AjaxResult.success("success", sysShort);
            }
        } else {
            SysShort aShort = sysShorts.get(0);
            aShort.setLongUrl(longUrl);
            String shortUrl = getShortFactory.getShortUrl(longUrl);
            aShort.setShortUrl(shortUrl);
            int i = sysShortService.updateSysShort(aShort);
            if (i > 0) {
                return AjaxResult.success("success", aShort);
            }
        }
        return AjaxResult.error("系统异常");
    }
}
