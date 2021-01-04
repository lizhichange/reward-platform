package com.ruoyi.web.security;

import com.google.gson.Gson;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.model.AjaxResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.ServletRequestUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author sunflower
 */
@Component("ajaxAuthenticationSuccessHandler")
public class AjaxAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    public static final Logger LOGGER = LoggerFactory.getLogger(AjaxAuthenticationSuccessHandler.class);

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
            throws IOException, ServletException {
        String redirect_uri = ServletRequestUtils.getStringParameter(request, "redirect_uri");
        LOGGER.info("redirect_uri:{}", redirect_uri);
        if (StringUtil.isNotBlank(redirect_uri)) {
            boolean login = redirect_uri.contains("login");
            if (login) {
                redirect_uri = "/video";
            }
        } else {
            redirect_uri = "/video";
        }
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        AjaxResult success = AjaxResult.success();
        success.put("redirect_uri", redirect_uri);
        String json = new Gson().toJson(success);
        out.print(json);
        out.flush();
        out.close();
    }


}

