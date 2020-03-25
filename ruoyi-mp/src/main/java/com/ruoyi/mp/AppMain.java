package com.ruoyi.mp;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.spring.context.annotation.EnableDubbo;
import com.ruoyi.sms.facade.api.DemoService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * @author wahaha
 */
@SpringBootApplication
@EnableScheduling
public class AppMain {

    public static void main(String[] args) {
        SpringApplication.run(AppMain.class, args);
    }


}
