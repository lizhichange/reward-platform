package com.ruoyi.mp.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;

import com.ruoyi.mp.client.ISysOrderFacadeClient;
import com.ruoyi.reward.facade.api.ISysOrderFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class ISysOrderFacadeClientImpl implements ISysOrderFacadeClient {
    @Reference(version = "1.0.0", check = false)
    ISysOrderFacade sysOrderFacade;

    @Override
    public List<SysOrderDTO> selectSysOrderList(SysOrderDTO sysOrder) {
        return sysOrderFacade.selectSysOrderList(sysOrder);
    }

    @Override
    public int updateSysOrder(SysOrderDTO newOrder) {
        return sysOrderFacade.updateSysOrder(newOrder);
    }

    @Override
    public List<SysOrderDTO> selectSysOrderListExt(SysOrderDTO newOrder) {
        return sysOrderFacade.selectSysOrderListExt(newOrder);
    }
}
