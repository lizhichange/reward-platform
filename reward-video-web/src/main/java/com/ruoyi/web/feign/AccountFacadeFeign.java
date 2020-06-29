package com.ruoyi.web.feign;


import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.web.feign.fallback.AccountFacadeFeignHystrix;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2020-04-06
 */
@FeignClient(value = "reward-service", path = "/rest/account", fallback = AccountFacadeFeignHystrix.class)
public interface AccountFacadeFeign {

    @PostMapping("/take")
    String take(@RequestBody SysOrderDTO dto);
}