package com.ruoyi.mp.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 全局配置类
 *
 * @author ruoyi
 */
@Component
@ConfigurationProperties(prefix = "mp")
public class MpAuthConfig {

    /**
     * 微信授权回调地址
     */
    private static String wxPnCallbackUrl;


    public static String getWxPnCallbackUrl() {
        return wxPnCallbackUrl;
    }

    public void setWxPnCallbackUrl(String wxPnCallbackUrl) {
        MpAuthConfig.wxPnCallbackUrl = wxPnCallbackUrl;
    }
}