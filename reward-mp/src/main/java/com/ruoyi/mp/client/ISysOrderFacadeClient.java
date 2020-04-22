package com.ruoyi.mp.client;

import com.ruoyi.reward.facade.dto.SysOrderDTO;

import java.util.List;

public interface ISysOrderFacadeClient {

      List<SysOrderDTO> selectSysOrderList(SysOrderDTO sysOrder);

    int updateSysOrder(SysOrderDTO newOrder);

    List<SysOrderDTO> selectSysOrderListExt(SysOrderDTO newOrder);
}
