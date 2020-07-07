package com.ruoyi.web.controller.common;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.enums.ShortStatus;
import com.ruoyi.framework.shiro.service.SysPasswordService;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.reward.domain.SysShort;
import com.ruoyi.reward.facade.enums.YqmStatusEnum;
import com.ruoyi.reward.service.SysShortService;
import com.ruoyi.system.domain.SysPost;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.domain.Yqm;
import com.ruoyi.system.service.*;
import com.ruoyi.web.GetShortFactory;
import lombok.extern.java.Log;
import org.near.toolkit.common.DoMainUtil;
import org.near.toolkit.common.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Optional;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/webLogin")
@Log
public class WebController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(WebController.class);

    private final String prefix = "webLogin";


    @Autowired
    ISysUserService userService;

    @Autowired
    SysPasswordService passwordService;

    @Autowired
    ISysRoleService roleService;

    @Autowired
    IYqmService yqmService;

    @Autowired
    SysShortService sysShortService;


    @Autowired
    ISysPostService postService;
    @Autowired
    ISysConfigService sysConfigService;

    @Autowired
    GetShortFactory getShortFactory;

    @GetMapping()
    public String index() {
        return prefix + "/login";
    }


    @GetMapping("/reg")
    public String reg() {
        return prefix + "/reg";
    }


    @Autowired
    ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @PostMapping("/reg")
    @ResponseBody
    @com.ruoyi.common.annotation.Log(title = "代理商户注册", businessType = BusinessType.OTHER)
    public AjaxResult reg(String loginName, String userName, String password,
                          String yqm,
                          String payee,
                          String payeeAccount, HttpServletRequest request) {

        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes my = (ServletRequestAttributes) requestAttributes;
        HttpServletRequest myRequest = my.getRequest();
        StringBuffer requestURL = myRequest.getRequestURL();
        logger.info("requestURL:{}", requestURL);

        String contextPath = myRequest.getServletContext().getContextPath();
        final String string = requestURL.delete(requestURL.length() - request.getRequestURI().length(), requestURL.length()).append(contextPath).toString();


        Yqm yqmDTO = new Yqm();
        yqmDTO.setYqm(yqm);
        List<Yqm> list = yqmService.selectYqmList(yqmDTO);
        if (CollectionUtils.isEmpty(list)) {
            return error("'" + yqm + "'邀请码不存在，注册账号失败");
        }
        Yqm dto = list.get(0);
        if (dto.getZt().equals(YqmStatusEnum.Y.getCode())) {
            return error("'" + yqm + "'邀请码已使用，注册账号失败");
        }

        if (UserConstants.USER_NAME_NOT_UNIQUE.equals(userService.checkLoginNameUnique(loginName))) {
            return error("注册用户'" + loginName + "'失败，登录账号已存在");
        }

        List<SysRole> sysRoles = roleService.selectRoleAll();

        Optional<SysRole> common = sysRoles.stream().filter(sysRole -> "common".equals(sysRole.getRoleKey())).findFirst();
        SysRole sysRole = common.get();

        List<SysPost> sysPosts = postService.selectPostAll();
        Optional<SysPost> sysPost = sysPosts.stream().filter(it -> "user".equals(it.getPostCode())).findFirst();

        SysUser user = new SysUser();
        user.setLoginName(loginName);
        user.setPostIds(new Long[]{sysPost.get().getPostId()});
        user.setRoleId(sysRole.getRoleId());
        user.setRoleIds(new Long[]{sysRole.getRoleId()});
        user.setUserName(userName);
        user.setDeptId(105L);
        user.setEmail("system@163.com");
        user.setPhonenumber(getPhoneNum());
        user.setSex("1");
        user.setStatus("0");
        user.setDelFlag("0");
        user.setLoginIp("127.0.0.1");
        user.setLoginDate(new Date());
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setSalt(ShiroUtils.randomSalt());
        user.setRemark("代理用户");
        user.setPayee(payee);
        user.setPayeeAccount(payeeAccount);
        user.setPassword(passwordService.encryptPassword(loginName, password, user.getSalt()));
        user.setCreateBy("admin");
        int i = userService.insertUser(user);
        if (i > 0) {
            dto.setZt(YqmStatusEnum.Y.getCode());
            dto.setName(loginName);
            yqmService.updateYqm(dto);
            threadPoolTaskExecutor.execute(() -> {
                SysShort sysShort = new SysShort();
                sysShort.setShortKey(loginName);
                sysShort.setShortStatus(ShortStatus.OK.getCode());
                String wxAuthUrl = sysConfigService.selectConfigByKey("wxAuthUrl");
                //我的推广链接
                String doMain = DoMainUtil.getDoMain(wxAuthUrl);
                String longUrl = "http://" + doMain + "/?userId=" + loginName;
                sysShort.setLongUrl(longUrl);
                logger.info("longUrl:{}", longUrl);
                String shortUrl = getShortFactory.getShortUrl(longUrl);
                if (StringUtil.isNotBlank(shortUrl)) {
                    sysShort.setShortUrl(shortUrl);
                    sysShortService.insertSysShort(sysShort);
                }
            });
        }
        return toAjax(i);
    }





    public static String getPhoneNum() {
        //给予真实的初始号段，号段是在百度上面查找的真实号段
        String[] start = {"133", "149", "153", "173", "177",
                "180", "181", "189", "199", "130", "131", "132",
                "145", "155", "156", "166", "171", "175", "176", "185", "186", "166", "134", "135",
                "136", "137", "138", "139", "147", "150", "151", "152", "157", "158", "159", "172",
                "178", "182", "183", "184", "187", "188", "198", "170", "171"};

        //随机出真实号段   使用数组的length属性，获得数组长度，
        //通过Math.random（）*数组长度获得数组下标，从而随机出前三位的号段
        String phoneFirstNum = start[(int) (Math.random() * start.length)];
        //随机出剩下的8位数
        StringBuilder phoneLastNum = new StringBuilder();
        //定义尾号，尾号是8位
        int lenPhone = 8;
        //循环剩下的位数
        for (int i = 0; i < lenPhone; i++) {
            //每次循环都从0~9挑选一个随机数
            phoneLastNum.append((int) (Math.random() * 10));
        }
        //最终将号段和尾数连接起来
        return phoneFirstNum + phoneLastNum;
    }


}
