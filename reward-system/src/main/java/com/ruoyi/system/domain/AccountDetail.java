package com.ruoyi.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author sunflower
 */
@Data
public class AccountDetail implements Serializable {
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

    private String amountStr;
    /**
     * account_detail.opt_type
     * 操作类型 [0:收入][1:支出]
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private String optType;

    private String optTypeStr;
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

    private String bizCodeStr;
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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date gmtCreate;

    /**
     * account_detail.gmt_modified
     * 修改时间
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date gmtModified;

    /**
     * account_detail.operator
     *
     * @mbg.generated 2020-03-16 21:49:40
     */
    private String operator;

    private static final long serialVersionUID = 1L;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", accountId=").append(accountId);
        sb.append(", amount=").append(amount);
        sb.append(", optType=").append(optType);
        sb.append(", remark=").append(remark);
        sb.append(", outTradeNo=").append(outTradeNo);
        sb.append(", bizCode=").append(bizCode);
        sb.append(", sourceCode=").append(sourceCode);
        sb.append(", gmtCreate=").append(gmtCreate);
        sb.append(", gmtModified=").append(gmtModified);
        sb.append(", operator=").append(operator);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}