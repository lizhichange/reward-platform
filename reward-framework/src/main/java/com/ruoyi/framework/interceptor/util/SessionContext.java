package com.ruoyi.framework.interceptor.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.near.toolkit.common.StringUtil;

/**
 * session上下文，请求线程级别作用域
 * @author Created by Willard on 2015/9/7.
 */
public class SessionContext {

    /**
     * 用户标识Session key
     */
    public static final String USER_ID_KEY = "userId";

    public static final String OPEN_ID_KEY = "openId";

    /**
     * 将Session中存储的业务数据放到 SessionContext 工具类中直接访问，
     * 原理是使用线程变量ThreadLocal将参数存在来，同一个线程访问就可以获取到数据了。
     * @param sessionData Session数据模型 {@link SessionData}
     */
    public static void writeSessionContext(SessionData sessionData) {
        if (sessionData == null) {
            return;
        }
        if (StringUtil.isNotBlank(sessionData.getUserId())) {
            ThreadCache.setAttribute(USER_ID_KEY, sessionData.getUserId());
        }

        if (StringUtil.isNotBlank(sessionData.getOpenId())) {
            ThreadCache.setAttribute(OPEN_ID_KEY, sessionData.getOpenId());
        }

    }

    public static void set(HttpSession session, String userId, String openId) {
        SessionData sessionData = new SessionData();
        sessionData.setUserId(userId);
        sessionData.setOpenId(openId);
        session.setAttribute(USER_ID_KEY, userId);
        session.setAttribute(OPEN_ID_KEY, openId);
        writeSessionContext(sessionData);
    }

    /**
     * 清除ThreadLocal中存放的业务数据
     */
    public static void clearSessionContext() {
        ThreadCache.clear();
    }

    /**
     * 获取 userId，会在拦截器 AuthInterceptor 中注入到线程变量
     */
    public static String getUserId() {
        Object userId = ThreadCache.getAttribute(USER_ID_KEY);
        if (userId == null) {
            return null;
        }
        return (String) userId;
    }

    public static String getOpenId() {
        Object openId = ThreadCache.getAttribute(OPEN_ID_KEY);
        if (openId == null) {
            return null;
        }
        return (String) openId;
    }

    public static String getOpenId(HttpServletRequest request) {
        Object openId = request.getSession().getAttribute(OPEN_ID_KEY);
        if (openId == null) {
            return null;
        }

        return (String) openId;
    }

    public static String getUserId(HttpServletRequest request) {
        Object userId = request.getSession().getAttribute(USER_ID_KEY);
        if (userId == null) {
            return null;
        }
        return (String) userId;
    }
}
