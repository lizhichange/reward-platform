package com.ruoyi.system.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.ruoyi.reward.facade.api.SysConfigFacade;
import com.ruoyi.reward.facade.dto.SysConfigDTO;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author sunflower
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class
SysConfigFacadeImpl implements SysConfigFacade {
    @Autowired
    ISysConfigService sysConfigService;

    @Override
    public String selectConfigByKey(String configKey) {
        return sysConfigService.selectConfigByKey(configKey);
    }

    @Override
    public SysConfigDTO queryConfigByKey(String configKey) {
        SysConfig sysConfig = sysConfigService.queryConfigByKey(configKey);
        if (sysConfig == null) {
            return null;
        }

        SysConfigDTO dto = new SysConfigDTO();
        BeanUtils.copyProperties(sysConfig, dto);
        return dto;
    }
}
