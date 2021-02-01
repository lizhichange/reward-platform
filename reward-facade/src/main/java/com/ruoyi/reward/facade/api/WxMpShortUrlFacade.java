package com.ruoyi.reward.facade.api;

/**
 * @author sunflower
 */
public interface WxMpShortUrlFacade {
    /**
     * @param longUrl
     * @return
     */
    String shortUrl(String longUrl);

    String checkWebMain(String url);

    String checkUrl(String url);

}
