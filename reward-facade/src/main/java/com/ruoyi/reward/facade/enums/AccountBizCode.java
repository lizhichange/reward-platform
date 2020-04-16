package com.ruoyi.reward.facade.enums;

import lombok.Getter;
import org.near.toolkit.model.BaseEnum;


/**
 * @author lizhi
 * @date 2018-7-21
 */
@Getter
public enum AccountBizCode implements BaseEnum {


    /**
     * 订单推广商户返利
     */
    ORDER_REBATE("ORDER_REBATE", "订单推广商户返利"),
    /**
     * 订单视频作者返利
     */
    ORDER_AUTHOR_REBATE("ORDER_AUTHOR_REBATE", "订单视频作者返利"),


    /**
     * 用户提现
     */
    WITHDRAW("WITHDRAW", "用户提现"),
    /**
     * REFUND
     */

    REFUND("REFUND", "提现退款"),


    ;

    String code;
    String desc;

    AccountBizCode(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }
}