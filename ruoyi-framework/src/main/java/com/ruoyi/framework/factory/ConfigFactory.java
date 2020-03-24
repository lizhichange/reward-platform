package com.ruoyi.framework.factory;


 import com.ruoyi.sms.domain.SysWechatConfig;
 import com.ruoyi.sms.repository.WeChatConfigRepository;
 import lombok.Getter;
 import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @author wahaha
 */
@Component
@Slf4j
public class ConfigFactory {


    @Autowired
    private ConfigurableEnvironment env;

    @Getter
    private SysWechatConfig weChatConfig;
    @Autowired
    WeChatConfigRepository weChatConfigRepository;


    @PostConstruct
    @Scheduled(cron="0 * * * * ? ")
    void init(){
        String profile = env.getActiveProfiles()[0];
        weChatConfig = weChatConfigRepository.envType(profile);
        log.info("weChatConfig:{}",  weChatConfig);

    }




}
