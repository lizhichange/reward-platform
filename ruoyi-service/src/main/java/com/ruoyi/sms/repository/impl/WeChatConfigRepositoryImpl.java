package com.ruoyi.sms.repository.impl;

import com.ruoyi.sms.domain.SysWechatConfig;
import com.ruoyi.sms.domain.SysWechatConfigExample;
import com.ruoyi.sms.mapper.SysWechatConfigMapper;
import com.ruoyi.sms.repository.WeChatConfigRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Repository
public class WeChatConfigRepositoryImpl implements WeChatConfigRepository {
    @Autowired
    SysWechatConfigMapper sysWechatConfigMapper;
    @Override
    public SysWechatConfig envType(String profile) {
        SysWechatConfigExample example=new SysWechatConfigExample();

        List<SysWechatConfig> list = sysWechatConfigMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(list)){
            return null;
        }
        return list.get(0);
    }
}
