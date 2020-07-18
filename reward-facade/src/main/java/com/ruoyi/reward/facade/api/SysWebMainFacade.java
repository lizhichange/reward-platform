package com.ruoyi.reward.facade.api;

import com.ruoyi.reward.facade.dto.SysWebMainDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface SysWebMainFacade {

    List<SysWebMainDTO> selectSysWebMainList(SysWebMainDTO sysWebMain);

    int updateSysWebMain(SysWebMainDTO sysWebMain);

}
