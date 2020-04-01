package com.ruoyi.mp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.binarywang.wxpay.bean.notify.WxPayNotifyResponse;
import com.github.binarywang.wxpay.bean.notify.WxPayOrderNotifyResult;
import com.github.binarywang.wxpay.bean.order.WxPayMpOrderResult;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.constant.WxPayConstants;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.mp.factory.ConfigFactory;
import com.ruoyi.mp.util.AjaxResult;
import com.ruoyi.sms.facade.ISysOrderFacade;
import com.ruoyi.sms.facade.ISysWebMainFacade;
import com.ruoyi.sms.facade.dto.SysOrderDTO;
import com.ruoyi.sms.facade.enums.OrderStatusType;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.DoMainUtil;
import org.near.toolkit.common.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/pay")
@Slf4j
public class PayController {
    private final static Logger LOGGER = LoggerFactory.getLogger(PayController.class);
    @Reference(version = "1.0.0", check = false)
    ISysWebMainFacade sysWebMainFacade;
    @Autowired
    WxPayService wxPayService;
    @Autowired
    MpAuthConfig mpAuthConfig;
    @Reference(version = "1.0.0", check = false)
    ISysOrderFacade sysOrderFacade;
    @Autowired
    ConfigFactory configFactory;

    @GetMapping
    public String pay(@RequestParam(value = "orderId") String orderId, ModelMap modelmap) throws Exception {
        LOGGER.info("orderId:{}", orderId);
        SysOrderDTO item = getSysOrderDTO(orderId);
        modelmap.addAttribute("order", item);
        return "pay";


    }

    private SysOrderDTO getSysOrderDTO(String orderId) throws Exception {
        Assert.notNull(orderId, "orderId is not null");
        SysOrderDTO sysOrderDTO = new SysOrderDTO();
        sysOrderDTO.setOrderId(orderId);
        List<SysOrderDTO> list = sysOrderFacade.selectSysOrderList(sysOrderDTO);
        if (CollectionUtils.isEmpty(list)) {
            throw new Exception("系统异常");
        }
        return list.get(0);
    }


    /**
     * 调用统一下单接口，并组装生成支付所需参数对象.*
     *
     * @param dto
     * @param servletRequest
     * @return 返回 {@link com.github.binarywang.wxpay.bean.order}包下的类对象
     * @throws Exception
     */
    @PostMapping("/createOrder")
    @ResponseBody
    public AjaxResult createOrder(SysOrderDTO dto,
                                  HttpServletRequest servletRequest) throws Exception {
        SysOrderDTO item = getSysOrderDTO(dto.getOrderId());
        if (StringUtil.equals(OrderStatusType.Y_PAY.getCode(), item.getStatus().toString())) {
            throw new Exception("已经支付过,请不要重复支付");
        }

        WxPayUnifiedOrderRequest request = new WxPayUnifiedOrderRequest();
        request.setOutTradeNo(item.getOrderId());
        if (mpAuthConfig.isMockMoney()) {
            request.setTotalFee(1);
        } else {
            request.setTotalFee(item.getMoney());
        }
        request.setBody("会员充值");
        request.setMchId(configFactory.getSysWechatConfig().getMchId());
        try {
            InetAddress netAddress = InetAddress.getLocalHost();
            if (netAddress != null) {
                request.setSpbillCreateIp(netAddress.getHostAddress());
            }
        } catch (UnknownHostException e) {
            LOGGER.error(e.getMessage(), e);
        }
        request.setTradeType(WxPayConstants.TradeType.JSAPI);
        request.setOpenid(item.getOpenId());
        String getRequestUrl = servletRequest.getRequestURL().toString();
        String doMain = DoMainUtil.getDoMain(getRequestUrl);
        request.setNotifyUrl("http://" + doMain + "/pay/notify/order");
        WxPayMpOrderResult createOrder = this.wxPayService.createOrder(request);
        LOGGER.info("createOrder:{}", createOrder);
        if (createOrder != null) {
            SysOrderDTO newOrder = new SysOrderDTO();
            newOrder.setId(item.getId());
            String packageValue = createOrder.getPackageValue();
            if (StringUtil.isNotBlank(packageValue)) {
                String[] split = packageValue.split("=");
                newOrder.setPayNo(split[1]);
                newOrder.setUpdateTime(new Date());
                sysOrderFacade.updateSysOrder(newOrder);
            }
            return AjaxResult.success(createOrder);
        }
        return AjaxResult.error();

    }


    /**
     * 支付回调通知处理
     *
     * @param xmlData
     * @return
     * @throws WxPayException
     */
    @PostMapping("/notify/order")
    public String parseOrderNotifyResult(@RequestBody String xmlData) throws WxPayException {
        final WxPayOrderNotifyResult notifyResult = this.wxPayService.parseOrderNotifyResult(xmlData);
        // TODO 根据自己业务场景需要构造返回对象
        return WxPayNotifyResponse.success("成功");
    }

}
