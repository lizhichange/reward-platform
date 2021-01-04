package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.UserDetailFacade;
import com.ruoyi.reward.facade.dto.TWechatAuthDTO;
import com.ruoyi.reward.facade.dto.UserDTO;
import com.ruoyi.reward.facade.request.UserWechatLoginRequest;
import com.ruoyi.web.client.UserDetailFacadeClient;
import org.springframework.stereotype.Component;

/**
 * @author sunflower
 */
@Component
public class UserDetailFacadeClientImpl implements UserDetailFacadeClient {


    @Reference(version = "1.0.0", check = false)
    UserDetailFacade userDetailFacade;

    @Override
    public UserDTO wechatLogin(UserWechatLoginRequest request) {
        return null;
    }

    @Override
    public UserDTO queryByUserName(String userName) {
        return null;
    }

    @Override
    public UserDTO queryByUserId(String userId) {
        return null;
    }

    @Override
    public TWechatAuthDTO queryByOpenId(String openId) {
        return userDetailFacade.queryByOpenId(openId);
    }

    @Override
    public int insertTUserDetail(UserDTO userDTO) {
        return 0;
    }

    @Override
    public TWechatAuthDTO queryWechatByUserId(String userId) {
        return null;
    }
}
