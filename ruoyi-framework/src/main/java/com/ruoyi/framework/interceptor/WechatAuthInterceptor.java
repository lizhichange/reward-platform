package com.ruoyi.framework.interceptor;


import cn.hutool.crypto.symmetric.RC4;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.config.Global;
import com.ruoyi.framework.interceptor.impl.WxPnUserAuth;
import com.ruoyi.framework.interceptor.util.SessionContext;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.util.http.URIUtil;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.near.toolkit.common.DoMainUtil;
import org.near.toolkit.common.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.util.Map;


/**
 * 微信预授权拦截器
 *
 * @author ruoyi
 */
@Component
@Slf4j
public class WechatAuthInterceptor extends HandlerInterceptorAdapter {
    private final static Logger LOGGER = LoggerFactory.getLogger(WechatAuthInterceptor.class);
    public final static String COOKIE_KEY = "USER_INFO_KEY";
    public final static String RC_KET = "U2FsdGVkX1/TjFjEE/3lTCOvPLdrPUkMqYYHWZmteHw=";


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        LOGGER.info("====用户进入拦截器===WechatAuthInterceptor===");

        HttpServletRequest myRequest = getHttpServletRequest();
        StringBuffer requestUrl = myRequest.getRequestURL();
        log.info("requestURL:{}", requestUrl);
        Map<String, String[]> parameterMap = myRequest.getParameterMap();
        StringBuilder str = new StringBuilder();
        if (!CollectionUtils.isEmpty(parameterMap)) {
            for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
                String k = entry.getKey();
                String[] v = entry.getValue();
                String param = k + "=" + v[0];
                str.append(param).append("&");
            }
        }

        String referer = requestUrl.toString() + "?" + str;
        HttpSession session = request.getSession();
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
            //授权回来之后中定向会带有openId参数
            String op = myRequest.getParameter("op");
            if (StringUtil.isNotBlank(op)) {
                WxMpUser wxMpUser = new WxMpUser();
                wxMpUser.setOpenId(op);
                String doMain = DoMainUtil.getDoMain(requestUrl.toString());
                write(wxMpUser, COOKIE_KEY, doMain, response);
                SessionContext.set(session, wxMpUser.getOpenId(), wxMpUser.getOpenId());
                return true;
            }

            String read = read(request, COOKIE_KEY);
            log.info("read:{}",read);
            if (StringUtil.isNotBlank(read)) {
                WxMpUser wxMpUser = JSONObject.parseObject(read, WxMpUser.class);
                if (wxMpUser != null) {
                    SessionContext.set(session, wxMpUser.getOpenId(), wxMpUser.getOpenId());
                    return true;
                }
            }
            String wxAuthUrl = Global.getWxAuthUrl();
            String encode = URIUtil.encodeURIComponent(referer);
            //pRTa/LHAlQIxYq2mYSAJWN7BoLXN2B2waTHJaSBHGP1gN0fdvEWVP9h8ZCxB/O9l
            //pRTa/LHAlQIxYq2mYSAJWN7BoLXN2B2waTHJaSBHGP1gN0fdvEWVP9h8ZCxB/O9l
            if (wxAuthUrl.contains("?")) {
                wxAuthUrl += "&callback=" + encode;
            } else {
                wxAuthUrl += "?callback=" + encode;
            }
            response.sendRedirect(wxAuthUrl);
            return false;
        } else {
            return super.preHandle(request, response, handler);
        }
    }

    private HttpServletRequest getHttpServletRequest() {
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes my = (ServletRequestAttributes) requestAttributes;
        assert my != null;
        return my.getRequest();
    }


    public static void write(WxMpUser wxMpUser, String cookieName, String domain,
                             HttpServletResponse response) {
        //加密
        RC4 rc4 = new RC4(RC_KET);
        String encryptJson = rc4.encryptHex(JSON.toJSONString(wxMpUser), Charset.defaultCharset());
        log.info("encryptJson:{}", encryptJson);
        Cookie cookie = new Cookie(cookieName, encryptJson);
        cookie.setMaxAge(-1);
        cookie.setDomain(domain);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
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
                RC4 rc4 = new RC4(RC_KET);
                return rc4.decrypt(c.getValue().getBytes());
            }
        }
        return null;
    }


    public static void main(String[] args) {
        String message = "这是一个中文消息！";
        String key = RC_KET;
        RC4 rc4 = new RC4(key);
        byte[] crypt = rc4.encrypt(message);
        String msg = rc4.decrypt(crypt);
        System.out.println(msg + "=" + message);
    }

}
