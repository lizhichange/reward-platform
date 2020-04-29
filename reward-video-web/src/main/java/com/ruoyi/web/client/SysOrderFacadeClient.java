package com.ruoyi.web.client;

import com.ruoyi.reward.facade.dto.SysOrderDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface SysOrderFacadeClient {

    List<SysOrderDTO> selectSysOrderList(SysOrderDTO sysOrder);

    int updateSysOrder(SysOrderDTO newOrder);
    int  updateSysOrderByOrderId(SysOrderDTO newOrder);

    int insertSysOrder(SysOrderDTO sysOrderDTO);

    List<SysOrderDTO> selectSysOrder(SysOrderDTO extSysOrder);


    List<SysOrderDTO> selectSysOrderListExt(SysOrderDTO newOrder);
}
