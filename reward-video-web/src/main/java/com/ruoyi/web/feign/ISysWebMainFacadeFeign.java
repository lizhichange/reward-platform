package com.ruoyi.web.feign;

import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * @author sunflower
 */
@FeignClient(value = "reward-service")

public interface ISysWebMainFacadeFeign {

    @PostMapping("/selectSysWebMainList")
    public List<SysWebMainDTO> selectSysWebMainList(@RequestBody SysWebMainDTO sysWebMain);
}
