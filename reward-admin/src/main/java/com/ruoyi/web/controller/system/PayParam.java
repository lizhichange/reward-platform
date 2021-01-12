package com.ruoyi.web.controller.system;

import org.near.toolkit.model.ToString;

public class PayParam extends ToString {

    /**
     * merchantCode : 商户号
     * sign : 签名
     * body : {"amount":"100","merchantOrderCode":"1600691497602","channelType":"2:1","noticeUrl":"https://www.baidu.com"}
     */

    private String merchantCode;
    private String sign;
    /**
     * amount : 100
     * merchantOrderCode : 1600691497602
     * channelType : 2:1
     * noticeUrl : https://www.baidu.com
     */

    private BodyBean body;

    public String getMerchantCode() {
        return merchantCode;
    }

    public void setMerchantCode(String merchantCode) {
        this.merchantCode = merchantCode;
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
        private String amount;
        private String merchantOrderCode;
        private String channelType;
        private String noticeUrl;
        private String returnUrl;
        public String getAmount() {
            return amount;
        }

        public void setAmount(String amount) {
            this.amount = amount;
        }

        public String getMerchantOrderCode() {
            return merchantOrderCode;
        }

        public void setMerchantOrderCode(String merchantOrderCode) {
            this.merchantOrderCode = merchantOrderCode;
        }

        public String getChannelType() {
            return channelType;
        }

        public void setChannelType(String channelType) {
            this.channelType = channelType;
        }

        public String getNoticeUrl() {
            return noticeUrl;
        }

        public void setNoticeUrl(String noticeUrl) {
            this.noticeUrl = noticeUrl;
        }

        public String getReturnUrl() {
            return returnUrl;
        }

        public void setReturnUrl(String returnUrl) {
            this.returnUrl = returnUrl;
        }
    }
}
