package com.ruoyi.reward.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author sunflower
 */
@Data
public class Complaint implements Serializable {
    /**
     * ts.id
     * 主键
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private Integer id;

    /**
     * ts.ip
     * ip地址
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String ip;

    /**
     * ts.status
     * 状态
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String status;

    /**
     * ts.content
     * 内容
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String content;

    /**
     * ts.duration
     * 时间
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String duration;

    /**
     * ts.typeto
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String typeto;

    /**
     * ts.sid
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String sid;

    /**
     * ts.user_id
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String userId;

    /**
     * ts.create_time
     * 创建时间
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private Date createTime;

    /**
     * ts.update_time
     * 修改时间
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private Date updateTime;

    /**
     * ts.open_id
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String openId;

    private static final long serialVersionUID = 1L;


}