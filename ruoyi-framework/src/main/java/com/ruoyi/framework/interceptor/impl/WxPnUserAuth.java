package com.ruoyi.framework.interceptor.impl;

import java.lang.annotation.*;

/**
 * 微信公众号平台用户授权
 * @author sunflower
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface WxPnUserAuth {

}

