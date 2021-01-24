package com.ruoyi.mp.controller;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.Feature;
import com.github.binarywang.wxpay.v3.util.AesUtils;
import com.google.common.collect.Maps;
import com.ruoyi.mp.client.AccountFacadeClient;
import com.ruoyi.mp.client.SysConfigFacadeClient;
import com.ruoyi.mp.client.SysOrderFacadeClient;
import com.ruoyi.mp.model.PayResult;
import com.ruoyi.mp.param.OrderParam;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import io.swagger.annotations.ApiOperation;
import jodd.util.StringUtil;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.util.http.URIUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.near.toolkit.model.AjaxResult;
import org.near.toolkit.model.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/qrCode")
@Slf4j
public class QrCodePayController {
    @Autowired
    SysOrderFacadeClient sysOrderFacadeClient;
    @Autowired
    RestTemplate restTemplate;
    @Autowired
    SysConfigFacadeClient sysConfigFacadeClient;
    @Autowired
    AccountFacadeClient accountFacadeClient;
    @Autowired
    ThreadPoolTaskExecutor threadPoolTaskExecutor;

    private static String checkUrl = "http://payapi.ttyerh45.cn/pay/checkTradeNo"; // 主动查单地址

    @GetMapping("/qrcode")
    public String qrcode(ModelMap modelMap, @RequestParam(value = "orderId") String orderId,
                         @RequestParam(value = "callbackUrl") String callbackUrl,
                         HttpServletRequest request) throws Exception {
        pay(modelMap, "qrcode", orderId, "tradeType", callbackUrl);
        return "qrcode";
    }

    @GetMapping("/h5")
    public String h5(ModelMap modelMap,
                     @RequestParam(value = "orderId") String orderId,
                     @RequestParam(value = "tradeType") String tradeType,
                     @RequestParam(value = "callbackUrl") String callbackUrl) throws Exception {
        pay(modelMap, "wap", orderId, tradeType, callbackUrl);
        return "h5";
    }

    private SysOrderDTO getSysOrderDTO(String orderId) {
        Assert.notNull(orderId, "orderId is not null");
        SysOrderDTO selectSysOrder = new SysOrderDTO();
        selectSysOrder.setOrderId(orderId);
        List<SysOrderDTO> list = sysOrderFacadeClient.selectSysOrderList(selectSysOrder);
        if (CollectionUtils.isEmpty(list)) {
            throw new RuntimeException("系统异常");
        }
        return list.get(0);
    }

