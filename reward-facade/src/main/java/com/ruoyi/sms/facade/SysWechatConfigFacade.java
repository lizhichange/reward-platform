package com.ruoyi.sms.facade;

import com.ruoyi.sms.facade.dto.SysWechatConfigDTO;

import java.util.List;

public interface SysWechatConfigFacade {

    List<SysWechatConfigDTO> selectSysWechatConfigList(SysWechatConfigDTO sysWechatConfig);

}
