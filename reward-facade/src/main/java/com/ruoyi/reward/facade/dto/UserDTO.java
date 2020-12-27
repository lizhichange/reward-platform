package com.ruoyi.reward.facade.dto;

import lombok.Data;
import org.near.toolkit.model.ToString;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
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

    public String getUserSource() {
        return userSource;
    }

    public void setUserSource(String userSource) {
        this.userSource = userSource;
    }

    public String getUserReferee() {
        return userReferee;
    }

    public void setUserReferee(String userReferee) {
        this.userReferee = userReferee;
    }

    public String getUserRefereeIds() {
        return userRefereeIds;
    }

    public void setUserRefereeIds(String userRefereeIds) {
        this.userRefereeIds = userRefereeIds;
    }

    public String getMarker() {
        return marker;
    }

    public void setMarker(String marker) {
        this.marker = marker;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getRegUrl() {
        return regUrl;
    }

    public void setRegUrl(String regUrl) {
        this.regUrl = regUrl;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}