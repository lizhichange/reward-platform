package com.ruoyi.web.security;

import com.google.code.kaptcha.Constants;
import com.ruoyi.web.config.AppConfig;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author sunflower
 */
@Component
public class ValidateCodeFilter extends OncePerRequestFilter {
    @Autowired
    private AuthenticationFailureHandler authenticationFailureHandler;
    @Autowired
    AppConfig appConfig;

    public boolean validateResponse(HttpServletRequest request, String validateCode) {
        Object obj = request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        String code = String.valueOf(obj != null ? obj : "");
        if (StringUtils.isEmpty(validateCode) || !validateCode.equalsIgnoreCase(code)) {
            throw new ValidateCodeException("验证码错误！");
        }
        return true;
    }

    class ValidateCodeException extends AuthenticationException {

        private static final long serialVersionUID = 2672899097153524723L;

        public ValidateCodeException(String explanation) {
            super(explanation);
        }
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        //验证码开关
        if (appConfig.isCaptchaEnabled()) {
            if (StringUtils.equalsIgnoreCase("/login", request.getRequestURI())
                    && StringUtils.equalsIgnoreCase(request.getMethod(), "post")) {
                try {
                    String codeInRequest = ServletRequestUtils.getStringParameter(request, "imageCode");
                    validateResponse(request, codeInRequest);
                } catch (ValidateCodeException e) {
                    authenticationFailureHandler.onAuthenticationFailure(request, response, e);
                    return;
                }
            }
        }

        request.setAttribute("captchaEnabled", appConfig.isCaptchaEnabled());
        filterChain.doFilter(request, response);
    }
}
