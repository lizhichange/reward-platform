package com.ruoyi.mp.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.mp.client.SysWebMainFacadeClient;
import com.ruoyi.reward.facade.api.SysWebMainFacade;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SysWebMainFacadeClientImpl implements SysWebMainFacadeClient {
    @Reference(version = "1.0.0", check = false)
    SysWebMainFacade sysWebMainFacade;

    @Override
    public List<SysWebMainDTO> selectSysWebMainList(SysWebMainDTO sysWebMain) {
        return sysWebMainFacade.selectSysWebMainList(sysWebMain);
    }
}
