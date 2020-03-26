package com.ruoyi.system.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.collect.Lists;
import com.ruoyi.sms.facade.ISysWebMainFacade;
import com.ruoyi.sms.facade.dto.SysWebMainDTO;
import com.ruoyi.system.domain.SysWebMain;
import com.ruoyi.system.service.ISysWebMainService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author sunflower
 */

@Service(
        version = "1.0.0",
        timeout = 15000
)
public class ISysWebMainFacadeImpl implements ISysWebMainFacade {
    @Autowired
    ISysWebMainService sysWebMainService;

    @Override
    public List<SysWebMainDTO> selectSysWebMainList(SysWebMainDTO sysWebMain) {
        SysWebMain item = new SysWebMain();
        BeanUtils.copyProperties(sysWebMain, item);
        List<SysWebMain> list = sysWebMainService.selectSysWebMainList(item);
        if (CollectionUtils.isEmpty(list)) {
            return Lists.newArrayList();
        }
        return list.stream().map(it ->
        {
            SysWebMainDTO dto = new SysWebMainDTO();
            BeanUtils.copyProperties(it, dto);
            return dto;
        }).collect(Collectors.toList());

    }
}