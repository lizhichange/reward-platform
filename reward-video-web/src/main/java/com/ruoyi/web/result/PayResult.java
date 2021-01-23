package com.ruoyi.web.result;

import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */
public class PayResult extends ToString {

    /**
     * code : 0
     * message : 订单创建成功
     * result : {"tradeNo":"138544337733963776","billNo":"1610868831352","totalAmount":5,"payInfo":"https://wx.tenpay.com/cgi-bin/mmpayweb-bin/checkmweb?prepay_id=wx171533520354621738977726dda1910000&package=3304172131","linkUrl":"http://payapi.ttyerh45.cn/pay/send?tradeNo=138544337733963776&sign=c2699dacbb221b760ade79e897fcbc41","h5pay":"weixin://wap/pay?prepayid%3Dwx171533520354621738977726dda1910000&package=3304172131&noncestr=1610868832&sign=c7bf18d9c5be4abde8bd406eba9eb7fa"}
     */

    private int code;
    private String message;
    /**
     * tradeNo : 138544337733963776
     * billNo : 1610868831352
     * totalAmount : 5
     * payInfo : https://wx.tenpay.com/cgi-bin/mmpayweb-bin/checkmweb?prepay_id=wx171533520354621738977726dda1910000&package=3304172131
     * linkUrl : http://payapi.ttyerh45.cn/pay/send?tradeNo=138544337733963776&sign=c2699dacbb221b760ade79e897fcbc41
     * h5pay : weixin://wap/pay?prepayid%3Dwx171533520354621738977726dda1910000&package=3304172131&noncestr=1610868832&sign=c7bf18d9c5be4abde8bd406eba9eb7fa
     */

    private ResultBean result;

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

    public ResultBean getResult() {
        return result;
    }

    public void setResult(ResultBean result) {
        this.result = result;
    }

    public static class ResultBean extends ToString {
        private String tradeNo;
        private String billNo;
        private int totalAmount;
        private String payInfo;
        private String linkUrl;
        private String h5pay;

        public String getTradeNo() {
            return tradeNo;
        }

        public void setTradeNo(String tradeNo) {
            this.tradeNo = tradeNo;
        }

        public String getBillNo() {
            return billNo;
        }

        public void setBillNo(String billNo) {
            this.billNo = billNo;
        }

        public int getTotalAmount() {
            return totalAmount;
        }

        public void setTotalAmount(int totalAmount) {
            this.totalAmount = totalAmount;
        }

        public String getPayInfo() {
            return payInfo;
        }

        public void setPayInfo(String payInfo) {
            this.payInfo = payInfo;
        }

        public String getLinkUrl() {
            return linkUrl;
        }

        public void setLinkUrl(String linkUrl) {
            this.linkUrl = linkUrl;
        }

        public String getH5pay() {
            return h5pay;
        }

        public void setH5pay(String h5pay) {
            this.h5pay = h5pay;
        }
    }
}
