package com.ruoyi.reward.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;

import com.ruoyi.reward.client.WxMpShortUrlFacadeClient;
import org.springframework.stereotype.Component;

@Component
public class WxMpShortUrlFacadeClientImpl implements WxMpShortUrlFacadeClient {

    @Reference(version = "1.0.0", check = false)
    com.ruoyi.reward.facade.api.WxMpShortUrlFacade wxMpShortUrlFacade;

    @Override
    public String shortUrl(String longUrl) {
        return wxMpShortUrlFacade.shortUrl(longUrl);
    }

    @Override
    public String check(String url) {
        return wxMpShortUrlFacade.shortUrl(url);
    }
}
