package com.ruoyi.system.rest;

import com.ruoyi.reward.facade.api.ISysOrderFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
public class ISysOrderFacadeController {

    @Autowired
    ISysOrderFacade sysOrderFacade;

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


    @PostMapping("/insertSysOrder")
    public int insertSysOrder(SysOrderDTO sysOrder) {
        return sysOrderFacade.insertSysOrder(sysOrder);
    }

    @PostMapping("/updateSysOrder")
    public int updateSysOrder(SysOrderDTO sysOrder) {
        return sysOrderFacade.updateSysOrder(sysOrder);
    }

    @PostMapping("/updateSysOrderByOrderId")
    public int updateSysOrderByOrderId(SysOrderDTO sysOrder) {
        return sysOrderFacade.updateSysOrderByOrderId(sysOrder);
    }


}
