package com.ruoyi.sms.facade.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class TsDTO implements Serializable {
    /**
     * ts.id
     *
     * @mbg.generated 2020-03-16 22:14:08
     */
    private Integer id;

    /**
     * ts.ip
     *
     * @mbg.generated 2020-03-16 22:14:08
     */
    private String ip;

    /**
     * ts.zt
     *
     * @mbg.generated 2020-03-16 22:14:08
     */
    private String zt;

    /**
     * ts.neirong
     *
     * @mbg.generated 2020-03-16 22:14:08
     */
    private String neirong;

    /**
     * ts.shijian
     *
     * @mbg.generated 2020-03-16 22:14:08
     */
    private String shijian;

    /**
     * ts.typeto
     *
     * @mbg.generated 2020-03-16 22:14:08
     */
    private String typeto;

    /**
     * ts.sid
     *
     * @mbg.generated 2020-03-16 22:14:08
     */
    private Integer sid;

    /**
     * ts.userid
     *
     * @mbg.generated 2020-03-16 22:14:08
     */
    private String userid;

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
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}