package com.ruoyi.reward.facade.enums;

import lombok.Getter;
import org.near.toolkit.model.BaseEnum;


/**
 * @author lizhi
 * @date 2018-12-06
 */
@Getter
public enum YqmStatusEnum implements BaseEnum {

    /**
     * 已使用
     */
    Y("1", "已使用"),

    /**
     * 未使用
     */
    N("0", "未使用"),
    ;

    String code;
    String desc;

    YqmStatusEnum(String code, String desc) {
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