package com.ruoyi.system.rest;

import com.ruoyi.system.service.ISysConfigService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author sunflower
 */
@RestController("/rest/config")
@Slf4j
public class ISysConfigFacadeController {
    @Autowired
    ISysConfigService sysConfigService;

    @PostMapping("/selectConfigByKey")
    public String selectConfigByKey(String configKey) {
        return sysConfigService.selectConfigByKey(configKey);
    }
}
