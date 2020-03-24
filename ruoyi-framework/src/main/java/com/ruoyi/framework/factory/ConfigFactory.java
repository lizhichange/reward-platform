package com.ruoyi.framework.factory;


import com.ruoyi.system.domain.SysWechatConfig;
import com.ruoyi.system.mapper.SysWechatConfigMapper;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * @author wahaha
 */
@Component
@Slf4j
public class ConfigFactory {


    @Autowired
    private ConfigurableEnvironment env;

    @Getter
    private SysWechatConfig sysWechatConfig;
    @Autowired
    SysWechatConfigMapper sysWechatConfigMapper;


    @PostConstruct
    @Scheduled(cron = "0 * * * * ? ")
    void init() {
        String profile = env.getActiveProfiles()[0];
        SysWechatConfig item = new SysWechatConfig();
        item.setEnvType(profile);
        List<SysWechatConfig> list = sysWechatConfigMapper.selectSysWechatConfigList(item);
        if (!CollectionUtils.isEmpty(list)) {
            sysWechatConfig = list.get(0);
        }
        log.info("weChatConfig:{}", sysWechatConfig);

    }


}
