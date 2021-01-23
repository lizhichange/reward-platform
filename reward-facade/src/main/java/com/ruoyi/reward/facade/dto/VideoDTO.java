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
     * video.id
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Integer id;

    private List<Integer> ids;
    /**
     * video.money
     * 资源设置的打赏金额
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String money;

    /**
     * video.sj
     * 选择模式 1为 开启随机金额分配
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String sj;

    /**
     * video.cs
     * 打赏人数
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String cs;

    /**
     * video.url
     * 打赏图片
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String imgUrl;

    /**
     * video.userId
     * 用户ID
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String userId;

    /**
     * video.name
     * 资源名称
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String name;

    /**
     * video.zykey
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String videoUrl;

    /**
     * video.duration
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String duration;

    private String shijianStr;
    /**
     * video.lx
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String lx;

    /**
     * video.status
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String status;

    /**
     * video.logo
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String logo;

    /**
     * video.is_lei
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Boolean isLei;

    /**
     * video.is_allow
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Boolean isAllow;

    /**
     * video.click
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Integer click;

    /**
     * video.is_preview
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private Boolean isPreview;

    /**
     * video.shorturl
     * 短链
     *
     * @mbg.generated 2020-03-19 21:47:04
     */
    private String shortUrl;


    private String startMoney;

    private String endMoney;
    /**
     * video.category_id
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


}