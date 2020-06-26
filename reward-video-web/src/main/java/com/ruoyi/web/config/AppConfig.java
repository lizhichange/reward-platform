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
    @Value("${app.wxPayUrl}")
    private String wxPayUrl;
    @Value("${app.wxAuthUrl}")
    private String wxAuthUrl;

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

    public String getWxPayUrl() {
        return wxPayUrl;
    }

    public void setWxPayUrl(String wxPayUrl) {
        this.wxPayUrl = wxPayUrl;
    }

    public String getWxAuthUrl() {
        return wxAuthUrl;
    }

    public void setWxAuthUrl(String wxAuthUrl) {
        this.wxAuthUrl = wxAuthUrl;
    }

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
