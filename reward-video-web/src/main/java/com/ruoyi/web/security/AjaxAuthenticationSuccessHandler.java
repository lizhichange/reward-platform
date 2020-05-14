package com.ruoyi.web.security;

import com.google.gson.Gson;
import com.ruoyi.web.model.AjaxResult;
import lombok.Data;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

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

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
            throws IOException, ServletException {

        SimpleUrlAuthenticationSuccessHandler handler = new SimpleUrlAuthenticationSuccessHandler();
        handler.setUseReferer(true);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();

        AjaxResult success = AjaxResult.success();
        String json = new Gson().toJson(success);
        out.print(json);
        out.flush();
        out.close();
    }


}

