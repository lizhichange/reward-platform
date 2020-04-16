/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.reward.facade.enums;

import lombok.Getter;
import org.near.toolkit.model.BaseEnum;

/**
 * 主体类型枚举
 *
 * @author Willard.Hu on 2017/10/31.
 */
@Getter
public enum PrincipalTypeEnum implements BaseEnum {
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

    PrincipalTypeEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }


}
