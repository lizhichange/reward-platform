package com.ruoyi.web.security;

import com.ruoyi.web.service.CustomUserDetailsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import javax.servlet.http.HttpServletRequest;

/**
 * @author sunflower
 */
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    public static final Logger LOGGER = LoggerFactory.getLogger(SecurityConfiguration.class);

    private final PasswordEncoder passwordEncoder;

    // CustomUserDetailsService

    private final CustomUserDetailsService userDetailsService;

    private final UnauthorizedEntryPoint unauthorizedEntryPoint;

    // Success Handler
    private final AuthenticationSuccessHandler authenticationSuccessHandler;

    // Failure Handler
    private final AuthenticationFailureHandler authenticationFailureHandler;

    private final
    ValidateCodeFilter validateCodeFilter;

    @Autowired
    public SecurityConfiguration(
            @Qualifier("ajaxAuthenticationSuccessHandler") AuthenticationSuccessHandler authenticationSuccessHandler,
            @Qualifier("ajaxAuthenticationFailureHandler") AuthenticationFailureHandler authenticationFailureHandler,
            CustomUserDetailsService userDetailsService,
            UnauthorizedEntryPoint unauthorizedEntryPoint, PasswordEncoder passwordEncoder, ValidateCodeFilter validateCodeFilter) {
        this.authenticationFailureHandler = authenticationFailureHandler;
        this.authenticationSuccessHandler = authenticationSuccessHandler;
        this.userDetailsService = userDetailsService;
        this.unauthorizedEntryPoint = unauthorizedEntryPoint;
        this.passwordEncoder = passwordEncoder;
        this.validateCodeFilter = validateCodeFilter;
    }

    /**
     * 定义Web策略
     *
     * @return
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        //定义security应该忽略的策略
        web.ignoring().antMatchers("/register");

    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //这里是重点，必须要禁用csrf才能使用ajax登录方式，为了保证安全,否则会出现怎么样都无法请求到ajax登录接口
        http.csrf().disable();
        //添加验证码效验过滤器
        http.addFilterBefore(validateCodeFilter, UsernamePasswordAuthenticationFilter.class);

        /**
         * always –如果一个会话不存在，将始终创建一个会话
         * ifRequired – 仅在需要时才创建会话（默认）
         * never –框架将永远不会创建会话，但是如果会话已经存在，它将使用一个会话
         * stateless – Spring Security不会创建或使用任何会话
         */
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED);

        http.exceptionHandling().authenticationEntryPoint(unauthorizedEntryPoint)
                .and() //需要
                .authorizeRequests().antMatchers("/video/queryOrder").authenticated()
                .anyRequest().permitAll() //其他不需要
                .and()
                .formLogin()
                //登录页面，加载登录的html页面
                .loginPage("/login.html?redirect_uri")
                //发送Ajax请求的路径
                .loginProcessingUrl("/login")
                .usernameParameter("username")
                .passwordParameter("password")
                .successHandler(authenticationSuccessHandler)
                .failureHandler(authenticationFailureHandler)
                .permitAll()
                .and()
                // logout
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/video")
                .permitAll()

                .and()
                .exceptionHandling()
                .defaultAuthenticationEntryPointFor(unauthorizedEntryPoint, new AjaxRequestMatcher())
        ;


    }

    static class AjaxRequestMatcher implements RequestMatcher {

        /**
         * 匹配Ajax请求
         *
         * @param request
         * @return
         */
        @Override
        public boolean matches(HttpServletRequest request) {
            boolean matches = "XMLHttpRequest".equals(request.getHeader("X-Requested-With")) ||
                    request.getHeader("Accept") != null &&
                            request.getHeader("Accept").contains("application/json");
            LOGGER.info("matches:{}", matches);
            return matches;
        }


    }

}