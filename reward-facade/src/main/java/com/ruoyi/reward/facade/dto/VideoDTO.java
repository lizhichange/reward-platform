package com.ruoyi.reward.facade.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.near.toolkit.model.ToString;

import java.util.Date;
import java.util.List;

/**
 * @author sunflower
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class VideoDTO extends ToString {
    private static final long serialVersionUID = 6410040127704981572L;
    /**
     * shipin.id
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Integer id;

    private List<Integer> ids;
    /**
     * shipin.money
     * 资源设置的打赏金额
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String money;

    /**
     * shipin.sj
     * 选择模式 1为 开启随机金额分配
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String sj;

    /**
     * shipin.cs
     * 打赏人数
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String cs;

    /**
     * shipin.url
     * 打赏图片
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String url;

    /**
     * shipin.userId
     * 用户ID
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String userId;

    /**
     * shipin.name
     * 资源名称
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String name;

    /**
     * shipin.zykey
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String videoUrl;

    /**
     * shipin.duration
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String duration;

    private String shijianStr;
    /**
     * shipin.lx
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String lx;

    /**
     * shipin.status
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String status;

    /**
     * shipin.logo
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String logo;

    /**
     * shipin.is_lei
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Boolean isLei;

    /**
     * shipin.is_allow
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Boolean isAllow;

    /**
     * shipin.click
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Integer click;

    /**
     * shipin.is_preview
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Boolean isPreview;

    /**
     * shipin.shorturl
     * 短链
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String shortUrl;


    private String startMoney;

    private String endMoney;
    /**
     * shipin.category_id
     * 类目id
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Integer categoryId;

    private SysCategoryDTO category;

    private Date createTime;

    private String shiUrl;

    private String diffDays;
    private String mockNum;

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
        sb.append("]");
        return sb.toString();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
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

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getShijianStr() {
        return shijianStr;
    }

    public void setShijianStr(String shijianStr) {
        this.shijianStr = shijianStr;
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

    public String getStartMoney() {
        return startMoney;
    }

    public void setStartMoney(String startMoney) {
        this.startMoney = startMoney;
    }

    public String getEndMoney() {
        return endMoney;
    }

    public void setEndMoney(String endMoney) {
        this.endMoney = endMoney;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public SysCategoryDTO getCategory() {
        return category;
    }

    public void setCategory(SysCategoryDTO category) {
        this.category = category;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getShiUrl() {
        return shiUrl;
    }

    public void setShiUrl(String shiUrl) {
        this.shiUrl = shiUrl;
    }

    public String getDiffDays() {
        return diffDays;
    }

    public void setDiffDays(String diffDays) {
        this.diffDays = diffDays;
    }

    public String getMockNum() {
        return mockNum;
    }

    public void setMockNum(String mockNum) {
        this.mockNum = mockNum;
    }
}