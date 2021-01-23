package com.ruoyi.reward.domain;

import lombok.Data;
import org.near.toolkit.model.ToString;

import java.util.Date;
import java.util.List;

/**
 * @author sunflower
 */
@Data
public class Video extends ToString {


    private static final long serialVersionUID = -495973710593943252L;
    /**
     * video.id
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Integer id;

    /**
     * video.money
     * 资源设置的打赏金额
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String money;

    /**
     * video.sj
     * 选择模式 1为 开启随机金额分配
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String sj;

    /**
     * video.cs
     * 打赏人数
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String cs;

    /**
     * video.url
     * 打赏图片
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String imgUrl;

    /**
     * video.user_id
     * 用户ID
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String userId;

    /**
     * video.name
     * 资源名称
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String name;

    /**
     * video.videoUrl
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String videoUrl;

    /**
     * video.duration
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String duration;

    /**
     * video.lx
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String lx;

    /**
     * video.status
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String status;

    /**
     * video.logo
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String logo;

    /**
     * video.is_lei
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Boolean isLei;

    /**
     * video.is_allow
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Boolean isAllow;

    /**
     * video.click
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Integer click;

    /**
     * video.is_preview
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Boolean isPreview;

    /**
     * video.shorturl
     * 短链
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private String shortUrl;

    /**
     * video.category_id
     * 类目id
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Integer categoryId;

    private String categoryName;

    /**
     * video.create_time
     *
     * @mbg.generated 2020-07-07 11:14:12
     */
    private Date createTime;

    private String privateMoney;

    private List<String> userIdList;


}