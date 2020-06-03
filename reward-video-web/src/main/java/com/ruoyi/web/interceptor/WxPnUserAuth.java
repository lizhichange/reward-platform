package com.ruoyi.web.interceptor;

import java.lang.annotation.*;

/**
 * 微信公众号平台用户授权
 *
 * @author sunflower
 */

@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface WxPnUserAuth {

}

