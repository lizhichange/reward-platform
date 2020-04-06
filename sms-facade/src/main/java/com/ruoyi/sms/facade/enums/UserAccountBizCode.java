package com.ruoyi.sms.facade.enums;

import org.near.toolkit.model.BaseEnum;

import lombok.Getter;

/**
 * @author lizhi
 * @date 2018-7-21
 */
@Getter
public enum UserAccountBizCode implements BaseEnum {

    /**
     * 订单返利
     */
    ORDER_REBATE("ORDER_REBATE", "订单返利"),

    /**
     * 用户提现
     */
    WITHDRAW("WITHDRAW", "用户提现"),
    /**
     * REFUND
     */

    REFUND("REFUND", "提现退款"),


    /**
     * 粉丝订单
     */
    FANS_ORDER("FANS_ORDER", "粉丝订单"),

    ;

    String code;
    String desc;

    UserAccountBizCode(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }
}