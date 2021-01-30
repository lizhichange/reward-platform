package com.ruoyi.reward.client;

public interface WxMpShortUrlFacadeClient {
    /**
     * @param longUrl
     * @return
     */
    String shortUrl(String longUrl);

    String check(String url);
}
