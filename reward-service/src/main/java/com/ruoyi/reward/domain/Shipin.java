package com.ruoyi.reward.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class Shipin implements Serializable {
    /**
     * shipin.id
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Integer id;

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
     * shipin.userid
     * 用户ID
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String userid;

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
    private String zykey;

    /**
     * shipin.shijian
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String shijian;

    /**
     * shipin.lx
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String lx;

    /**
     * shipin.zt
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String zt;

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

    private List<String> useridList;
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
    private String shorturl;

    /**
     * shipin.category_id
     * 类目id
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Integer categoryId;

    /**
     * shipin.create_time
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Date createTime;

    private static final long serialVersionUID = 1L;


    // 视图1
    public interface OneView{};
    // 视图2 继承视图1
    public interface TwoView extends OneView{};

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
        sb.append(", userid=").append(userid);
        sb.append(", name=").append(name);
        sb.append(", zykey=").append(zykey);
        sb.append(", shijian=").append(shijian);
        sb.append(", lx=").append(lx);
        sb.append(", zt=").append(zt);
        sb.append(", logo=").append(logo);
        sb.append(", isLei=").append(isLei);
        sb.append(", isAllow=").append(isAllow);
        sb.append(", click=").append(click);
        sb.append(", isPreview=").append(isPreview);
        sb.append(", shorturl=").append(shorturl);
        sb.append(", categoryId=").append(categoryId);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}