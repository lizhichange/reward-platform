package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.SysOrderFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.web.client.SysOrderFacadeClient;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class SysOrderFacadeClientImpl implements SysOrderFacadeClient {
    @Reference(version = "1.0.0", check = false)
    SysOrderFacade sysOrderFacade;

    @Override
    public List<SysOrderDTO> selectSysOrderList(SysOrderDTO sysOrder) {
        return sysOrderFacade.selectSysOrderList(sysOrder);
    }

    @Override
    public int updateSysOrder(SysOrderDTO newOrder) {
        return sysOrderFacade.updateSysOrder(newOrder);
    }

    @Override
    public int updateSysOrderByOrderId(SysOrderDTO newOrder) {
        return sysOrderFacade.updateSysOrderByOrderId(newOrder);
    }

    @Override
    public int insertSysOrder(SysOrderDTO sysOrderDTO) {
        return sysOrderFacade.insertSysOrder(sysOrderDTO);
    }

    @Override
    public List<SysOrderDTO> selectSysOrder(SysOrderDTO extSysOrder) {
        return sysOrderFacade.selectSysOrder(extSysOrder);
    }

    @Override
    public List<SysOrderDTO> selectSysOrderListExt(SysOrderDTO newOrder) {
        return sysOrderFacade.selectSysOrderListExt(newOrder);
    }
}
