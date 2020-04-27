package com.ruoyi.mp.factory;


import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.mp.feign.SysWechatConfigFacadeFeign;
import com.ruoyi.reward.facade.dto.SysWechatConfigDTO;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.ConfigurableEnvironment;
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
    @Autowired
    SysWechatConfigFacadeFeign sysWechatConfigFacadeFeign;

    @Autowired
    MpAuthConfig mpAuthConfig;


    @PostConstruct
//    @Scheduled(cron = "0 0/3 * * * ?")
    void init() {
        try {
            String profile = env.getActiveProfiles()[0];
            SysWechatConfigDTO item = new SysWechatConfigDTO();
            item.setEnvType(profile);
            item.setConfigCode(mpAuthConfig.getConfigCode());
            List<SysWechatConfigDTO> list = sysWechatConfigFacadeFeign.selectSysWechatConfigList(item);
            if (!CollectionUtils.isEmpty(list)) {
                sysWechatConfig = list.get(0);
            }
            log.info("weChatConfig:{}", sysWechatConfig);
        } catch (Exception e) {
            log.info(e.getMessage(), e);
        }
    }
}
