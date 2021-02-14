/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.reward.facade.enums;

import org.near.toolkit.model.BaseEnum;

/**
 * 主体类型枚举
 *
 * @author Willard.Hu on 2017/10/31.
 */
public enum PrincipalType implements BaseEnum {
    /**
     * 普通用户
     */
    USER("1", "普通用户"),
    /**
     * 商户
     */
    MERCHANT("2", "商户"),
    /**
     * 平台操作员
     */
    ADMIN("3", "平台操作员");

    String code;
    String desc;

    PrincipalType(String code, String desc) {
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
