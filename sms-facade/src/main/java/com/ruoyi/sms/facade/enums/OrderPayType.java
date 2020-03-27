package com.ruoyi.sms.facade.enums;

import lombok.Getter;
import org.near.toolkit.model.BaseEnum;

/**
 * @author sunflower
 */

@Getter
public enum OrderPayType implements BaseEnum {

    /**
     * 支付方式
     */
    WE_CHAT_PAY("1", "微信支付"),
    N("0", "未使用"),
    ;

    String code;
    String desc;

    OrderPayType(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }
}