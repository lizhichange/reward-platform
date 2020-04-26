package com.ruoyi.system.rest;

import com.ruoyi.reward.facade.api.SysWechatConfigFacade;
import com.ruoyi.reward.facade.dto.SysWechatConfigDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


/**
 * @author sunflower
 */
@RequestMapping("/rest/wechat")
@RestController
@Slf4j
public class SysWechatConfigFacadeController {


    @Autowired
    SysWechatConfigFacade sysWechatConfigFacade;

    @PostMapping("/selectSysWechatConfigList")
    public List<SysWechatConfigDTO> selectSysWechatConfigList(SysWechatConfigDTO sysWechatConfig) {
        return sysWechatConfigFacade.selectSysWechatConfigList(sysWechatConfig);

    }
}
