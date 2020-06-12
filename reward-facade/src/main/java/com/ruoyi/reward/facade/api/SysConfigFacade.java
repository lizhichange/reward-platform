package com.ruoyi.reward.facade.api;

import com.ruoyi.reward.facade.dto.SysConfigDTO;

public interface SysConfigFacade {
    String selectConfigByKey(String configKey);

    SysConfigDTO queryConfigByKey(String configKey);
}
