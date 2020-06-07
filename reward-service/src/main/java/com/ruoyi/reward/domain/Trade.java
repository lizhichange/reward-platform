package com.ruoyi.reward.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 交易信息对象 trade
 *
 * @author s
 * @date 2020-06-05
 */
public class Trade extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 交易号
     */
    private String tradeNo;

    /**
     *
     */
    @Excel(name = "付款类型")
    private String payerType;

    /**
     * 付款方
     */
    @Excel(name = "付款方")
    private String payer;

    /**
     *
     */
    @Excel(name = "收款类型")
    private String payeeType;

    /**
     * 收款方
     */
    @Excel(name = "收款方")
    private String payee;

    /**
     * 金额
     */
    @Excel(name = "金额")
    private Long amount;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private String state;

    /**
     * 交易分类
     */
    @Excel(name = "交易分类")
    private String category;

    /**
     * 支付方式
     */
    @Excel(name = "支付方式")
    private String payType;

    /**
     * 外部交易号
     */
    @Excel(name = "外部交易号")
    private String thirdTradeNo;

    /**
     * 描述
     */
    @Excel(name = "描述")
    private String description;

    /**
     * 创建时间
     */
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gmtCreate;

    /**
     * 修改时间
     */
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gmtModified;

    /**
     * 修改人
     */
    @Excel(name = "修改人")
    private String modifiedBy;

    /** 收款账号 */
    @Excel(name = "收款账号")
    private String payeeNo;

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setPayerType(String payerType) {
        this.payerType = payerType;
    }

    public String getPayerType() {
        return payerType;
    }

    public void setPayer(String payer) {
        this.payer = payer;
    }

    public String getPayer() {
        return payer;
    }

    public void setPayeeType(String payeeType) {
        this.payeeType = payeeType;
    }

    public String getPayeeType() {
        return payeeType;
    }

    public void setPayee(String payee) {
        this.payee = payee;
    }

    public String getPayee() {
        return payee;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public Long getAmount() {
        return amount;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

    public String getPayType() {
        return payType;
    }

    public void setThirdTradeNo(String thirdTradeNo) {
        this.thirdTradeNo = thirdTradeNo;
    }

    public String getThirdTradeNo() {
        return thirdTradeNo;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("tradeNo", getTradeNo())
                .append("payerType", getPayerType())
                .append("payer", getPayer())
                .append("payeeType", getPayeeType())
                .append("payee", getPayee())
                .append("amount", getAmount())
                .append("state", getState())
                .append("category", getCategory())
                .append("payType", getPayType())
                .append("thirdTradeNo", getThirdTradeNo())
                .append("description", getDescription())
                .append("remark", getRemark())
                .append("gmtCreate", getGmtCreate())
                .append("createBy", getCreateBy())
                .append("gmtModified", getGmtModified())
                .append("modifiedBy", getModifiedBy())
                .toString();
    }

    public String getPayeeNo() {
        return payeeNo;
    }

    public void setPayeeNo(String payeeNo) {
        this.payeeNo = payeeNo;
    }
}
