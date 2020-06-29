package com.ruoyi.mp.rest;

import com.ruoyi.mp.controller.BaseController;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author sunflower
 */
@RestController
@RequestMapping("/rest")
@Slf4j
public class RestTestController extends BaseController {

    @PostMapping("/list")
    public List<SysWebMainDTO> list() {
        return sysWebMainFacadeFeign.selectSysWebMainList(new SysWebMainDTO());
    }
}

