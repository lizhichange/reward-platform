package com.ruoyi.mp.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.mp.client.ISysConfigClient;
import com.ruoyi.reward.facade.api.ISysConfigFacade;
import org.springframework.stereotype.Component;

@Component
public class ISysConfigClientImpl implements ISysConfigClient {

    @Reference(version = "1.0.0", check = false)
    ISysConfigFacade sysConfigFacade;

    @Override
    public String selectConfigByKey(String key) {
        return sysConfigFacade.selectConfigByKey(key);
    }
}
