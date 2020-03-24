package com.ruoyi.framework.interceptor;


import com.ruoyi.common.config.Global;
import com.ruoyi.common.json.JSON;

import com.ruoyi.framework.interceptor.impl.WxPnUserAuth;
import com.sun.corba.se.spi.ior.IdentifiableFactory;
import lombok.extern.java.Log;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.mp.api.WxMpService;
import org.apache.shiro.session.mgt.SessionContext;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.Map;

/**
 * 微信预授权拦截器
 *
 * @author ruoyi
 */
@Component
@Log
public abstract class WechatAuthInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    WxMpService wxMpService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        HttpSession session = request.getSession();
        String referer = request.getHeader("referer");
        session.setAttribute("referer", referer);
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            WxPnUserAuth annotation = method.getAnnotation(WxPnUserAuth.class);
            //如果注解为空说明不需要拦截,直接放过
            if (annotation == null) {
                return true;
            }
            //读取信息
            if (new Object() != null) {

            } else {
                //执行预授权
                String url = Global.getWxPnCallbackUrl();
                String authorizationUrl = wxMpService.oauth2buildAuthorizationUrl(url, WxConsts.OAuth2Scope.SNSAPI_USERINFO, null);
                response.sendRedirect(authorizationUrl);
            }
            return true;
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

    }

}
