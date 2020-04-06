package com.ruoyi.sms.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author sunflower
 */
@Data
public class AccountDTO implements Serializable {
    /**
     * account.id
     *
     * @mbg.generated 2019-09-09 15:04:41
     */
    private Integer id;

    /**
     * account.account_id
     * 账户唯一标识
     *
     * @mbg.generated 2019-09-09 15:04:41
     */
    private String accountId;

    /**
     * account.balance
     * 余额
     *
     * @mbg.generated 2019-09-09 15:04:41
     */
    private Long balance;

    /**
     * account.state
     * 状态[1:启用,0:禁用]
     *
     * @mbg.generated 2019-09-09 15:04:41
     */
    private String state;

    /**
     * account.gmt_create
     * 创建时间
     *
     * @mbg.generated 2019-09-09 15:04:41
     */
    private Date gmtCreate;

    /**
     * account.create_by
     *
     * @mbg.generated 2019-09-09 15:04:41
     */
    private String createBy;

    /**
     * account.gmt_modified
     * 修改时间
     *
     * @mbg.generated 2019-09-09 15:04:41
     */
    private Date gmtModified;

    /**
     * account.modified_by
     *
     * @mbg.generated 2019-09-09 15:04:41
     */
    private String modifiedBy;

    /**
     * account.account_type
     * 账户类型
     *
     * @mbg.generated 2019-09-09 15:04:41
     */
    private String accountType;

    private static final long serialVersionUID = 1L;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", accountId=").append(accountId);
        sb.append(", balance=").append(balance);
        sb.append(", state=").append(state);
        sb.append(", gmtCreate=").append(gmtCreate);
        sb.append(", createBy=").append(createBy);
        sb.append(", gmtModified=").append(gmtModified);
        sb.append(", modifiedBy=").append(modifiedBy);
        sb.append(", accountType=").append(accountType);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}