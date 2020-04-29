package com.ruoyi.mp.client;

import com.ruoyi.reward.facade.dto.SysOrderDTO;

/**
 * @author sunflower
 */
public interface AccountFacadeClient {
    void take(SysOrderDTO newOrder) throws Exception;
}
