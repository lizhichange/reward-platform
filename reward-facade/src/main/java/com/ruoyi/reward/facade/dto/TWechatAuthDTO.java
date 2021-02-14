package com.ruoyi.reward.facade.dto;

import com.ruoyi.reward.facade.enums.PrincipalType;
import lombok.Data;
import org.near.toolkit.model.ToString;

import java.util.Date;

@Data
public class TWechatAuthDTO extends ToString {
    /**
     * t_wechat_auth.id
     * 主键
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private Integer id;

    /**
     * t_wechat_auth.open_id
     * open_id
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String openId;

    /**
     * t_wechat_auth.user_id
     * 主体唯一标识
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String userId;

    /**
     * t_wechat_auth.user_type
     * 主体类型
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private PrincipalType userType;

    /**
     * t_wechat_auth.appid
     * appid
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String appid;

    /**
     * t_wechat_auth.unionid
     * unionid
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String unionid;

    /**
     * t_wechat_auth.subscribe
     * 是否关注
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String subscribe;

    /**
     * t_wechat_auth.gmt_create
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private Date gmtCreate;

    /**
     * t_wechat_auth.create_by
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String createBy;

    /**
     * t_wechat_auth.gmt_modified
     * 修改时间
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private Date gmtModified;

    /**
     * t_wechat_auth.modified_by
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String modifiedBy;

    private static final long serialVersionUID = 1L;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", openId=").append(openId);
        sb.append(", userId=").append(userId);
        sb.append(", userType=").append(userType);
        sb.append(", appid=").append(appid);
        sb.append(", unionid=").append(unionid);
        sb.append(", subscribe=").append(subscribe);
        sb.append(", gmtCreate=").append(gmtCreate);
        sb.append(", createBy=").append(createBy);
        sb.append(", gmtModified=").append(gmtModified);
        sb.append(", modifiedBy=").append(modifiedBy);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public PrincipalType getUserType() {
        return userType;
    }

    public void setUserType(PrincipalType userType) {
        this.userType = userType;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid;
    }

    public String getSubscribe() {
        return subscribe;
    }

    public void setSubscribe(String subscribe) {
        this.subscribe = subscribe;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
}