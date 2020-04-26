package com.ruoyi.web.feign;

import com.ruoyi.reward.facade.dto.SysWechatConfigDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;


/**
 * @author sunflower
 */
@FeignClient(value = "reward-service")
public interface SysWechatConfigFacadeFeign {


    @PostMapping("/selectSysWechatConfigList")
    public List<SysWechatConfigDTO> selectSysWechatConfigList(@RequestBody SysWechatConfigDTO sysWechatConfig);


}
