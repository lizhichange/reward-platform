/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.sms.facade.request;


import lombok.Getter;
import lombok.Setter;
import org.near.toolkit.model.ToString;

/**
 * @author lizhi
 */
@Getter
@Setter
public class UserAccountCreateRequest extends ToString {
    private static final long serialVersionUID = 7760790111410635379L;

    /**
     * 用户唯一标识
     */
    private String userId;

    /**
     * @mbg.generated 2018-12-06 09:58:55
     * <p>
     * 账户类型
     */
    private String userAccountType;
}
