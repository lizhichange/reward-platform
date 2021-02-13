package com.ruoyi.reward.facade.dto;

import lombok.Data;
import org.near.toolkit.model.ToString;

/**
 * 发布价格对象 video_rel_price
 *
 * @author ruoyi
 * @date 2021-02-12
 */
@Data
public class VideoRelPriceDTO extends ToString {


    /**
     * 主键
     */
    private Long id;

    private Long videoId;

    /**
     * 账号
     */
    private String userId;

    /**
     * 价格
     */
    private Long price;


}
