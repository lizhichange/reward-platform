package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.ISysConfigFacade;
import com.ruoyi.web.client.ISysConfigFacadeClient;
import org.springframework.stereotype.Component;

@Component
public class ISysConfigFacadeClientImpl implements ISysConfigFacadeClient {

    @Reference(version = "1.0.0", check = false)
    ISysConfigFacade sysConfigFacade;

    @Override
    public String selectConfigByKey(String key) {
        return sysConfigFacade.selectConfigByKey(key);
    }
}
