package com.ruoyi.reward.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author sunflower
 */
@Data
public class AccountDetailDTO implements Serializable {
    /**
     * account_detail.id
     * 主键
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private Long id;

    /**
     * account_detail.account_id
     * 账户唯一id
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private String accountId;

    /**
     * account_detail.amount
     * 金额 分为单位
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private Long amount;

    /**
     * account_detail.opt_type
     * 操作类型 [0:收入][1:支出]
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private String optType;

    /**
     * account_detail.remark
     * 描述
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private String remark;

    /**
     * account_detail.out_trade_no
     * 订单id
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private String outTradeNo;

    /**
     * account_detail.biz_code
     * 业务代码
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private String bizCode;

    /**
     * account_detail.source_code
     * 来源业务编码
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private String sourceCode;

    /**
     * account_detail.gmt_create
     * 创建时间
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private Date gmtCreate;

    /**
     * account_detail.gmt_modified
     * 修改时间
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private Date gmtModified;

    /**
     * account_detail.operator
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private String operator;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public String getOptType() {
        return optType;
    }

    public void setOptType(String optType) {
        this.optType = optType;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
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

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }
}