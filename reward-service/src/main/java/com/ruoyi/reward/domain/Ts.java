package com.ruoyi.reward.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Ts implements Serializable {
    /**
    *
    *
    * ts.id
     * 主键
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private Integer id;

    /**
    *
    *
    * ts.ip
     * ip地址
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String ip;

    /**
    *
    *
    * ts.zt
     * 状态
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String zt;

    /**
    *
    *
    * ts.neirong
     * 内容
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String neirong;

    /**
    *
    *
    * ts.shijian
     * 时间
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String shijian;

    /**
    *
    *
    * ts.typeto
    
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String typeto;

    /**
    *
    *
    * ts.sid
    
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String sid;

    /**
    *
    *
    * ts.user_id
    
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String userId;

    /**
    *
    *
    * ts.create_time
     * 创建时间
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private Date createTime;

    /**
    *
    *
    * ts.update_time
     * 修改时间
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private Date updateTime;

    /**
    *
    *
    * ts.open_id
    
     *
     * @mbg.generated 2020-07-07 11:08:17
     */
    private String openId;

    private static final long serialVersionUID = 1L;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", ip=").append(ip);
        sb.append(", zt=").append(zt);
        sb.append(", neirong=").append(neirong);
        sb.append(", shijian=").append(shijian);
        sb.append(", typeto=").append(typeto);
        sb.append(", sid=").append(sid);
        sb.append(", userId=").append(userId);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", openId=").append(openId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}