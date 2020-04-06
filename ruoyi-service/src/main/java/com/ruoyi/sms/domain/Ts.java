package com.ruoyi.sms.domain;

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
     * @mbg.generated 2020-04-06 23:17:02
     */
    private Integer id;

    /**
    *
    *
    * ts.ip
     * ip地址
     *
     * @mbg.generated 2020-04-06 23:17:02
     */
    private String ip;

    /**
    *
    *
    * ts.zt
     * 状态
     *
     * @mbg.generated 2020-04-06 23:17:02
     */
    private String zt;

    /**
    *
    *
    * ts.neirong
     * 内容
     *
     * @mbg.generated 2020-04-06 23:17:02
     */
    private String neirong;

    /**
    *
    *
    * ts.shijian
     * 时间
     *
     * @mbg.generated 2020-04-06 23:17:02
     */
    private String shijian;

    /**
    *
    *
    * ts.typeto
    
     *
     * @mbg.generated 2020-04-06 23:17:02
     */
    private String typeto;

    /**
    *
    *
    * ts.sid
    
     *
     * @mbg.generated 2020-04-06 23:17:02
     */
    private String sid;

    /**
    *
    *
    * ts.userid
    
     *
     * @mbg.generated 2020-04-06 23:17:02
     */
    private String userid;

    /**
    *
    *
    * ts.create_time
     * 创建时间
     *
     * @mbg.generated 2020-04-06 23:17:02
     */
    private Date createTime;

    /**
    *
    *
    * ts.update_time
     * 修改时间
     *
     * @mbg.generated 2020-04-06 23:17:02
     */
    private Date updateTime;

    /**
    *
    *
    * ts.open_id
    
     *
     * @mbg.generated 2020-04-06 23:17:02
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
        sb.append(", userid=").append(userid);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", openId=").append(openId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}