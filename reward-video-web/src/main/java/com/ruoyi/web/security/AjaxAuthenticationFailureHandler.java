package com.ruoyi.web.security;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.google.gson.Gson;
import com.ruoyi.web.model.AjaxResult;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author sunflower
 */
@Component("ajaxAuthenticationFailureHandler")
public class AjaxAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException authEx)
            throws IOException, ServletException {
        // After login Failure

        String msg = "用户或密码错误";
        if (StringUtils.isNotEmpty(authEx.getMessage())) {
            msg = authEx.getMessage();
        }
        AjaxResult error = AjaxResult.error(msg);
        //包装成Json 发送的前台
        String json = new Gson().toJson(error);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();

        out.write(json);
        out.flush();
        out.close();


    }

}
