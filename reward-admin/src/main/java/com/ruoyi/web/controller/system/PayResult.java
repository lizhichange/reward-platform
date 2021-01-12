package com.ruoyi.web.controller.system;

import org.near.toolkit.model.ToString;

public class PayResult extends ToString {


    /**
     * code : 200
     * message : 操作成功
     * exceptionMessage : null
     * dateTime : 2020-09-21 20:32:36
     * sign : 签名
     * body : {"platformOrderCode":"平台订单号","merchantOrderCode":null,"amount":null,"paymentUrl":"支付地址"}
     */

    private int code;
    private String message;
    private Object exceptionMessage;
    private String dateTime;
    private String sign;
    /**
     * platformOrderCode : 平台订单号
     * merchantOrderCode : null
     * amount : null
     * paymentUrl : 支付地址
     */

    private BodyBean body;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getExceptionMessage() {
        return exceptionMessage;
    }

    public void setExceptionMessage(Object exceptionMessage) {
        this.exceptionMessage = exceptionMessage;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public BodyBean getBody() {
        return body;
    }

    public void setBody(BodyBean body) {
        this.body = body;
    }

    public static class BodyBean {
        private String platformOrderCode;
        private Object merchantOrderCode;
        private Object amount;
        private String paymentUrl;

        public String getPlatformOrderCode() {
            return platformOrderCode;
        }

        public void setPlatformOrderCode(String platformOrderCode) {
            this.platformOrderCode = platformOrderCode;
        }

        public Object getMerchantOrderCode() {
            return merchantOrderCode;
        }

        public void setMerchantOrderCode(Object merchantOrderCode) {
            this.merchantOrderCode = merchantOrderCode;
        }

        public Object getAmount() {
            return amount;
        }

        public void setAmount(Object amount) {
            this.amount = amount;
        }

        public String getPaymentUrl() {
            return paymentUrl;
        }

        public void setPaymentUrl(String paymentUrl) {
            this.paymentUrl = paymentUrl;
        }
    }
}
