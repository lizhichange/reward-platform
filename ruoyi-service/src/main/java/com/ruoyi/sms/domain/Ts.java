package com.ruoyi.sms.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Ts implements Serializable {
    /**
     * ts.id
     * 主键
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private Integer id;

    /**
     * ts.ip
     * ip地址
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private String ip;

    /**
     * ts.zt
     * 状态
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private String zt;

    /**
     * ts.neirong
     * 内容
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private String neirong;

    /**
     * ts.shijian
     * 时间
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private String shijian;

    /**
     * ts.typeto
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private String typeto;

    /**
     * ts.sid
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private String sid;

    /**
     * ts.userid
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private String userid;

    /**
     * ts.create_time
     * 创建时间
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private Date createTime;

    /**
     * ts.update_time
     * 修改时间
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private Date updateTime;

    /**
     * ts.open_id
     *
     * @mbg.generated 2020-04-03 19:08:11
     */
    private String openId;

    private static final long serialVersionUID = 1L;

    @Override
    public String toString() {
        return getClass().getSimpleName() +
                " [" +
                "Hash = " + hashCode() +
                ", id=" + id +
                ", ip=" + ip +
                ", zt=" + zt +
                ", neirong=" + neirong +
                ", shijian=" + shijian +
                ", typeto=" + typeto +
                ", sid=" + sid +
                ", userid=" + userid +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", openId=" + openId +
                ", serialVersionUID=" + serialVersionUID +
                "]";
    }
}