package com.reward.web.client;

import com.ruoyi.reward.facade.dto.SysOrderDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface ISysOrderFacadeClient {

    List<SysOrderDTO> selectSysOrderList(SysOrderDTO sysOrder);

    int updateSysOrder(SysOrderDTO newOrder);
    int  updateSysOrderByOrderId(SysOrderDTO newOrder);

    int insertSysOrder(SysOrderDTO sysOrderDTO);

    List<SysOrderDTO> selectSysOrder(SysOrderDTO extSysOrder);


    List<SysOrderDTO> selectSysOrderListExt(SysOrderDTO newOrder);
}
