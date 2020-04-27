package com.ruoyi.mp.feign;

import com.ruoyi.reward.facade.dto.SysOrderDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * @author sunflower
 */
@FeignClient(value = "reward-service", path = "/rest/order")
public interface ISysOrderFacadeFeign {
    @PostMapping("/selectSysOrderById")
    SysOrderDTO selectSysOrderById(Long id);

    @PostMapping("/selectSysOrderList")
    List<SysOrderDTO> selectSysOrderList(@RequestBody SysOrderDTO sysOrder);

    @PostMapping("/selectSysOrder")
    List<SysOrderDTO> selectSysOrder(@RequestBody SysOrderDTO extSysOrder);

    @PostMapping("/insertSysOrder")
    int insertSysOrder(@RequestBody SysOrderDTO sysOrder);

    @PostMapping("/updateSysOrder")
    int updateSysOrder(@RequestBody SysOrderDTO sysOrder);

    @PostMapping("/updateSysOrderByOrderId")
    int updateSysOrderByOrderId(@RequestBody SysOrderDTO sysOrder);
}
