package com.ruoyi.reward.facade.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @author wahaha
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EnterpriseInfoDTO implements Serializable {
    /**
     * enterprise_info.id
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private Integer id;

    /**
     * enterprise_info.enterprise_name
     * 企业名称
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String enterpriseName;

    /**
     * enterprise_info.account_opening_date
     * 开户日期
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private Date accountOpeningDate;

    /**
     * enterprise_info.sales_manager
     * 销售经理
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String salesManager;

    /**
     * enterprise_info.payment_type
     * 付费类型
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String paymentType;

    /**
     * enterprise_info.status
     * 企业状态
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String status;

    /**
     * enterprise_info.remarks
     * 备注
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String remarks;

    /**
     * enterprise_info.enterprise_account
     * 企业登录账号
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String enterpriseAccount;

    /**
     * enterprise_info.enterprise_password
     * 企业登录密码
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String enterprisePassword;

    /**
     * enterprise_info.send_the_template
     * 是否模板发送
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String sendTheTemplate;

    /**
     * enterprise_info.sensitive_word_review
     * 是否敏感词审核
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String sensitiveWordReview;

    /**
     * enterprise_info.gmt_create
     * 创建时间
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private Date gmtCreate;

    /**
     * enterprise_info.gmt_modified
     * 修改时间
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private Date gmtModified;

    /**
     * enterprise_info.contact
     * 联系人
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String contact;

    /**
     * enterprise_info.contact_phone
     * 联系人号码
     *
     * @mbg.generated 2019-09-04 10:04:33
     */
    private String contactPhone;

    private static final long serialVersionUID = 1L;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", enterpriseName=").append(enterpriseName);
        sb.append(", accountOpeningDate=").append(accountOpeningDate);
        sb.append(", salesManager=").append(salesManager);
        sb.append(", paymentType=").append(paymentType);
        sb.append(", status=").append(status);
        sb.append(", remarks=").append(remarks);
        sb.append(", enterpriseAccount=").append(enterpriseAccount);
        sb.append(", enterprisePassword=").append(enterprisePassword);
        sb.append(", sendTheTemplate=").append(sendTheTemplate);
        sb.append(", sensitiveWordReview=").append(sensitiveWordReview);
        sb.append(", gmtCreate=").append(gmtCreate);
        sb.append(", gmtModified=").append(gmtModified);
        sb.append(", contact=").append(contact);
        sb.append(", contactPhone=").append(contactPhone);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}