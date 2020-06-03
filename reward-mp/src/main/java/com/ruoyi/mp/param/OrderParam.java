package com.ruoyi.mp.param;

import lombok.Data;
import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */
@Data
public class OrderParam extends ToString {
    //{"time":"2018-09-20 23:18:00","money":"139.34","title":"微信支付","content":"测试收款","deviceid":"yourdeviceid","encrypt":"0"}
    private String orderId;
    private String tradeType;

}
