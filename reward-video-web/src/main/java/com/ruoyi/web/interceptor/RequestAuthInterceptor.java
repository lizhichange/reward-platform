package com.ruoyi.web.interceptor;


import com.ruoyi.web.client.ComplaintFacadeClient;
import com.ruoyi.web.client.SysConfigFacadeClient;
import com.ruoyi.web.config.AppConfig;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.DoMainUtil;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.context.SessionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

import static org.near.utils.IpUtils.getIpAddr;


/**
 * 微信预授权拦截器
 *
 * @author ruoyi
 */
@Component
@Slf4j
public class RequestAuthInterceptor extends HandlerInterceptorAdapter {
    private final static Logger LOGGER = LoggerFactory.getLogger(RequestAuthInterceptor.class);
    public final static String COOKIE_USER_KEY = "USER_INFO_KEY";
    public final static String COOKIE_HOST_ADD = "COOKIE_HOST_ADD";

    @Autowired
    AppConfig appConfig;

    @Lazy
    @Autowired
    ComplaintFacadeClient complaintFacadeClient;

    @Lazy
    @Autowired
    SysConfigFacadeClient sysConfigFacadeClient;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String hostAddress = getIpAddr(request);
        log.info("hostAddress:{}", hostAddress);
        request.setAttribute("authMpEnabled", appConfig.isAuthMpEnabled());
        StringBuffer requestUrl = request.getRequestURL();
        LOGGER.debug("requestURL:{}", requestUrl);
        Map<String, String[]> parameterMap = request.getParameterMap();
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
        log.info("referer:{}", referer);
        HttpSession session = request.getSession();
        String doMain = DoMainUtil.getDoMain(requestUrl.toString());
        //推广人的userId
        String userId = request.getParameter("userId");
        if (StringUtil.isNotBlank(userId)) {
            write(userId, COOKIE_USER_KEY, doMain, response);
            SessionContext.setUserId(session, userId);
            LOGGER.info("userId:{}", userId);
        }
        userId = read(request, COOKIE_USER_KEY);
        if (StringUtil.isNotBlank(userId)) {
            SessionContext.setUserId(session, userId);
        }

        if (StringUtil.isNotBlank(hostAddress)) {
            write(hostAddress, COOKIE_HOST_ADD, doMain, response);
            SessionContext.setHostAdd(session, hostAddress);
            return true;
        }
        hostAddress = read(request, COOKIE_HOST_ADD);
        LOGGER.info("hostAddress:{}", hostAddress);
        if (StringUtil.isNotBlank(hostAddress)) {
            SessionContext.setHostAdd(session, hostAddress);
            return true;
        }
        return super.preHandle(request, response, handler);
    }


    public static void write(String str, String cookieName, String domain,
                             HttpServletResponse response) {
        Cookie cookie = new Cookie(cookieName, str);
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
     * 在请求已经返回之后执行
     *
     * @param request
     * @param response
     * @param handler
     * @param ex
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
                                Object handler, Exception ex) {

        if (SessionContext.hasAttribute(SessionContext.OPEN_ID_KEY)) {
            SessionContext.removeAttribute(SessionContext.OPEN_ID_KEY);
        }
        if (SessionContext.hasAttribute(SessionContext.USER_ID_KEY)) {
            SessionContext.removeAttribute(SessionContext.USER_ID_KEY);
        }
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
                return c.getValue();
            }
        }
        return null;
    }


}
