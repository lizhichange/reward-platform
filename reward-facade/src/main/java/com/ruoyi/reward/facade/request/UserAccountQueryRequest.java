/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.reward.facade.request;

import lombok.Getter;
import lombok.Setter;
import org.near.toolkit.model.ToString;

import java.util.List;

/**
 * @author lizhi
 */
@Getter
@Setter
public class UserAccountQueryRequest extends ToString {
    private static final long serialVersionUID = 1680198827869990027L;

    private Long lastId;

    private String userId;
    /**
     *
     */
    private List<String> bizCodes;
    /**
     *
     */
    private String optType;

    private Long amount;

    /**
     * user_account.user_account_type
     * 账户类型
     *
     * @mbg.generated 2018-12-06 09:58:55
     */
    private String userAccountType;
}
