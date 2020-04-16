package com.ruoyi.mp.factory;


import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.sms.facade.SysWechatConfigFacade;
import com.ruoyi.sms.facade.dto.SysWechatConfigDTO;
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
    ConfigurableEnvironment env;

    @Getter
    SysWechatConfigDTO sysWechatConfig;

    @Reference(version = "1.0.0", check = false)
    SysWechatConfigFacade sysWechatConfigFacade;

    @Autowired
    MpAuthConfig mpAuthConfig;


    @PostConstruct
    @Scheduled(cron = "0 * * * * ? ")
    void init() {
        try {
            String profile = env.getActiveProfiles()[0];
            SysWechatConfigDTO item = new SysWechatConfigDTO();
            item.setEnvType(profile);
            item.setConfigCode(mpAuthConfig.getConfigCode());
            List<SysWechatConfigDTO> list = sysWechatConfigFacade.selectSysWechatConfigList(item);
            if (!CollectionUtils.isEmpty(list)) {
                sysWechatConfig = list.get(0);
            }
            log.info("weChatConfig:{}", sysWechatConfig);
        } catch (Exception e) {
            log.info(e.getMessage(), e);
        }
    }
}
