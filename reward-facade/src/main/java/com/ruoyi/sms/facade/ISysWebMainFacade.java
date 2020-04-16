package com.ruoyi.sms.facade;

import com.ruoyi.sms.facade.dto.SysWebMainDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface ISysWebMainFacade {

    List<SysWebMainDTO> selectSysWebMainList(SysWebMainDTO sysWebMain);

}
