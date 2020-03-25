package com.ruoyi.framework.interceptor;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.config.Global;

import com.ruoyi.framework.interceptor.impl.WxPnUserAuth;
import com.ruoyi.framework.interceptor.util.SessionContext;
import com.ruoyi.framework.interceptor.util.SessionData;
import com.sun.corba.se.spi.ior.IdentifiableFactory;
import com.sun.org.apache.bcel.internal.generic.FLOAD;
import lombok.extern.java.Log;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.security.codec.AESCoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.lang.reflect.Method;


/**
 * 微信预授权拦截器
 *
 * @author ruoyi
 */
@Component

public class WechatAuthInterceptor extends HandlerInterceptorAdapter {
    private final static Logger LOGGER = LoggerFactory.getLogger(WechatAuthInterceptor.class);
    public final static String AES_KET = "U2FsdGVkX1/TjFjEE/3lTCOvPLdrPUkMqYYHWZmteHw=";

    public final static String COOKIE_KEY = "USER_INFO_KEY";


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        LOGGER.info("====用户进入拦截器===WechatAuthInterceptor===");
        HttpSession session = request.getSession();
        String referer = request.getHeader("referer");
        session.setAttribute("referer", referer);
        LOGGER.info("referer:{}", referer);
        //是否mock
        if (Global.isMock()) {
            SessionContext.set(session, "x", "x");
            return true;
        }

        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            WxPnUserAuth annotation = method.getAnnotation(WxPnUserAuth.class);
            //如果注解为空说明不需要拦截,直接放过
            if (annotation == null) {
                return true;
            }
            String read = read(request, COOKIE_KEY);
            if (StringUtil.isNotBlank(read)) {
                WxMpUser wxMpUser = JSONObject.parseObject(read, WxMpUser.class);
                if (wxMpUser != null) {
                    SessionContext.set(session, wxMpUser.getOpenId(), wxMpUser.getOpenId());
                    return true;
                }
            }

            String wxAuthUrl = Global.getWxAuthUrl();
            if (wxAuthUrl.contains("?")) {
                wxAuthUrl += "&callback=" + referer;
            } else {
                wxAuthUrl += "?callback=" + referer;
            }
            response.sendRedirect(wxAuthUrl);
            return false;
        } else {
            return super.preHandle(request, response, handler);
        }
    }

    /**
     * // 执行目标方法之后执行
     *
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) {

    }

    /**
     * // 在请求已经返回之后执行
     *
     * @param request
     * @param response
     * @param handler
     * @param ex
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
                                Object handler, Exception ex) {
        SessionContext.clearSessionContext();
    }

    /**
     * 根据cookieKey读取cookie
     *
     * @param request   the request
     * @param cookieKey the cookie key
     * @return the string
     */
    public static String read(HttpServletRequest request, String cookieKey) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return null;
        }
        for (Cookie c : cookies) {
            if (cookieKey.equals(c.getName())) {
                //解密
                return AESCoder.decrypt(c.getValue(), AES_KET, "utf-8");
            }
        }

        return null;
    }

}
