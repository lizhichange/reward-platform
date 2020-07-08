package com.ruoyi.reward.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author sunflower
 */
@Data
public class Video implements Serializable {


    private static final long serialVersionUID = -495973710593943252L;
    /**
     * shipin.id
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Integer id;

    /**
     * shipin.money
     * 资源设置的打赏金额
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String money;

    /**
     * shipin.sj
     * 选择模式 1为 开启随机金额分配
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String sj;

    /**
     * shipin.cs
     * 打赏人数
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String cs;

    /**
     * shipin.url
     * 打赏图片
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String url;

    /**
     * shipin.user_id
     * 用户ID
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String userId;

    /**
     * shipin.name
     * 资源名称
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String name;

    /**
     * shipin.videoUrl
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String videoUrl;

    /**
     * shipin.duration
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String duration;

    /**
     * shipin.lx
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String lx;

    /**
     * shipin.status
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String status;

    /**
     * shipin.logo
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String logo;

    /**
     * shipin.is_lei
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Boolean isLei;

    /**
     * shipin.is_allow
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Boolean isAllow;

    /**
     * shipin.click
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Integer click;

    /**
     * shipin.is_preview
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Boolean isPreview;

    /**
     * shipin.shorturl
     * 短链
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String shortUrl;

    /**
     * shipin.category_id
     * 类目id
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Integer categoryId;

    /**
     * shipin.create_time
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Date createTime;


    // 视图1
    public interface OneView {
    }


    // 视图2 继承视图1
    public interface TwoView extends OneView {
    }


    private String privateMoney;

    private List<String> userIdList;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", money=").append(money);
        sb.append(", sj=").append(sj);
        sb.append(", cs=").append(cs);
        sb.append(", url=").append(url);
        sb.append(", userId=").append(userId);
        sb.append(", name=").append(name);
        sb.append(", videoUrl=").append(videoUrl);
        sb.append(", duration=").append(duration);
        sb.append(", lx=").append(lx);
        sb.append(", status=").append(status);
        sb.append(", logo=").append(logo);
        sb.append(", isLei=").append(isLei);
        sb.append(", isAllow=").append(isAllow);
        sb.append(", click=").append(click);
        sb.append(", isPreview=").append(isPreview);
        sb.append(", shortUrl=").append(shortUrl);
        sb.append(", categoryId=").append(categoryId);
        sb.append(", createTime=").append(createTime);
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

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getSj() {
        return sj;
    }

    public void setSj(String sj) {
        this.sj = sj;
    }

    public String getCs() {
        return cs;
    }

    public void setCs(String cs) {
        this.cs = cs;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getZykey() {
        return videoUrl;
    }

    public void setZykey(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getLx() {
        return lx;
    }

    public void setLx(String lx) {
        this.lx = lx;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Boolean getLei() {
        return isLei;
    }

    public void setLei(Boolean lei) {
        isLei = lei;
    }

    public Boolean getAllow() {
        return isAllow;
    }

    public void setAllow(Boolean allow) {
        isAllow = allow;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public Boolean getPreview() {
        return isPreview;
    }

    public void setPreview(Boolean preview) {
        isPreview = preview;
    }

    public String getShortUrl() {
        return shortUrl;
    }

    public void setShortUrl(String shortUrl) {
        this.shortUrl = shortUrl;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPrivateMoney() {
        return privateMoney;
    }

    public void setPrivateMoney(String privateMoney) {
        this.privateMoney = privateMoney;
    }

    public List<String> getUserIdList() {
        return userIdList;
    }

    public void setUserIdList(List<String> userIdList) {
        this.userIdList = userIdList;
    }
}