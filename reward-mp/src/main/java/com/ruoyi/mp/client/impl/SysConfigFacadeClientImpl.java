package com.ruoyi.mp.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;

import com.ruoyi.mp.client.SysConfigFacadeClient;
import com.ruoyi.reward.facade.api.SysConfigFacade;
import org.springframework.stereotype.Component;

/**
 * @author sunflower
 */
@Component
public class SysConfigFacadeClientImpl implements SysConfigFacadeClient {

    @Reference(version = "1.0.0", check = false)
    SysConfigFacade sysConfigFacade;

    @Override
    public String selectConfigByKey(String key) {
        return sysConfigFacade.selectConfigByKey(key);
    }
}