    @PostMapping("/notify/checkUrl")
    @ResponseBody
    @ApiOperation("checkUrl")
    public AjaxResult checkUrl(OrderParam param) {
        log.info("param:{}", param);
        SysOrderDTO item = sysOrderFacadeClient.selectSysOrderByOrderId(param.getBillNo());
        if (item == null) {
            throw new RuntimeException("系统异常");
        }
        boolean equals = item.getStatus().toString().equals(OrderStatusType.Y_PAY.getCode());
        if (equals) {
            // 支付成功
            return AjaxResult.success();
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        Map<String, String> map = Maps.newHashMap();
        String tradeNo = param.getTradeNo();
        map.put("tradeNo:", tradeNo);
        String content = JSONObject.toJSONString(map);
        HttpEntity<String> request = new HttpEntity<>(content, headers);
        ResponseEntity<String> postForEntity = restTemplate.postForEntity(checkUrl, request, String.class);
        log.info("postForEntity:{}", postForEntity);
        if (postForEntity.getStatusCode() == HttpStatus.OK) {
            String body = postForEntity.getBody();
            CheckResult checkResult = JSONObject.parseObject(body, CheckResult.class, new Feature[0]);
            // 支付成功
            if (checkResult != null && checkResult.getCode() == 0) {
                SysOrderDTO newOrder = new SysOrderDTO();
                newOrder.setId(item.getId());
                newOrder.setOrderId(item.getOrderId());
                newOrder.setStatus(Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
                try {
                    accountFacadeClient.take(newOrder);
                } catch (Exception e) {
                    log.error(e.getMessage(), e);
                }
            }
            return AjaxResult.success();
        }
        return AjaxResult.error("订单未支付");
    }


    @Data
    class CheckResult extends ToString {
        private int code;
        private String message;
        private int tradeStatus;
        private String billNo;
    }

    @PostMapping("/notify/order")
    @ResponseBody
    @ApiOperation("支付回调通知处理")
    public String parseOrderNotifyResult(String xmlData) throws Exception {
        return "";
    }

    public void pay(ModelMap modelMap, String way,
                    String orderId,
                    String tradeType,
                    String callbackUrl) throws Exception {
        modelMap.addAttribute("returnUrl", URIUtil.encodeURIComponent(callbackUrl));

        String notifyUrl = sysConfigFacadeClient.selectConfigByKey("wxPayUrl");
        notifyUrl = notifyUrl + "/qrCode/notify/order";
        SysOrderDTO sysOrderDTO = getSysOrderDTO(orderId);
        String merchantKey = "8387ea13ff584f77cb5309125897a0d047a7e07c38f3ac961c7c98833fe06501";
        String payUrl = "http://payapi.ttyerh45.cn/game/unifiedorder"; //请求订单地址
        modelMap.addAttribute("checkUrl", checkUrl);
        String mchId = "600500053"; //商户ID，后台提取
        String totalAmount = sysOrderDTO.getMoney().toString(); //金额
        String billDesc = "在线充值"; //商品名称
        String payment = "wechat"; //微信支付
        String attach = "123";
        //收款账号
        Map<String, String> map = Maps.newHashMap();
        map.put("mchId", mchId);
        map.put("billNo", orderId);
        map.put("totalAmount", totalAmount);
        map.put("billDesc", billDesc);
        map.put("way", way);
        map.put("payment", payment);
        map.put("returnUrl", AesUtils.HMACSHA256(callbackUrl, merchantKey));
        map.put("notifyUrl", AesUtils.HMACSHA256(notifyUrl, merchantKey));
        map.put("attach", attach);
        String sign = sign(map, merchantKey, true);
        map.put("sign", sign);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String content = JSONObject.toJSONString(map);
        HttpEntity<String> request = new HttpEntity<>(content, headers);
        ResponseEntity<String> postForEntity = restTemplate.postForEntity(payUrl, request, String.class);
        log.info("postForEntity:{}", postForEntity);
        if (postForEntity.getStatusCode() == HttpStatus.OK) {
            String body = postForEntity.getBody();
            PayResult result = JSONObject.parseObject(body, PayResult.class);
            if (result != null && result.getCode() == 0) {
                result.getResult().setLinkUrl(URIUtil.encodeURIComponent(result.getResult().getLinkUrl()));
                modelMap.addAttribute("result", result.getResult());
                String tradeNo = result.getResult().getTradeNo();
                if (StringUtil.isNotBlank(tradeNo)) {
                    SysOrderDTO newOrder = new SysOrderDTO();
                    newOrder.setId(sysOrderDTO.getId());
                    newOrder.setPayNo(tradeNo);
                    newOrder.setStatus(Integer.valueOf(OrderStatusType.PAY_ING.getCode()));
                    sysOrderFacadeClient.updateSysOrder(newOrder);

                }
            }
        }
    }


    String sign(Map<String, String> params, String signKey, Boolean is) {
        SortedMap<String, String> sortedMap = new TreeMap<>(params);
        StringBuilder toSign = new StringBuilder();
        for (String key : sortedMap.keySet()) {
            String value = params.get(key);
            toSign.append(key).append("=").append(value);
            if (is) {
                toSign.append("&");
            }
        }
        toSign.append("key=").append(signKey);
        log.info("toSign:{}", toSign);
        return DigestUtils.md5Hex(toSign.toString()).toUpperCase();

    }

}
