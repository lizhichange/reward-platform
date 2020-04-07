package org.near.servicesupport.request;

import org.near.toolkit.common.StringUtil;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.UnknownHostException;


public class RequestBuilder {
    private static String ip;
    private static String hostName;

    public RequestBuilder() {
    }

    public static <T extends AbstractServiceRequest> T build(Class<T> clz) {
        return build(clz, hostName, ip);
    }

    public static <T extends AbstractServiceRequest> T build(Class<T> clz, String hostName) {
        return build(clz, hostName, ip);
    }

    public static <T extends AbstractServiceRequest> T build(Class<T> clz, String hostName, String ip) {
        try {
            AbstractServiceRequest req = (AbstractServiceRequest) clz.newInstance();

            Method m;
            try {
                m = clz.getMethod("setClientName", String.class);
                m.invoke(req, hostName);
            } catch (NoSuchMethodException var7) {
            }

            try {
                m = clz.getMethod("setClientIp", String.class);
                m.invoke(req, ip);
            } catch (NoSuchMethodException var6) {
            }

            return (T) req;
        } catch (Exception var8) {
            throw new RuntimeException(var8);
        }
    }

    public static <T> TRequest<T> buildT(T condition) {
        return buildT(condition, ip, hostName);
    }

    public static <T> TRequest<T> buildT(T condition, String ip, String hostName) {
        TRequest<T> req = new TRequest();
        req.setClientIp(StringUtil.isBlank(ip) ? RequestBuilder.ip : ip);
        req.setClientName(StringUtil.isBlank(hostName) ? RequestBuilder.hostName : hostName);
        req.setCondition(condition);
        return req;
    }

    public static <T> TPageRequest<T> buildPageT(T condition, int page, int rows) {
        return buildPageT(condition, page, rows, ip, hostName);
    }

    public static <T> TPageRequest<T> buildPageT(T condition, int page, int rows, String ip, String hostName) {
        TPageRequest<T> req = new TPageRequest();
        Class clz = req.getClass();

        Method m;
        try {
            m = clz.getMethod("setClientName", String.class);
            m.invoke(req, hostName);
        } catch (InvocationTargetException | IllegalAccessException | NoSuchMethodException var10) {
        }

        try {
            m = clz.getMethod("setClientIp", String.class);
            m.invoke(req, ip);
        } catch (InvocationTargetException | IllegalAccessException | NoSuchMethodException var9) {
        }

        req.setCondition(condition);
        req.setPage(page);
        req.setRows(rows);
        return req;
    }

    static {
        try {
            InetAddress netAddress = InetAddress.getLocalHost();
            if (netAddress != null) {
                ip = netAddress.getHostAddress();
                hostName = netAddress.getHostName();
            }
        } catch (UnknownHostException var1) {

         }

    }
}
