package com.ruoyi.web.feign;

import com.ruoyi.reward.facade.dto.SysOrderDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * @author sunflower
 */
@FeignClient(value = "reward-service")
public interface ISysOrderFacadeFeign {
    @PostMapping("/selectSysOrderById")
    SysOrderDTO selectSysOrderById(Long id);

    @PostMapping("/selectSysOrderList")
    List<SysOrderDTO> selectSysOrderList(@RequestBody  SysOrderDTO sysOrder);

    @PostMapping("/selectSysOrder")
    public List<SysOrderDTO> selectSysOrder(@RequestBody  SysOrderDTO extSysOrder);

    @PostMapping("/insertSysOrder")
    public int insertSysOrder(@RequestBody  SysOrderDTO sysOrder);

    @PostMapping("/updateSysOrder")
    public int updateSysOrder(@RequestBody  SysOrderDTO sysOrder);

    @PostMapping("/updateSysOrderByOrderId")
    public int updateSysOrderByOrderId(@RequestBody SysOrderDTO sysOrder);
}
