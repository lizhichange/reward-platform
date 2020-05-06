package com.ruoyi.reward.domain;


import java.util.Date;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
 * @author sunflower
 */

public class TUserDetail extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 用户唯一标识
     */
    @Excel(name = "用户唯一标识")
    private String userId;

    /**
     * 昵称
     */
    @Excel(name = "昵称")
    private String nickname;

    /**
     * 用户姓名
     */
    @Excel(name = "用户姓名")
    private String name;

    /**
     * 用户性别
     */
    @Excel(name = "用户性别")
    private String gender;

    /**
     * 身份证号
     */
    @Excel(name = "身份证号")
    private String idCard;

    /**
     * 手机号
     */
    @Excel(name = "手机号")
    private String mobileNo;

    /**
     * 生日yyyyMMdd
     */
    @Excel(name = "生日yyyyMMdd")
    private String birthday;

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

    /**
     * 用户注册来源
     */
    @Excel(name = "用户注册来源")
    private String userSource;

    /**
     * 用户推荐人
     */
    @Excel(name = "用户推荐人")
    private String userReferee;

    /**
     * 推荐人信息
     */
    @Excel(name = "推荐人信息")
    private String userRefereeIds;

    /**
     * 标记
     */
    @Excel(name = "标记")
    private String marker;

    /**
     * 注册时间
     */
    @Excel(name = "注册时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date regDate;

    /**
     * 级别
     */
    @Excel(name = "级别")
    private Long level;

    /**
     * 用户头像地址
     */
    @Excel(name = "用户头像地址")
    private String avatarUrl;

    /**
     * 注册页面路径
     */
    @Excel(name = "注册页面路径")
    private String regUrl;

    /**
     * 密码
     */
    @Excel(name = "密码")
    private String password;

    /**
     * 用户账号
     */
    @Excel(name = "用户账号")
    private String userName;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getNickname() {
        return nickname;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getGender() {
        return gender;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getBirthday() {
        return birthday;
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

    public void setUserSource(String userSource) {
        this.userSource = userSource;
    }

    public String getUserSource() {
        return userSource;
    }

    public void setUserReferee(String userReferee) {
        this.userReferee = userReferee;
    }

    public String getUserReferee() {
        return userReferee;
    }

    public void setUserRefereeIds(String userRefereeIds) {
        this.userRefereeIds = userRefereeIds;
    }

    public String getUserRefereeIds() {
        return userRefereeIds;
    }

    public void setMarker(String marker) {
        this.marker = marker;
    }

    public String getMarker() {
        return marker;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setLevel(Long level) {
        this.level = level;
    }

    public Long getLevel() {
        return level;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setRegUrl(String regUrl) {
        this.regUrl = regUrl;
    }

    public String getRegUrl() {
        return regUrl;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userId", getUserId())
                .append("nickname", getNickname())
                .append("name", getName())
                .append("gender", getGender())
                .append("idCard", getIdCard())
                .append("mobileNo", getMobileNo())
                .append("birthday", getBirthday())
                .append("gmtCreate", getGmtCreate())
                .append("createBy", getCreateBy())
                .append("gmtModified", getGmtModified())
                .append("modifiedBy", getModifiedBy())
                .append("userSource", getUserSource())
                .append("userReferee", getUserReferee())
                .append("userRefereeIds", getUserRefereeIds())
                .append("marker", getMarker())
                .append("regDate", getRegDate())
                .append("level", getLevel())
                .append("avatarUrl", getAvatarUrl())
                .append("regUrl", getRegUrl())
                .append("password", getPassword())
                .append("userName", getUserName())
                .toString();
    }
}