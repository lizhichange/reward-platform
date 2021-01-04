package com.ruoyi.reward.facade.dto;


import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.near.toolkit.model.ToString;

/**
 * 链接管理对象 sys_short
 *
 * @author ruoyi
 * @date 2020-03-23
 */
@NoArgsConstructor
@AllArgsConstructor
public class SysShortDTO extends ToString {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 链接key
     */
    private String shortKey;

    /**
     * 链接地址
     */
    private String shortUrl;

    /**
     * 长链接地址
     */
    private String longUrl;

    /**
     * 状态
     */
    private String shortStatus;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setShortKey(String shortKey) {
        this.shortKey = shortKey;
    }

    public String getShortKey() {
        return shortKey;
    }

    public void setShortUrl(String shortUrl) {
        this.shortUrl = shortUrl;
    }

    public String getShortUrl() {
        return shortUrl;
    }

    public void setLongUrl(String longUrl) {
        this.longUrl = longUrl;
    }

    public String getLongUrl() {
        return longUrl;
    }

    public void setShortStatus(String shortStatus) {
        this.shortStatus = shortStatus;
    }

    public String getShortStatus() {
        return shortStatus;
    }


}
