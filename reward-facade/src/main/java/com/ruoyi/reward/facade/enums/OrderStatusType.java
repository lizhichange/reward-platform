package com.ruoyi.reward.facade.enums;

import lombok.Getter;
import org.near.toolkit.model.BaseEnum;

/**
 * @author sunflower
 */

@Getter
public enum OrderStatusType implements BaseEnum {


    /**
     * 未支付 ,待确认
     */
    N_PAY("0", "未支付"),

    /**
     * 已支付 ,待确认
     */
    Y_PAY("1", "已支付"),

    /**
     * 支付中 ,待确认
     */

    PAY_ING("2", "支付中"),


    ;


    String code;
    String desc;

    OrderStatusType(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }
    @Override
    public String getCode() {
        return code;
    }

    @Override
    public String getDesc() {
        return desc;
    }

}