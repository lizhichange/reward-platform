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

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getBizCode() {
        return bizCode;
    }

    public void setBizCode(String bizCode) {
        this.bizCode = bizCode;
    }

    public String getSourceCode() {
        return sourceCode;
    }

    public void setSourceCode(String sourceCode) {
        this.sourceCode = sourceCode;
    }

    public String getOptType() {
        return optType;
    }

    public void setOptType(String optType) {
        this.optType = optType;
    }

    public String getUserAccountType() {
        return userAccountType;
    }

    public void setUserAccountType(String userAccountType) {
        this.userAccountType = userAccountType;
    }
}
