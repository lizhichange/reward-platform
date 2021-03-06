package com.ruoyi.web.config;


import lombok.Data;
import org.near.toolkit.model.ToString;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author sunflower
 */
@Component
@Data
public class AppConfig extends ToString {
    /**
     * / 验证码开关
     */
    @Value("${app.captchaEnabled}")
    private boolean captchaEnabled;
    /**
     * / 微信授权开关
     */
    @Value("${app.authMpEnabled}")
    private boolean authMpEnabled;


}
