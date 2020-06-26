package com.ruoyi.web.config;


import org.near.toolkit.model.ToString;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author sunflower
 */
@Component
public class AppConfig extends ToString {
    /**
     *
     */


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


    public boolean isCaptchaEnabled() {
        return captchaEnabled;
    }

    public void setCaptchaEnabled(boolean captchaEnabled) {
        this.captchaEnabled = captchaEnabled;
    }

    public boolean isAuthMpEnabled() {
        return authMpEnabled;
    }

    public void setAuthMpEnabled(boolean authMpEnabled) {
        this.authMpEnabled = authMpEnabled;
    }
}
