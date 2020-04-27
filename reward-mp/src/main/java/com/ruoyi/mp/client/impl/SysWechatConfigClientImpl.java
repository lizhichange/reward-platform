package com.ruoyi.mp.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.mp.client.SysWechatConfigClient;
import com.ruoyi.reward.facade.api.SysWechatConfigFacade;
import com.ruoyi.reward.facade.dto.SysWechatConfigDTO;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class SysWechatConfigClientImpl implements SysWechatConfigClient {

    @Reference(version = "1.0.0", check = false)
    SysWechatConfigFacade sysWechatConfigFacade;

    @Override
    public List<SysWechatConfigDTO> selectSysWechatConfigList(SysWechatConfigDTO sysWechatConfig) {
        return sysWechatConfigFacade.selectSysWechatConfigList(sysWechatConfig);
    }

}
