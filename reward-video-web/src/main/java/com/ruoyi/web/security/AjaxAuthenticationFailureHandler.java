package com.ruoyi.web.security;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.web.util.AjaxResult;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author sunflower
 */
@Component("ajaxAuthenticationFailureHandler")
public class AjaxAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException authEx)
            throws IOException, ServletException {

        String msg = "用户或密码错误";
        if (StringUtils.isNotEmpty(authEx.getMessage())) {
            msg = authEx.getMessage();
        }
        AjaxResult error = AjaxResult.error(msg);
        // After login Failure
        response.getWriter().print(JSONObject.toJSONString(error));
        response.getWriter().flush();

    }

}
