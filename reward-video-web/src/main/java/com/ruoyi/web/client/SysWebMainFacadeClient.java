package com.ruoyi.web.client;

import com.ruoyi.reward.facade.dto.SysWebMainDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface SysWebMainFacadeClient {
    List<SysWebMainDTO> selectSysWebMainList(SysWebMainDTO sysWebMain);

}
