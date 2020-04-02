package com.ruoyi.mp.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 全局配置类
 *
 * @author ruoyi
 */
@Component
@Data
public class MpAuthConfig {

    /**
     * 微信授权回调地址
     */
    @Value("${mp.wxPnCallbackUrl}")
    private String wxPnCallbackUrl;
    @Value("${mp.configCode}")
    private String configCode;
    @Value("${mp.mockMoney}")
    private boolean mockMoney;
    @Value("${mp.mockWeChatOrderQuery}")
    private boolean mockWeChatOrderQuery;

}
