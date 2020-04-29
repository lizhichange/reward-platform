package com.ruoyi.mp.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.mp.client.AccountFacadeClient;
import com.ruoyi.reward.facade.api.AccountFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import org.springframework.stereotype.Component;

/**
 * @author sunflower
 */
@Component
public class AccountFacadeClientImpl implements AccountFacadeClient {

    @Reference(version = "1.0.0", check = false)
    AccountFacade accountFacade;

    @Override
    public void take(SysOrderDTO newOrder) throws Exception {
        accountFacade.take(newOrder);
    }
}
