package com.ruoyi.system.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.collect.Lists;
import com.ruoyi.sms.facade.SysWechatConfigFacade;
import com.ruoyi.sms.facade.dto.SysWebMainDTO;
import com.ruoyi.sms.facade.dto.SysWechatConfigDTO;
import com.ruoyi.system.domain.SysWebMain;
import com.ruoyi.system.domain.SysWechatConfig;
import com.ruoyi.system.mapper.SysWechatConfigMapper;
import com.ruoyi.system.service.ISysWebMainService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

@Service(
        version = "1.0.0",
        timeout = 15000
)
public class SysWechatConfigFacadeImpl implements SysWechatConfigFacade {


    @Autowired
    SysWechatConfigMapper sysWechatConfigMapper;

    @Override
    public List<SysWechatConfigDTO> selectSysWechatConfigList(SysWechatConfigDTO sysWechatConfig) {
        SysWechatConfig item = new SysWechatConfig();
        BeanUtils.copyProperties(sysWechatConfig, item);
        List<SysWechatConfig> list = sysWechatConfigMapper.selectSysWechatConfigList(item);
        if (CollectionUtils.isEmpty(list)) {
            return Lists.newArrayList();
        }
        return list.stream().map(it -> {
            SysWechatConfigDTO dto = new SysWechatConfigDTO();
            BeanUtils.copyProperties(it, dto);
            return dto;
        }).collect(Collectors.toList());
    }
}
