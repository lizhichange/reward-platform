package com.ruoyi.reward.facade.enums;

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

    /**
     * 微信原生扫码支付
     */
    NATIVE("2", "微信原生扫码支付"),
    /**
     * 公众号支付
     */
    JSAPI("3", "微信公众号支付"),
    /**
     * 支付宝生成动态码支付
     */
    aliPay_transfer("4", "支付宝生成动态码支付"),


    ;

    String code;
    String desc;

    OrderPayType(String code, String desc) {
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