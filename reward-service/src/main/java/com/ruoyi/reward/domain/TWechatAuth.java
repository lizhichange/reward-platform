package com.ruoyi.reward.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

@Data
public class TWechatAuth implements Serializable {
    /**
    *
    *
    * t_wechat_auth.id
     * 主键
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private Integer id;

    /**
    *
    *
    * t_wechat_auth.open_id
     * open_id
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String openId;

    /**
    *
    *
    * t_wechat_auth.user_id
     * 主体唯一标识
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String userId;

    /**
    *
    *
    * t_wechat_auth.user_type
     * 主体类型
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String userType;

    /**
    *
    *
    * t_wechat_auth.appid
     * appid
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String appid;

    /**
    *
    *
    * t_wechat_auth.unionid
     * unionid
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String unionid;

    /**
    *
    *
    * t_wechat_auth.subscribe
     * 是否关注
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String subscribe;

    /**
    *
    *
    * t_wechat_auth.gmt_create
    
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private Date gmtCreate;

    /**
    *
    *
    * t_wechat_auth.create_by
    
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private String createBy;

    /**
    *
    *
    * t_wechat_auth.gmt_modified
     * 修改时间
     *
     * @mbg.generated 2020-04-11 13:00:34
     */
    private Date gmtModified;

    /**
    *
    *
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
}