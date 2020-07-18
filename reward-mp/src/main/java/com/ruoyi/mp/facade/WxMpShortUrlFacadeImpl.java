package com.ruoyi.mp.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.ruoyi.reward.facade.api.WxMpShortUrlFacade;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author sunflower
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class WxMpShortUrlFacadeImpl implements WxMpShortUrlFacade {
    @Autowired
    WxMpService wxMpService;

    @Override
    public String shortUrl(String longUrl) {
        try {
            return wxMpService.shortUrl(longUrl);
        } catch (WxErrorException e) {
            e.printStackTrace();
            return "";
        }
    }
}
