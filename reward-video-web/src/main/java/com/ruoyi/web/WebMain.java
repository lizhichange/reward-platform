package com.ruoyi.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author wahaha
 */
@SpringBootApplication
@EnableScheduling
@CrossOrigin(methods = {RequestMethod.GET, RequestMethod.DELETE})
@EnableDiscoveryClient
@EnableFeignClients
@EnableEurekaClient
@EnableCaching
@RefreshScope
public class WebMain {

    public static void main(String[] args) {
        SpringApplication.run(WebMain.class, args);
    }




}
