package com.ruoyi.mp.feign;

import com.ruoyi.reward.facade.dto.SysOrderDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author sunflower
 */
@FeignClient(value = "reward-service", path = "/rest/account")
public interface IAccountFacadeFeign {
    @PostMapping("/take")
    String take(@RequestBody SysOrderDTO dto);
}
