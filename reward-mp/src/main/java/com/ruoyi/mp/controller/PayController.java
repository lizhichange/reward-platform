package com.ruoyi.mp.controller;

import cn.hutool.core.util.RandomUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.alibaba.dubbo.config.annotation.Reference;
import com.github.binarywang.wxpay.bean.entpay.EntPayRequest;
import com.github.binarywang.wxpay.bean.entpay.EntPayResult;
import com.github.binarywang.wxpay.bean.notify.WxPayNotifyResponse;
import com.github.binarywang.wxpay.bean.notify.WxPayOrderNotifyResult;
import com.github.binarywang.wxpay.bean.notify.WxScanPayNotifyResult;
import com.github.binarywang.wxpay.bean.order.WxPayMpOrderResult;
import com.github.binarywang.wxpay.bean.order.WxPayNativeOrderResult;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.constant.WxPayConstants;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.EntPayService;
import com.github.binarywang.wxpay.service.WxPayService;
import com.google.common.collect.Maps;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.mp.factory.ConfigFactory;
import com.ruoyi.mp.util.AjaxResult;
import com.ruoyi.reward.facade.api.IAccountFacade;
import com.ruoyi.reward.facade.api.ISysOrderFacade;
import com.ruoyi.reward.facade.api.ISysWebMainFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.DateUtils;
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
import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/pay")
@Slf4j
@Api("支付")
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
    @Reference(version = "1.0.0", check = false)
    IAccountFacade accountFacade;
    @Autowired
    ConfigFactory configFactory;

    @GetMapping
    public String pay(@RequestParam(value = "orderId") String orderId,
                      @RequestParam(value = "tradeType") String tradeType,
                      ModelMap modelmap,
                      HttpServletRequest request) throws Exception {
        String ua = request.getHeader("User-Agent").toLowerCase();
        UserAgent parse = UserAgentUtil.parse(ua);
        if (!parse.isMobile()) {
            throw new Exception("系统异常,请使用移动端打开");
        }
        LOGGER.info("orderId:{},payType:{}", orderId, tradeType);
        SysOrderDTO item = getSysOrderDTO(orderId);
        item.setTradeType(tradeType);
        modelmap.addAttribute("order", item);
        if (StringUtil.equals(WxPayConstants.TradeType.JSAPI, tradeType)) {

            return "jsApiPay";
        }

        AjaxResult ajaxResult = create(item, request);
        log.info("ajax:{}", ajaxResult);
        if (ajaxResult != null) {
            Integer code = (Integer) ajaxResult.get("code");
            if (code == 0) {
                HashMap data = (HashMap) ajaxResult.get("data");
                WxPayNativeOrderResult result = (WxPayNativeOrderResult) data.get("data");
                modelmap.addAttribute("result", result);
                int timeExpire = (int) data.get("timeExpire");
                modelmap.addAttribute("timeExpire", timeExpire);
            }
        }
        return "nativePay";
    }

    @PostMapping("/queryOrder")
    @ResponseBody
    public AjaxResult queryOrder(String orderId) throws Exception {
        return AjaxResult.success(getSysOrderDTO(orderId));
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
        return create(dto, servletRequest);
    }

    private AjaxResult create(SysOrderDTO dto, HttpServletRequest servletRequest) throws Exception {
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
        request.setBody("支付测试");
        request.setMchId(configFactory.getSysWechatConfig().getMchId());
        try {
            InetAddress netAddress = InetAddress.getLocalHost();
            if (netAddress != null) {
                request.setSpbillCreateIp(netAddress.getHostAddress());
            }
        } catch (UnknownHostException e) {
            LOGGER.error(e.getMessage(), e);
        }

        if (StringUtil.equals(dto.getTradeType(), WxPayConstants.TradeType.JSAPI)) {
            return tradeTypeJsApi(servletRequest, item, request);
        }
        return tradeTypeNative(servletRequest, item, request);
    }

    private AjaxResult tradeTypeJsApi(HttpServletRequest servletRequest, SysOrderDTO item, WxPayUnifiedOrderRequest request) throws WxPayException {
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
                //支付中
                newOrder.setStatus(Integer.valueOf(OrderStatusType.PAY_ING.getCode()));
                LOGGER.info("newOrder:{}", newOrder);
                sysOrderFacade.updateSysOrder(newOrder);
            }
            HashMap<String, Object> map = Maps.newHashMap();
            map.put("type", WxPayConstants.TradeType.JSAPI);
            map.put("data", createOrder);
            return AjaxResult.success(map);
        }
        return AjaxResult.error();
    }


    private AjaxResult tradeTypeNative(HttpServletRequest servletRequest, SysOrderDTO item, WxPayUnifiedOrderRequest request) throws WxPayException {
        request.setTradeType(WxPayConstants.TradeType.NATIVE);
        request.setProductId(item.getGoodsId().toString());
        String getRequestUrl = servletRequest.getRequestURL().toString();
        String doMain = DoMainUtil.getDoMain(getRequestUrl);
        //2分钟
        Date date = DateUtils.addMinutes(new Date(), 1);
        String timeExpire = DateUtils.formatLongFormat(date);
        request.setTimeExpire(timeExpire);
        request.setNotifyUrl("http://" + doMain + "/pay/notify/order");
        WxPayNativeOrderResult createOrder = wxPayService.createOrder(request);
        LOGGER.info("createOrder:{}", createOrder);
        if (createOrder != null && StringUtil.isNotBlank(createOrder.getCodeUrl())) {
            SysOrderDTO newOrder = new SysOrderDTO();
            newOrder.setId(item.getId());
            //支付失效时间
            newOrder.setParam(timeExpire);
            newOrder.setStatus(Integer.valueOf(OrderStatusType.PAY_ING.getCode()));
            LOGGER.info("newOrder:{}", newOrder);
            sysOrderFacade.updateSysOrder(newOrder);
            HashMap<String, Object> map = Maps.newHashMap();
            map.put("type", WxPayConstants.TradeType.NATIVE);
            map.put("data", createOrder);
            //分给前端
            map.put("timeExpire", 1);
            return AjaxResult.success(map);
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
    @ResponseBody
    public String parseOrderNotifyResult(@RequestBody String xmlData) throws Exception {
        Assert.notNull(xmlData, "xmlData is not null");
        log.info("支付成功回调信息,xmlData:{}", xmlData);
        final WxPayOrderNotifyResult notifyResult = this.wxPayService.parseOrderNotifyResult(xmlData);
        if (notifyResult != null && notifyResult.getReturnCode().equals(WxPayConstants.ResultCode.SUCCESS)) {
            SysOrderDTO newOrder = new SysOrderDTO();
            String orderId = notifyResult.getOutTradeNo();
            newOrder.setOrderId(orderId);
            //支付中
            newOrder.setStatus(Integer.valueOf(OrderStatusType.PAY_ING.getCode()));
            List<SysOrderDTO> dtoList = sysOrderFacade.selectSysOrderListExt(newOrder);
            if (CollectionUtils.isEmpty(dtoList)) {
                return WxPayNotifyResponse.fail("FAIL");
            }
            try {
                newOrder.setPayTime(DateUtils.parseLongFormat(notifyResult.getTimeEnd()));
            } catch (ParseException ignored) {
            }
            String transactionId = notifyResult.getTransactionId();
            log.info("回调成功,transactionId:{},outTradeNo:{}", transactionId, notifyResult.getOutTradeNo());
            Date now = new Date();
            newOrder.setPayTime(now);
            newOrder.setPayNo(transactionId);
            newOrder.setStatus(Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
            LOGGER.info("newOrder:{}", newOrder);
            accountFacade.take(newOrder);
            return WxPayNotifyResponse.success("SUCCESS");
        }
        return WxPayNotifyResponse.fail("FAIL");
    }

    /**
     * <pre>
     * 企业付款业务是基于微信支付商户平台的资金管理能力，为了协助商户方便地实现企业向个人付款，针对部分有开发能力的商户，提供通过API完成企业付款的功能。
     * 比如目前的保险行业向客户退保、给付、理赔。
     * 企业付款将使用商户的可用余额，需确保可用余额充足。查看可用余额、充值、提现请登录商户平台“资金管理”https://pay.weixin.qq.com/进行操作。
     * 注意：与商户微信支付收款资金并非同一账户，需要单独充值。
     * 文档详见:https://pay.weixin.qq.com/wiki/doc/api/tools/mch_pay.php?chapter=14_2
     * 接口链接：https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers
     * </pre>
     *
     * @param request 请求对象
     */
    @PostMapping("/entPay")
    @ApiOperation("企业付款")
    @ApiImplicitParam(name = "request", value = "企业付款", dataType = "EntPayRequest")
    public EntPayResult entPay(@RequestBody EntPayRequest request) throws WxPayException {
        EntPayService entPayService = wxPayService.getEntPayService();
        return entPayService.entPay(request);
    }

    @ApiOperation(value = "扫码支付回调通知处理")
    @PostMapping("/notify/scanpay")
    public String parseScanPayNotifyResult(String xmlData) throws WxPayException {
        final WxScanPayNotifyResult result = this.wxPayService.parseScanPayNotifyResult(xmlData);
        // TODO 根据自己业务场景需要构造返回对象
        return WxPayNotifyResponse.success("成功");
    }

    /**
     * <pre>
     * 扫码支付模式一生成二维码的方法
     * 二维码中的内容为链接，形式为：
     * weixin://wxpay/bizpayurl?sign=XXXXX&appid=XXXXX&mch_id=XXXXX&product_id=XXXXXX&time_stamp=XXXXXX&nonce_str=XXXXX
     * 其中XXXXX为商户需要填写的内容，商户将该链接生成二维码，如需要打印发布二维码，需要采用此格式。商户可调用第三方库生成二维码图片。
     * 文档详见: https://pay.weixin.qq.com/wiki/doc/api/native.php?chapter=6_4
     * </pre>
     *
     * @param productId  产品Id
     * @param logoFile   商户logo图片的文件对象，可以为空
     * @param sideLength 要生成的二维码的边长，如果为空，则取默认值400
     * @return 生成的二维码的字节数组
     */
    public byte[] createScanPayQrcodeMode1(String productId, File logoFile, Integer sideLength) {
        return this.wxPayService.createScanPayQrcodeMode1(productId, logoFile, sideLength);
    }

    /**
     * <pre>
     * 扫码支付模式一生成二维码的方法
     * 二维码中的内容为链接，形式为：
     * weixin://wxpay/bizpayurl?sign=XXXXX&appid=XXXXX&mch_id=XXXXX&product_id=XXXXXX&time_stamp=XXXXXX&nonce_str=XXXXX
     * 其中XXXXX为商户需要填写的内容，商户将该链接生成二维码，如需要打印发布二维码，需要采用此格式。商户可调用第三方库生成二维码图片。
     * 文档详见: https://pay.weixin.qq.com/wiki/doc/api/native.php?chapter=6_4
     * </pre>
     *
     * @param productId 产品Id
     * @return 生成的二维码URL连接
     */
    public String createScanPayQrcodeMode1(String productId) {
        return this.wxPayService.createScanPayQrcodeMode1(productId);
    }

    /**
     * <pre>
     * 扫码支付模式二生成二维码的方法
     * 对应链接格式：weixin：//wxpay/bizpayurl?sr=XXXXX。请商户调用第三方库将code_url生成二维码图片。
     * 该模式链接较短，生成的二维码打印到结账小票上的识别率较高。
     * 文档详见: https://pay.weixin.qq.com/wiki/doc/api/native.php?chapter=6_5
     * </pre>
     *
     * @param codeUrl    微信返回的交易会话的二维码链接
     * @param logoFile   商户logo图片的文件对象，可以为空
     * @param sideLength 要生成的二维码的边长，如果为空，则取默认值400
     * @return 生成的二维码的字节数组
     */
    public byte[] createScanPayQrcodeMode2(String codeUrl, File logoFile, Integer sideLength) {
        return this.wxPayService.createScanPayQrcodeMode2(codeUrl, logoFile, sideLength);
    }
}
