package com.ruoyi.mp.controller;

import cn.hutool.core.util.RandomUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.alibaba.dubbo.common.URL;
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
import com.google.common.collect.Maps;
import com.ruoyi.mp.service.ImageService;
import com.ruoyi.mp.util.AjaxResult;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.DoMainUtil;
import org.near.toolkit.common.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.net.InetAddress;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/pay")
@Slf4j
@Api("支付")
public class PayController extends BaseController {
    private final static Logger LOGGER = LoggerFactory.getLogger(PayController.class);

    public static final String QRCODE_ENDPOINT = "/qrcode";
    public static final long THIRTY_MINUTES = 1800000;

    private final
    ImageService imageService;


    public PayController(ImageService imageService) {
        this.imageService = imageService;
    }

    @GetMapping
    public String pay(@RequestParam(value = "orderId") String orderId,
                      @RequestParam(value = "tradeType") String tradeType,
                      @RequestParam(value = "callbackUrl") String callbackUrl,
                      ModelMap modelmap,
                      HttpServletRequest request) throws Exception {
        LOGGER.info("orderId:{},payType:{}", orderId, tradeType);
        SysOrderDTO item = getSysOrderDTO(orderId);
        item.setTradeType(tradeType);
        modelmap.addAttribute("order", item);
        modelmap.addAttribute("callbackUrl", callbackUrl);
        if (StringUtil.equals(WxPayConstants.TradeType.JSAPI, tradeType)) {
            String ua = request.getHeader("User-Agent").toLowerCase();
            UserAgent parse = UserAgentUtil.parse(ua);
            if (!parse.isMobile()) {
                throw new Exception("系统异常,请使用移动端打开");
            }
            return "jsApiPay";
        } else if (StringUtil.equals(WxPayConstants.TradeType.NATIVE, tradeType)) {
            AjaxResult ajaxResult = create(item, request);
            log.info("ajax:{}", ajaxResult);
            if (ajaxResult != null) {
                Integer code = (Integer) ajaxResult.get("code");
                if (code == 0) {
                    HashMap<String, Object> data = (HashMap<String, Object>) ajaxResult.get("data");
                    WxPayNativeOrderResult result = (WxPayNativeOrderResult) data.get("data");
                    modelmap.addAttribute("result", result);
                    int timeExpire = (int) data.get("timeExpire");
                    modelmap.addAttribute("timeExpire", timeExpire);
                }
            }
            return "nativePay";
        } else if (StringUtil.equals("aliPay-transfer", tradeType)) {
            //支付宝支付
            String userId = sysConfigFacadeClient.selectConfigByKey("sys.aliPay.userId");
            if (StringUtil.isBlank(userId)) {
                throw new Exception("系统异常,userId is not null");
            }
            String amount = item.getMoneyStr();
            String memo = "pay";
            String qrCode = "alipays://platformapi/startapp?appId=09999988&actionType=toAccount&goBack=NO&amount=" + amount + "&userId=" + userId + "&memo=" + memo;
            String getRequestUrl = request.getRequestURL().toString();
            Assert.hasText(getRequestUrl, "getRequestUrl must not be empty");
            modelmap.addAttribute("qrCode", getRequestUrl + "/" + QRCODE_ENDPOINT + "?text=" + URL.encode(qrCode));
            return "aliPay";
        } else {
            String amount = item.getMoneyStr();
            ImageService.Result result = imageService.queryWeChatQrCode(amount, StringUtil.toLowerCase(tradeType));
            List<ImageService.Result.DataBean.RowsBean> rows = result.getData().getRows();
            ImageService.Result.DataBean.RowsBean rowsBean = rows.get(0);
            String getRequestUrl = request.getRequestURL().toString();
            modelmap.addAttribute("qrCode", getRequestUrl + "/" + QRCODE_ENDPOINT + "?text=" + URL.encode(rowsBean.getQr_url()));

        }
        return "aliPay";
    }


    @GetMapping(value = QRCODE_ENDPOINT, produces = MediaType.IMAGE_PNG_VALUE)
    public Mono<ResponseEntity<byte[]>> getQrCode(@RequestParam(value = "text") String text) {
        log.info("text:{}", text);
        return imageService.generateQRCode(text, 220, 220).map(imageBuff ->
                ResponseEntity.ok().cacheControl(CacheControl.maxAge(30, TimeUnit.MINUTES)).body(imageBuff)
        );
    }

    @Scheduled(fixedRate = THIRTY_MINUTES)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping(value = QRCODE_ENDPOINT)
    public void deleteAllCachedImages() {
        imageService.purgeCache();
    }

    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<String> handleRuntimeException(RuntimeException ex) {
        return ResponseEntity.status(500).contentType(MediaType.TEXT_PLAIN).body(ex.getMessage());
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
        List<SysOrderDTO> list = sysOrderFacadeClient.selectSysOrderList(sysOrderDTO);
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

    //对价格给一个后两位的随机减免
    int getMoney(Integer money) {
        int randomInt = 0;
        if (money == null || money == 0) {
            return randomInt;
        }
        //1-9
        if (money <= 10) {
            return RandomUtil.randomInt(1, money + 1);
        }
        //11-100
        if (money <= 100) {
            return RandomUtil.randomInt(money, 100);
        }
        return randomInt;
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
        InetAddress netAddress = InetAddress.getLocalHost();
        request.setSpbillCreateIp(netAddress.getHostAddress());
        if (StringUtil.equals(dto.getTradeType(), WxPayConstants.TradeType.JSAPI)) {
            return tradeTypeJsApi(servletRequest, item, request);
        }
        return tradeTypeNative(servletRequest, item, request);
    }

    private AjaxResult tradeTypeJsApi(HttpServletRequest servletRequest, SysOrderDTO item, WxPayUnifiedOrderRequest request) throws WxPayException {
        request.setTradeType(WxPayConstants.TradeType.JSAPI);
        Assert.hasText(item.getOpenId()
                , "openId is not null");
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
                sysOrderFacadeClient.updateSysOrder(newOrder);
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
        Date date = DateUtils.addMinutes(new Date(), 2);
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
            sysOrderFacadeClient.updateSysOrder(newOrder);
            HashMap<String, Object> map = Maps.newHashMap();
            map.put("type", WxPayConstants.TradeType.NATIVE);
            map.put("data", createOrder);
            //分给前端
            map.put("timeExpire", 2);
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
            List<SysOrderDTO> dtoList = sysOrderFacadeClient.selectSysOrderListExt(newOrder);
            if (CollectionUtils.isEmpty(dtoList)) {
                return WxPayNotifyResponse.fail("FAIL");
            }
            newOrder.setPayTime(DateUtils.parseLongFormat(notifyResult.getTimeEnd()));
            String transactionId = notifyResult.getTransactionId();
            log.info("回调成功,transactionId:{},outTradeNo:{}", transactionId, notifyResult.getOutTradeNo());
            newOrder.setPayNo(transactionId);
            newOrder.setStatus(Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
            LOGGER.info("newOrder:{}", newOrder);
            accountFacadeClient.take(newOrder);
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
