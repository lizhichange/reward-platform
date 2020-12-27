package com.ruoyi.reward.facade.dto;

import lombok.Data;
import org.near.toolkit.model.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * @author sunflower
 */
@Data
public class UserDTO extends ToString {
    /**
     * t_user_detail.id
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private Long id;

    /**
     * t_user_detail.user_id
     * 用户唯一标识
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String userId;

    /**
     * t_user_detail.nickname
     * 昵称
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String nickname;

    /**
     * t_user_detail.name
     * 用户姓名
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String name;

    /**
     * t_user_detail.gender
     * 用户性别
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String gender;

    /**
     * t_user_detail.id_card
     * 身份证号
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String idCard;

    /**
     * t_user_detail.mobile_no
     * 手机号
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String mobileNo;

    /**
     * t_user_detail.birthday
     * 生日yyyyMMdd
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String birthday;

    /**
     * t_user_detail.gmt_create
     * 创建时间
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private Date gmtCreate;

    /**
     * t_user_detail.create_by
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String createBy;

    /**
     * t_user_detail.gmt_modified
     * 修改时间
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private Date gmtModified;

    /**
     * t_user_detail.modified_by
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String modifiedBy;

    /**
     * t_user_detail.user_source
     * 用户注册来源
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String userSource;

    /**
     * t_user_detail.user_referee
     * 用户推荐人
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String userReferee;

    /**
     * t_user_detail.user_referee_ids
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String userRefereeIds;

    /**
     * t_user_detail.marker
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String marker;

    /**
     * t_user_detail.reg_date
     * 注册时间
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private Date regDate;

    /**
     * t_user_detail.level
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private Integer level;

    /**
     * t_user_detail.avatar_url
     * 用户头像地址
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String avatarUrl;

    /**
     * t_user_detail.reg_url
     * 注册页面路径
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String regUrl;

    /**
     * t_user_detail.password
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String password;

    /**
     * t_user_detail.user_name
     *
     * @mbg.generated 2020-05-04 16:25:45
     */
    private String userName;

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
        sb.append(", password=").append(password);
        sb.append(", userName=").append(userName);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}