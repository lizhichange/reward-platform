package com.ruoyi.mp.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.mp.client.IAccountFacadeClient;
import com.ruoyi.reward.facade.api.IAccountFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import org.springframework.stereotype.Component;

/**
 * @author sunflower
 */
@Component
public class
IAccountFacadeClientImpl implements IAccountFacadeClient {

    @Reference(version = "1.0.0", check = false)
    IAccountFacade accountFacade;

    @Override
    public void take(SysOrderDTO newOrder) throws Exception {
        accountFacade.take(newOrder);
    }
}
