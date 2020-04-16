package com.ruoyi.reward.facade.api;

import com.ruoyi.reward.facade.dto.SysWebMainDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface ISysWebMainFacade {

    List<SysWebMainDTO> selectSysWebMainList(SysWebMainDTO sysWebMain);

}
