package com.ruoyi.web.controller.common;

import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.sequence.ConcurrentSequence;
import com.ruoyi.framework.interceptor.impl.WxPnUserAuth;
import com.ruoyi.framework.interceptor.util.SessionContext;
import com.ruoyi.sms.facade.api.IShipinService;
import com.ruoyi.sms.facade.dto.ShipinDTO;
import com.ruoyi.sms.facade.enums.OrderPayType;
import com.ruoyi.sms.facade.enums.OrderStatusType;
import com.ruoyi.sms.facade.enums.WebMainStatus;
import com.ruoyi.system.domain.SysCategory;
import com.ruoyi.system.domain.SysOrder;
import com.ruoyi.system.domain.SysWebMain;
import com.ruoyi.system.service.*;
import lombok.Data;
import lombok.extern.java.Log;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.model.Money;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

import static com.ruoyi.sms.facade.enums.OrderPayType.WE_CHAT_PAY;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/pron")
@Log
public class PronController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(PronController.class);

    private String prefix = "pron";


    @Autowired
    IShipinService shipinService;


    @Autowired
    ConcurrentSequence concurrentSequence;

    @Autowired
    ISysWebMainService sysWebMainService;


    @Autowired
    IYqmService yqmService;
    @Autowired
    ISysCategoryService categoryService;


    @Autowired
    ISysOrderService sysOrderService;

    @Autowired
    ISysPostService postService;

    @Autowired
    ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @GetMapping("/redirect")
    @WxPnUserAuth
    public String redirect(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        xxx(userid, modelmap);
        return prefix + "/index";

    }


    @PostMapping("/queryOrder")
    @WxPnUserAuth
    @ResponseBody
    public AjaxResult queryOrder(ShipinDTO shipinDTO) {
        String openId = SessionContext.getOpenId();
        String userId = SessionContext.getUserId();
        logger.info("id:{},openId:{}", shipinDTO.getId(), openId);
        SysOrder order = new SysOrder();
        order.setGoodsId(shipinDTO.getId().longValue());
        order.setOpenId(openId);
        List<SysOrder> sysOrders = sysOrderService.selectSysOrderList(order);
        if (CollectionUtils.isEmpty(sysOrders)) {
            ShipinDTO dto = shipinService.selectShipinDTOById(shipinDTO.getId().longValue());
            order.setCreateTime(new Date());
            order.setExtensionUserId(userId);
            order.setUpdateTime(new Date());
            order.setOrderId(concurrentSequence.nextId().toString());
            //商品快照信息
            order.setGoodsSnapshot(JSON.toJSONString(dto));
            order.setExtensionUserId(SessionContext.getUserId());
            //商品价格区间 原价
            String money = dto.getMoney();
            String[] split = money.split("-");
            int start = Integer.parseInt(split[0]);
            int end = Integer.parseInt(split[1]);
            //这个单位是元
            int i = RandomUtil.randomInt(start, end);
            //实际金额 转换单位分

            Money m = new Money(i);
            order.setMoney(Math.toIntExact(m.getCent()));
            order.setMoneyStr(m.getAmount().toString());
            //原价 转换单位分
            order.setPrice(Math.toIntExact(m.getCent()));
            //备注
            order.setPayTag(m.toString());

            order.setType(Integer.valueOf(WE_CHAT_PAY.getCode()));
            order.setTypeStr(WE_CHAT_PAY.getDesc());
            order.setStatus(Integer.valueOf(OrderStatusType.N_PAY.getCode()));
            order.setStatusStr(OrderStatusType.N_PAY.getDesc());
            sysOrderService.insertSysOrder(order);
            return AjaxResult.success(order);
        } else {
            SysOrder sysOrder = sysOrders.get(0);
            Money money = new Money();
            money.setCent(sysOrder.getMoney());
            sysOrder.setMoneyStr(money.toString());
            sysOrder.setTypeStr(EnumUtil.queryByCode(sysOrder.getType().toString(), OrderPayType.class).getDesc());
            sysOrder.setStatusStr(EnumUtil.queryByCode(sysOrder.getStatus().toString(), OrderStatusType.class).getDesc());
            return AjaxResult.success(sysOrder);
        }
    }


    @GetMapping()
    @WxPnUserAuth
    public String index(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        String user = StringUtil.isBlank(userid) ? "" : userid;

        if (Global.isMock()) {
            return redirect(userid, modelmap);
        }

        SysWebMain webMain = new SysWebMain();
        webMain.setMainStatus(WebMainStatus.OK.getCode());
        List<SysWebMain> list = sysWebMainService.selectSysWebMainList(webMain);
        if (!CollectionUtils.isEmpty(list)) {
            int size = list.size();
            int i = RandomUtil.randomInt(0, size - 1);
            SysWebMain item = list.get(i);

            String url = item.getMainUrl() + "/pron/redirect?userid=" + user;
            logger.info("redirect.url:{}", url);
            return "redirect:" + url;
        }
        return redirect(userid, modelmap);
    }

    private void xxx(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        logger.info("userId:{}", userid);
        ShipinDTO shipinDTO = new ShipinDTO();
        PageHelper.startPage(1, 12, StringUtil.EMPTY_STRING);
        List<ShipinDTO> list = shipinService.selectShipinDTOList(shipinDTO);
        convert(list);
        modelmap.addAttribute("list", list);
        SysCategory sysCategory = new SysCategory();
        sysCategory.setParentId(100L);
        List<SysCategory> categoryList = categoryService.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
    }


    @GetMapping("/detail")
    @WxPnUserAuth
    public String detail(@RequestParam(value = "id", required = true) Long id, @RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        logger.info("user:{},id:{}", userid, id);
        ShipinDTO shipin = shipinService.selectShipinDTOById(id);
        if (shipin != null) {
            convert(new Date(), shipin);
            modelmap.put("shipin", shipin);
            SysCategory category = categoryService.selectDeptById(shipin.getCategoryId().longValue());
            if (category != null) {
                modelmap.put("category", category);
            }
            //异步执行浏览加1
            threadPoolTaskExecutor.execute(() -> shipinService.updateClickPlus(shipin.getId().longValue()));
        }

        PageHelper.startPage(1, 12, StringUtil.EMPTY_STRING);
        List<ShipinDTO> list = shipinService.selectShipinDTOList(new ShipinDTO());
        convert(list);
        modelmap.addAttribute("list", list);


        SysCategory sysCategory = new SysCategory();
        sysCategory.setParentId(100L);
        List<SysCategory> categoryList = categoryService.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
        modelmap.addAttribute("wxPayUrl", Global.getWxPayUrl());
        return prefix + "/detail";
    }


    @PostMapping("/list")
    @ResponseBody
    public TableDataInfoExt list(ShipinDTO shipinDTO) {
        startPage();
        List<ShipinDTO> list = shipinService.selectShipinDTOList(shipinDTO);
        convert(list);
        TableDataInfo dataTable = getDataTable(list);
        TableDataInfoExt ext = new TableDataInfoExt();
        BeanUtils.copyProperties(dataTable, ext);
        ext.setLength(dataTable.getRows().size());
        return ext;
    }


    /**
     * 微信支付
     */
    @PostMapping(value = "/payment")
    Object payment(HttpServletRequest request) {

        return null;
    }

    private void convert(List<ShipinDTO> list) {
        if (!CollectionUtils.isEmpty(list)) {
            Date now = new Date();
            for (ShipinDTO dto : list) {
                convert(now, dto);
            }
        }
    }

    private void convert(Date now, ShipinDTO dto) {
        Date createTime = dto.getCreateTime();
        if (createTime != null) {
            long diffDays = DateUtils.getDiffDays(now, createTime);
            if (diffDays < 1) {
                dto.setDiffDays("刚刚");
            } else {
                dto.setDiffDays(diffDays + "天前");
            }
        }

        if (StringUtil.isNotBlank(dto.getShijian())) {
            dto.setShijianStr(DateUtils.getTimeString(Integer.parseInt(dto.getShijian())));
        }
    }


    @GetMapping("/flowplayer")
    public String flowplayer(ModelMap mmap) {
        return prefix + "/flowplayer";
    }


    @GetMapping("/pagination")
    public String pagination() {
        return prefix + "/pagination";
    }

    @GetMapping("/tswq")
    public String renderTs(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        return prefix + "/tswq";
    }
}


@Data
class TableDataInfoExt extends TableDataInfo {
    private long length;

}


