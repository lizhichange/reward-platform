package com.reward.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author wahaha
 */
@SpringBootApplication
@EnableScheduling
@EnableCaching
@CrossOrigin(methods = {RequestMethod.GET, RequestMethod.DELETE})
public class WebMain {

    public static void main(String[] args) {
        SpringApplication.run(WebMain.class, args);
    }


}
