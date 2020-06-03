package com.ruoyi.mp.client;

import com.ruoyi.reward.facade.dto.SysOrderDTO;

import java.util.List;

public interface SysOrderFacadeClient {

      List<SysOrderDTO> selectSysOrderList(SysOrderDTO sysOrder);

    int updateSysOrder(SysOrderDTO newOrder);
    SysOrderDTO selectSysOrderByOrderId(String orderId);

    List<SysOrderDTO> selectSysOrderListExt(SysOrderDTO newOrder);
}
