package com.ruoyi.web.client;

import com.ruoyi.reward.facade.dto.SysConfigDTO;

public interface SysConfigFacadeClient {
    String selectConfigByKey(String key);

    SysConfigDTO queryConfigByKey(String configKey);
}
