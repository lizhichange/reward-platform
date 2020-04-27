package com.ruoyi.mp.client;

import com.ruoyi.reward.facade.dto.SysWechatConfigDTO;

import java.util.List;

public interface SysWechatConfigClient {
    List<SysWechatConfigDTO> selectSysWechatConfigList(SysWechatConfigDTO sysWechatConfig);

}
