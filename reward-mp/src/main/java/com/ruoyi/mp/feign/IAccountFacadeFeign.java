package com.ruoyi.mp.feign;

import com.ruoyi.reward.facade.dto.SysOrderDTO;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @author sunflower
 */
@FeignClient(value = "reward-service", path = "/rest/account")
public interface IAccountFacadeFeign {
    void take(SysOrderDTO newOrder);
}
