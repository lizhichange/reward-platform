package com.ruoyi.reward.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.collect.Lists;
import com.ruoyi.reward.facade.api.SysShortFacade;
import com.ruoyi.reward.facade.dto.SysShortDTO;
import com.ruoyi.reward.service.SysShortService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service(
        version = "1.0.0",
        timeout = 15000
)
public class SysShortFacadeImpl implements SysShortFacade {
    @Autowired
    SysShortService sysShortService;

    @Override
    public SysShortDTO selectSysShortById(Long id) {
        SysShort sysShort = sysShortService.selectSysShortById(id);
        if (sysShort == null) {
            return null;
        }
        SysShortDTO sysShortDTO = new SysShortDTO();
        BeanUtils.copyProperties(sysShort, sysShortDTO);
        return sysShortDTO;
    }

    @Override
    public List<SysShortDTO> selectSysShortList(SysShortDTO dto) {
        SysShort sysShort = new SysShort();
        BeanUtils.copyProperties(dto, sysShort);
        List<SysShort> list = sysShortService.selectSysShortList(sysShort);
        if (CollectionUtils.isEmpty(list)) {
            return Lists.newArrayList();
        }

        return list.stream().map(
                item -> {
                    SysShortDTO sysShortDTO = new SysShortDTO();
                    BeanUtils.copyProperties(item, sysShortDTO);
                    return sysShortDTO;
                }
        ).collect(Collectors.toList());
    }

    @Override
    public int insertSysShort(SysShortDTO dto) {
        SysShort sysShort = new SysShort();
        BeanUtils.copyProperties(dto, sysShort);
        return sysShortService.insertSysShort(sysShort);
    }
}
