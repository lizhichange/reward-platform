package com.ruoyi.shortchain.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.SysShortFacade;
import com.ruoyi.reward.facade.dto.SysShortDTO;
import com.ruoyi.shortchain.client.SysShortFacadeClient;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class
SysShortFacadeClientImpl implements SysShortFacadeClient {

    @Reference(version = "1.0.0", check = false)
    SysShortFacade sysShortFacade;

    @Override
    public SysShortDTO selectSysShortById(Long id) {
        return sysShortFacade.selectSysShortById(id);
    }

    @Override
    public List<SysShortDTO> selectSysShortList(SysShortDTO dto) {
        return sysShortFacade.selectSysShortList(dto);
    }

    @Override
    public int insertSysShort(SysShortDTO dto) {
        return sysShortFacade.insertSysShort(dto);
    }
}
