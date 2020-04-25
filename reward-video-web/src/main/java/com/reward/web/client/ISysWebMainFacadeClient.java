package com.reward.web.client;

import com.ruoyi.reward.facade.dto.SysWebMainDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface ISysWebMainFacadeClient {
    List<SysWebMainDTO> selectSysWebMainList(SysWebMainDTO sysWebMain);

}
