package com.ruoyi.reward.facade.dto;

import lombok.Data;
import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */
@Data
public class TsDTO extends ToString {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * ip地址
     */
    private String ip;

    /**
     * 状态
     */
    private String zt;

    /**
     * 内容
     */
    private String content;

    /**
     * 时间
     */
    private String duration;

    /**
     * $column.columnComment
     */
    private String typeto;

    /**
     * $column.columnComment
     */
    private String sid;

    /**
     * $column.columnComment
     */
    private String userId;

    /**
     * $column.columnComment
     */
    private String openId;


}
