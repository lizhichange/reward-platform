package com.ruoyi.reward.facade.enums;

import lombok.Getter;
import org.near.toolkit.model.BaseEnum;

/**
 * @author sunflower
 */

@Getter
public enum TradeStateEnum implements BaseEnum {
    /**
     * 未支付 ,待确认
     */
    N_PAY("0", "未支付"),

    /**
     * 已支付 ,待确认
     */
    Y_PAY("1", "已支付"),
    ;
    String code;
    String desc;

    TradeStateEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }
}
