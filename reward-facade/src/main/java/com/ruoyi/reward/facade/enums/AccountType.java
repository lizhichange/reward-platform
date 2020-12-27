package com.ruoyi.reward.facade.enums;

import lombok.Getter;
import org.near.toolkit.model.BaseEnum;


/**
 * @author lizhi
 * @date 2018-12-06
 */
@Getter
public enum AccountType implements BaseEnum {

    /**
     * 推广代理商户
     */
    PROMOTION_MERCHANT("PROMOTION_MERCHANT", "推广代理商户"),
    ;

    String code;
    String desc;

    AccountType(String code, String desc) {
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