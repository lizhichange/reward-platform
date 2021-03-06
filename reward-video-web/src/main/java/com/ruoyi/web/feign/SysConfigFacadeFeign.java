package com.ruoyi.web.feign;


import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author sunflower
 */
@FeignClient(value = "reward-service", path = "/rest/config")

public interface SysConfigFacadeFeign {

    @PostMapping("/selectConfigByKey")
    String selectConfigByKey(@RequestParam("configKey") String configKey);
}
