package com.ruoyi.sms.domain;

import java.io.Serializable;
import lombok.Data;

@Data
public class Yqm implements Serializable {
    /**
    *
    *
    * yqm.id
    
     *
     * @mbg.generated 2020-03-17 15:49:06
     */
    private Integer id;

    /**
    *
    *
    * yqm.userid
    
     *
     * @mbg.generated 2020-03-17 15:49:06
     */
    private String userid;

    /**
    *
    *
    * yqm.yqm
    
     *
     * @mbg.generated 2020-03-17 15:49:06
     */
    private String yqm;

    /**
    *
    *
    * yqm.shijian
    
     *
     * @mbg.generated 2020-03-17 15:49:06
     */
    private String shijian;

    /**
    *
    *
    * yqm.name
    
     *
     * @mbg.generated 2020-03-17 15:49:06
     */
    private String name;

    /**
    *
    *
    * yqm.zt
    
     *
     * @mbg.generated 2020-03-17 15:49:06
     */
    private String zt;

    private static final long serialVersionUID = 1L;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userid=").append(userid);
        sb.append(", yqm=").append(yqm);
        sb.append(", shijian=").append(shijian);
        sb.append(", name=").append(name);
        sb.append(", zt=").append(zt);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}