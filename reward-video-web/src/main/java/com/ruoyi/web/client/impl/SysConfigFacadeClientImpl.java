package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.SysConfigFacade;
import com.ruoyi.reward.facade.dto.SysConfigDTO;
import com.ruoyi.web.client.SysConfigFacadeClient;
import org.springframework.stereotype.Component;

/**
 * @author sunflower
 */
@Component
public class
SysConfigFacadeClientImpl implements SysConfigFacadeClient {

    @Reference(version = "1.0.0", check = false)
    SysConfigFacade sysConfigFacade;

    @Override
    public String selectConfigByKey(String key) {
        return sysConfigFacade.selectConfigByKey(key);
    }

    @Override
    public SysConfigDTO queryConfigByKey(String configKey) {
        return sysConfigFacade.queryConfigByKey(configKey);
    }
}
