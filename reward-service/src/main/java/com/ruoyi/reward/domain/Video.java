package com.ruoyi.reward.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import org.near.toolkit.model.ToString;

@Data
public class Video extends ToString {
    /**
     * video.id
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private Integer id;

    /**
     * video.money
     * 资源设置的打赏金额
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String money;

    /**
     * video.cs
     * 打赏人数
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String cs;

    /**
     * video.img_url
     * 视频图片地址
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String imgUrl;

    /**
     * video.user_id
     * 用户ID
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String userId;

    /**
     * video.name
     * 资源名称
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String name;

    /**
     * video.video_url
     * 视频地址
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String videoUrl;

    /**
     * video.duration
     * 时长
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String duration;

    /**
     * video.video_type
     * 类型
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String videoType;

    /**
     * video.status
     * 状态
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String status;

    /**
     * video.logo
     * logo
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String logo;

    /**
     * video.is_lei
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private Boolean isLei;

    /**
     * video.is_allow
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private Boolean isAllow;

    /**
     * video.click
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private Integer click;

    /**
     * video.is_preview
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private Boolean isPreview;

    /**
     * video.short_url
     * 短链
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private String shortUrl;

    /**
     * video.category_id
     * 类目id
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private Integer categoryId;

    /**
     * video.create_time
     * 创建时间
     *
     * @mbg.generated 2021-01-23 18:35:04
     */
    private Date createTime;

}