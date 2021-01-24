package com.ruoyi.mp.param;


import lombok.Getter;
import lombok.Setter;
import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */
@Getter
@Setter
public class OrderParam extends ToString {
    private String orderId;
    private String tradeType;
    private String billNo;
    private String tradeNo;


}
