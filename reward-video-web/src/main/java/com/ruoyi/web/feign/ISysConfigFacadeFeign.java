package com.ruoyi.web.feign;


import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @author sunflower
 */
@FeignClient(value = "reward-service")

public interface ISysConfigFacadeFeign {

    @PostMapping("/selectConfigByKey")
    public String selectConfigByKey(String configKey);
}
