package com.ruoyi.mp.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.mp.client.ISysWebMainFacadeClient;
import com.ruoyi.reward.facade.api.ISysWebMainFacade;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ISysWebMainFacadeClientImpl implements ISysWebMainFacadeClient {
    @Reference(version = "1.0.0", check = false)
    ISysWebMainFacade sysWebMainFacade;

    @Override
    public List<SysWebMainDTO> selectSysWebMainList(SysWebMainDTO sysWebMain) {
        return sysWebMainFacade.selectSysWebMainList(sysWebMain);
    }
}
