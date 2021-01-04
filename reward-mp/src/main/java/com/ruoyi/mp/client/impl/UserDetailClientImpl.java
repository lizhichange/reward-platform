package com.ruoyi.mp.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.mp.client.UserDetailClient;
import com.ruoyi.reward.facade.api.UserDetailFacade;
import com.ruoyi.reward.facade.dto.TWechatAuthDTO;
import com.ruoyi.reward.facade.dto.UserDTO;
import com.ruoyi.reward.facade.request.UserWechatLoginRequest;
import org.springframework.stereotype.Component;

/**
 * @author sunflower
 */
@Component
public class UserDetailClientImpl implements UserDetailClient {

    @Reference(version = "1.0.0", check = false)
    UserDetailFacade userDetailFacade;

    @Override
    public UserDTO wechatLogin(UserWechatLoginRequest request) {
        return userDetailFacade.wechatLogin(request);
    }

    @Override
    public UserDTO queryByUserId(String userId) {
        return userDetailFacade.queryByUserId(userId);
    }

    @Override
    public TWechatAuthDTO queryByOpenId(String openId) {
        return userDetailFacade.queryByOpenId(openId);
    }

    @Override
    public TWechatAuthDTO queryWechatByUserId(String userId) {
        return userDetailFacade.queryWechatByUserId(userId);
    }
}
