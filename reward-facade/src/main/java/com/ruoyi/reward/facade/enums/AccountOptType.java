package com.ruoyi.reward.facade.enums;


import lombok.Getter;
import org.near.toolkit.model.BaseEnum;

/**
 * @author lizhi
 * @date 2018-7-12
 */
@Getter
public enum AccountOptType implements BaseEnum {
    /**
     * 收入
     */
    INCOME("0", "收入"),
    /**
     * 支出
     */
    OUTLAY("1", "支出"),
    ;

    String code;
    String desc;

    AccountOptType(String code, String desc) {
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