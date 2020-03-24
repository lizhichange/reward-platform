package com.ruoyi.sms.repository;

import com.ruoyi.sms.domain.SysWechatConfig;

public interface WeChatConfigRepository {
    SysWechatConfig envType(String profile);
}
