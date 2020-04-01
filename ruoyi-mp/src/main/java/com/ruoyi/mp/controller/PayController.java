package com.ruoyi.mp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.binarywang.wxpay.bean.notify.WxPayNotifyResponse;
import com.github.binarywang.wxpay.bean.notify.WxPayOrderNotifyResult;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.bean.result.WxPayUnifiedOrderResult;
import com.github.binarywang.wxpay.constant.WxPayConstants;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.sms.facade.ISysOrderFacade;
import com.ruoyi.sms.facade.ISysWebMainFacade;
import com.ruoyi.sms.facade.dto.SysOrderDTO;
import lombok.extern.slf4j.Slf4j;
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

    @GetMapping
    public String pay(@RequestParam(value = "orderId") String orderId, ModelMap modelmap,

                      HttpServletRequest servletRequest) throws Exception {
        LOGGER.info("orderId:{}", orderId);
        Assert.notNull(orderId, "orderId is not null");
        SysOrderDTO sysOrderDTO = new SysOrderDTO();
        sysOrderDTO.setOrderId(orderId);
        List<SysOrderDTO> list = sysOrderFacade.selectSysOrderList(sysOrderDTO);
        if (CollectionUtils.isEmpty(list)) {
            throw new Exception("系统异常");
        }
        SysOrderDTO item = list.get(0);
        modelmap.addAttribute("order", item);
        WxPayUnifiedOrderRequest request = new WxPayUnifiedOrderRequest();
        request.setOutTradeNo(item.getOrderId());
        if (mpAuthConfig.isMockMoney()) {
            request.setTotalFee(1);
        } else {
            request.setTotalFee(item.getMoney());
        }
        request.setBody("会员充值");

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
        String getRequestUrl = servletRequest.getRequestURI();
        request.setNotifyUrl(getRequestUrl + "/notify/order");
        WxPayUnifiedOrderResult createOrder = this.wxPayService.createOrder(request);
        if (createOrder != null) {

        }
        LOGGER.info("createOrder:{}", createOrder);
        return "pay";
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
