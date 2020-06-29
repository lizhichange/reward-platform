package com.ruoyi.web.feign.fallback;

import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.web.feign.AccountFacadeFeign;
import org.springframework.stereotype.Component;

/**
 * @author sunflower
 */
@Component
public class AccountFacadeFeignHystrix implements AccountFacadeFeign {
    @Override
    public String take(SysOrderDTO dto) {
        return "fail";
    }
}
