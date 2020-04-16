package com.ruoyi.reward.facade.api;

import com.ruoyi.reward.facade.dto.SysWechatConfigDTO;

import java.util.List;

public interface SysWechatConfigFacade {

    List<SysWechatConfigDTO> selectSysWechatConfigList(SysWechatConfigDTO sysWechatConfig);

}
