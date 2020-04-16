package com.ruoyi.reward.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class UserDto implements Serializable {
    /**
    *
    *
    * t_user_detail.id
    
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private Integer id;

    /**
    *
    *
    * t_user_detail.user_id
     * 用户唯一标识
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String userId;

    /**
    *
    *
    * t_user_detail.nickname
     * 昵称
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String nickname;

    /**
    *
    *
    * t_user_detail.name
     * 用户姓名
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String name;

    /**
    *
    *
    * t_user_detail.gender
     * 用户性别
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String gender;

    /**
    *
    *
    * t_user_detail.id_card
     * 身份证号
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String idCard;

    /**
    *
    *
    * t_user_detail.mobile_no
     * 手机号
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String mobileNo;

    /**
    *
    *
    * t_user_detail.birthday
     * 生日yyyyMMdd
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String birthday;

    /**
    *
    *
    * t_user_detail.gmt_create
     * 创建时间
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private Date gmtCreate;

    /**
    *
    *
    * t_user_detail.create_by
    
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String createBy;

    /**
    *
    *
    * t_user_detail.gmt_modified
     * 修改时间
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private Date gmtModified;

    /**
    *
    *
    * t_user_detail.modified_by
    
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String modifiedBy;

    /**
    *
    *
    * t_user_detail.user_source
     * 用户注册来源
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String userSource;

    /**
    *
    *
    * t_user_detail.user_referee
     * 用户推荐人
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String userReferee;

    /**
    *
    *
    * t_user_detail.user_referee_ids
    
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String userRefereeIds;

    /**
    *
    *
    * t_user_detail.marker
    
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String marker;

    /**
    *
    *
    * t_user_detail.reg_date
     * 注册时间
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private Date regDate;

    /**
    *
    *
    * t_user_detail.level
    
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private Integer level;

    /**
    *
    *
    * t_user_detail.avatar_url
     * 用户头像地址
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String avatarUrl;

    /**
    *
    *
    * t_user_detail.reg_url
     * 注册页面路径
     *
     * @mbg.generated 2020-04-11 13:09:27
     */
    private String regUrl;

    private static final long serialVersionUID = 1L;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userId=").append(userId);
        sb.append(", nickname=").append(nickname);
        sb.append(", name=").append(name);
        sb.append(", gender=").append(gender);
        sb.append(", idCard=").append(idCard);
        sb.append(", mobileNo=").append(mobileNo);
        sb.append(", birthday=").append(birthday);
        sb.append(", gmtCreate=").append(gmtCreate);
        sb.append(", createBy=").append(createBy);
        sb.append(", gmtModified=").append(gmtModified);
        sb.append(", modifiedBy=").append(modifiedBy);
        sb.append(", userSource=").append(userSource);
        sb.append(", userReferee=").append(userReferee);
        sb.append(", userRefereeIds=").append(userRefereeIds);
        sb.append(", marker=").append(marker);
        sb.append(", regDate=").append(regDate);
        sb.append(", level=").append(level);
        sb.append(", avatarUrl=").append(avatarUrl);
        sb.append(", regUrl=").append(regUrl);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}