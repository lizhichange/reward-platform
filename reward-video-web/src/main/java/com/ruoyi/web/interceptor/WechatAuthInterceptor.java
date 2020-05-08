package com.ruoyi.web.interceptor;


import cn.hutool.core.util.URLUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.google.common.collect.Lists;
import com.ruoyi.reward.facade.dto.TsDTO;
import com.ruoyi.web.config.AppConfig;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.DoMainUtil;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.context.SessionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;
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
    public final static String COOKIE_OP_KEY = "OPEN_INFO_KEY";
    public final static String COOKIE_USER_KEY = "USER_INFO_KEY";


    @Autowired
    AppConfig appConfig;

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

        //如果不是微信环境 直接返回pc 浏览
        String ua = request.getHeader("User-Agent").toLowerCase();
        UserAgent parse = UserAgentUtil.parse(ua);
        if (!parse.isMobile()) {
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
            String doMain = DoMainUtil.getDoMain(requestUrl.toString());
            //授权回来之后中定向会带有openId参数
            String openId = myRequest.getParameter("op");
            //推广人的userid
            String userId = myRequest.getParameter("userid");
            if (StringUtil.isNotBlank(userId)) {
                write(userId, COOKIE_USER_KEY, doMain, response);
            }
            if (StringUtil.isNotBlank(openId)) {
                write(openId, COOKIE_OP_KEY, doMain, response);
                SessionContext.set(session, userId, openId);
                return true;
            }
            userId = read(request, COOKIE_USER_KEY);
            openId = read(request, COOKIE_OP_KEY);
            log.info("openId:{}", openId);
            if (StringUtil.isNotBlank(openId)) {
                SessionContext.set(session, userId, openId);
                return true;
            }

            String wxAuthUrl = appConfig.getWxAuthUrl();
            String encode = URIUtil.encodeURIComponent(referer);
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

    private boolean redirect(HttpServletResponse response, String openId) throws IOException {
        //投诉信息
        TsDTO tsDTO = new TsDTO();
        tsDTO.setOpenId(openId);
        List<TsDTO> list = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(list)) {
            String weiXin110 = "https://weixin110.qq.com/cgi-bin/mmspamsupport-bin/newredirectconfirmcgi?main_type=2&evil_type=20&source=2&url=" + URLUtil.encode("https://www.qq.com/?fromdefault");
            response.sendRedirect(weiXin110);
            return true;
        }
        return false;
    }

    private HttpServletRequest getHttpServletRequest() {
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes my = (ServletRequestAttributes) requestAttributes;
        assert my != null;
        return my.getRequest();
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
                return c.getValue();
            }
        }
        return null;
    }

}