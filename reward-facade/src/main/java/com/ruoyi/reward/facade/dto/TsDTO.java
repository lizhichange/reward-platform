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
    private String neirong;

    /**
     * 时间
     */
    private String shijian;

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
    private String userid;

    /**
     * $column.columnComment
     */
    private String openId;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getIp() {
        return ip;
    }

    public void setZt(String zt) {
        this.zt = zt;
    }

    public String getZt() {
        return zt;
    }

    public void setNeirong(String neirong) {
        this.neirong = neirong;
    }

    public String getNeirong() {
        return neirong;
    }

    public void setShijian(String shijian) {
        this.shijian = shijian;
    }

    public String getShijian() {
        return shijian;
    }

    public void setTypeto(String typeto) {
        this.typeto = typeto;
    }

    public String getTypeto() {
        return typeto;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSid() {
        return sid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUserid() {
        return userid;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getOpenId() {
        return openId;
    }


}
