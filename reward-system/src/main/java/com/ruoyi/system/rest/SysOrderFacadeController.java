package com.ruoyi.system.rest;

import com.ruoyi.reward.facade.api.SysOrderFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author sunflower
 */
@RestController
@RequestMapping("/rest/order")
@Slf4j
public class SysOrderFacadeController {

    private final
    SysOrderFacade sysOrderFacade;

    public SysOrderFacadeController(SysOrderFacade sysOrderFacade) {
        this.sysOrderFacade = sysOrderFacade;
    }

    @PostMapping("/selectSysOrderById")
    public SysOrderDTO selectSysOrderById(Long id) {
        return sysOrderFacade.selectSysOrderById(id);
    }

    @PostMapping("/selectSysOrderList")
    public List<SysOrderDTO> selectSysOrderList(@RequestBody SysOrderDTO sysOrder) {

        return sysOrderFacade.selectSysOrderList(sysOrder);
    }

    @PostMapping("/selectSysOrder")
    public List<SysOrderDTO> selectSysOrder(@RequestBody SysOrderDTO extSysOrder) {
        return sysOrderFacade.selectSysOrder(extSysOrder);

    }

    @PostMapping("/selectSysOrderListExt")
    public List<SysOrderDTO> selectSysOrderListExt(@RequestBody SysOrderDTO extSysOrder) {
        return sysOrderFacade.selectSysOrderListExt(extSysOrder);

    }

    @PostMapping("/insertSysOrder")
    public int insertSysOrder(@RequestBody SysOrderDTO sysOrder) {
        return sysOrderFacade.insertSysOrder(sysOrder);
    }

    @PostMapping("/updateSysOrder")
    public int updateSysOrder(@RequestBody SysOrderDTO sysOrder) {
        return sysOrderFacade.updateSysOrder(sysOrder);
    }

    @PostMapping("/updateSysOrderByOrderId")
    public int updateSysOrderByOrderId(@RequestBody SysOrderDTO sysOrder) {
        return sysOrderFacade.updateSysOrderByOrderId(sysOrder);
    }


}
