/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.reward.facade.request;


import lombok.Getter;
import lombok.Setter;
import org.near.toolkit.model.ToString;

/**
 * @author lizhi
 */
@Getter
@Setter
public class UserAccountOperatorRequest extends ToString {
    private static final long serialVersionUID = -1775181575202859234L;

    /**
     * 用户唯一标识
     */
    private String userId;
    /**
     * 浮动数值，金额时单位为分
     */
    private Long amount;
    /**
     * 账户变动描述
     */
    private String remark;
    /**
     * 业务代码
     */
    private String bizCode;
    /**
     * 账户资产来源关联业务流水号
     */
    private String sourceCode;
    /**
     * 操作类型 [0:收入][1:支出]',
     */

    private String optType;

    /**
     * @mbg.generated 2018-12-06 09:58:55
     * user_account.user_account_type
     * 账户类型
     */
    private String userAccountType;
}
