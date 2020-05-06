package com.ruoyi.web.security;

import com.ruoyi.web.service.CustomUserDetailsService;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 * @author sunflower
 */
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {


    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    // CustomUserDetailsService

    private final CustomUserDetailsService userDetailsService;

    private final UnauthorizedEntryPoint unauthorizedEntryPoint;


    // Success Handler
    private final AuthenticationSuccessHandler authenticationSuccessHandler;

    // Failure Handler
    private final AuthenticationFailureHandler authenticationFailureHandler;



    @Autowired
    public SecurityConfiguration(
            @Qualifier("ajaxAuthenticationSuccessHandler") AuthenticationSuccessHandler authenticationSuccessHandler,
            @Qualifier("ajaxAuthenticationFailureHandler") AuthenticationFailureHandler authenticationFailureHandler,
            CustomUserDetailsService userDetailsService,
            UnauthorizedEntryPoint unauthorizedEntryPoint, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.authenticationFailureHandler = authenticationFailureHandler;
        this.authenticationSuccessHandler = authenticationSuccessHandler;
        this.userDetailsService = userDetailsService;
        this.unauthorizedEntryPoint = unauthorizedEntryPoint;
    }

    /**
     * 定义Web策略
     *
     * @return
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        //定义security应该忽略的策略
        // web.ignoring().antMatchers("/login/doLogin");
        web.ignoring().antMatchers("/register");

    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder);
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //这里是重点，必须要禁用csrf才能使用ajax登录方式，为了保证安全,否则会出现怎么样都无法请求到ajax登录接口
        http.csrf().disable();

        /**
         *
         *          http.authorizeRequests()
         *                 .antMatchers("/video/queryOrder").authenticated()
         *                 .anyRequest().permitAll()
         *                 .and()
         *                 .formLogin().loginPage("/login").permitAll();
         *
         */

        http.exceptionHandling().authenticationEntryPoint(unauthorizedEntryPoint)
                .and()
                .authorizeRequests().antMatchers("/video/queryOrder").authenticated() //需要
                .anyRequest().permitAll() //其他不需要
                .and()
                .formLogin()
                .loginPage("/login.html")//登录页面，加载登录的html页面
                .loginProcessingUrl("/login")//发送Ajax请求的路径
                .usernameParameter("username")
                .passwordParameter("password")
                .successHandler(authenticationSuccessHandler)
                .failureHandler(authenticationFailureHandler)
                .permitAll()
                .and()
                .logout()
                .logoutUrl("/logout")
                .permitAll();


    }


}
