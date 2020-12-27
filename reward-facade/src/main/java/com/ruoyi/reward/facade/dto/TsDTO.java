package com.ruoyi.reward.facade.dto;

import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */
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
    private String status;

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


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getTypeto() {
        return typeto;
    }

    public void setTypeto(String typeto) {
        this.typeto = typeto;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }
}
