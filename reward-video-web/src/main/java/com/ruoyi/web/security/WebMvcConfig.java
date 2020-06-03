package com.ruoyi.web.security;

import com.ruoyi.web.interceptor.WechatAuthInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author sunflower
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {


    /**
     * 明文密码
     *
     * @return
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }

    @Autowired
    WechatAuthInterceptor wechatAuthInterceptor;


    /**
     * 自定义拦截规则
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(wechatAuthInterceptor).addPathPatterns("/video/**");
    }
}


/* https://stackoverflow.com/questions/47552835/the-type-webmvcconfigureradapter-is-deprecated */
/*
	@Configuration
	public class WebMvcConfig extends WebMvcConfigurerAdapter {
	
		@Bean
		public BCryptPasswordEncoder passwordEncoder() {
			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			return bCryptPasswordEncoder;
		}
	
	}

*/
