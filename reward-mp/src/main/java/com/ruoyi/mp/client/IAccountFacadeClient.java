package com.ruoyi.mp.client;

import com.ruoyi.reward.facade.dto.SysOrderDTO;

/**
 * @author sunflower
 */
public interface IAccountFacadeClient {
    void take(SysOrderDTO newOrder) throws Exception;
}
