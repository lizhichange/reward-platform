package com.ruoyi.reward.facade.enums;

import lombok.Getter;
import org.near.toolkit.model.BaseEnum;

@Getter
public enum PayeeType implements BaseEnum {
    /**
     * 银行
     */
    bank("bank", "银行"),
    /**
     * 支付宝
     */
    alipay("alipay", "支付宝"),


    ;

    String code;
    String desc;

    PayeeType(String code, String desc) {
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
