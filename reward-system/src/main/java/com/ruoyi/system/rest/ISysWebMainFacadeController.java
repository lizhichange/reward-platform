package com.ruoyi.system.rest;

import com.ruoyi.reward.facade.api.ISysWebMainFacade;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
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
@RequestMapping("/rest/webMain")
@RestController

@Slf4j
public class ISysWebMainFacadeController {
    @Autowired
    ISysWebMainFacade sysWebMainFacade;

    @PostMapping("/selectSysWebMainList")
    public List<SysWebMainDTO> selectSysWebMainList(@RequestBody SysWebMainDTO sysWebMain) {
        return sysWebMainFacade.selectSysWebMainList(sysWebMain);
    }
}
