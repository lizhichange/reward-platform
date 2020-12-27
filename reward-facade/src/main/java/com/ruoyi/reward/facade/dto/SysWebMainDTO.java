package com.ruoyi.reward.facade.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.near.toolkit.model.ToString;

/**
 * 域名管理对象 sys_web_main
 *
 * @author ruoyi
 * @date 2020-03-23
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysWebMainDTO extends ToString {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 链接地址
     */

    private String mainUrl;
    private String shortUrl;

    /**
     * 状态
     */

    private String mainStatus;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMainUrl() {
        return mainUrl;
    }

    public void setMainUrl(String mainUrl) {
        this.mainUrl = mainUrl;
    }

    public String getShortUrl() {
        return shortUrl;
    }

    public void setShortUrl(String shortUrl) {
        this.shortUrl = shortUrl;
    }

    public String getMainStatus() {
        return mainStatus;
    }

    public void setMainStatus(String mainStatus) {
        this.mainStatus = mainStatus;
    }
}
