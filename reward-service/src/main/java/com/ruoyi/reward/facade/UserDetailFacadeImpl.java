/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.reward.facade;


import com.alibaba.dubbo.config.annotation.Service;
import com.ruoyi.reward.facade.api.UserDetailFacade;
import com.ruoyi.reward.facade.dto.TWechatAuthDTO;
import com.ruoyi.reward.facade.dto.UserDto;
import com.ruoyi.reward.facade.enums.PrincipalTypeEnum;
import com.ruoyi.reward.facade.request.UserWechatLoginRequest;
import com.ruoyi.reward.domain.TUserDetail;
import com.ruoyi.reward.domain.TWechatAuth;
import com.ruoyi.reward.repository.UserDetailRepository;
import com.ruoyi.reward.repository.WechatAuthRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.UUID;


/**
 * @author Willard Hu on 2017/11/1.
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class UserDetailFacadeImpl implements UserDetailFacade {
    @Autowired
    WechatAuthRepository wechatRepository;
    @Autowired
    UserDetailRepository userDetailRepository;

    @Override
    public UserDto wechatLogin(UserWechatLoginRequest request) {
        PrincipalTypeEnum principalType = PrincipalTypeEnum.USER;
        TWechatAuthDTO wechat = wechatRepository.queryByOpenId(request.getOpenId(), principalType);
        UserDto res;
        // 已注册
        if (wechat != null) {
            res = userDetailRepository.queryByPK(wechat.getUserId());
            if (res == null) {
                TUserDetail uRecord = new TUserDetail();
                uRecord.setUserId(wechat.getUserId());
                uRecord.setNickname(request.getNickName());
                uRecord.setGender(request.getGender());
                uRecord.setAvatarUrl(request.getHeadImg());
                userDetailRepository.insert(uRecord, null);
                res = userDetailRepository.queryByPK(wechat.getUserId());
            }
        } else { // 未注册
            res = take(request, principalType);
        }
        return res;
    }

    private UserDto take(UserWechatLoginRequest request, PrincipalTypeEnum principalType) {
        UserDto res;
        String userId = UUID.randomUUID().toString();
        TUserDetail uRecord = new TUserDetail();
        uRecord.setUserId(userId);
        uRecord.setNickname(request.getNickName());
        uRecord.setGender(request.getGender());
        uRecord.setAvatarUrl(request.getHeadImg());
        userDetailRepository.insert(uRecord, null);

        TWechatAuth wRecord = new TWechatAuth();
        wRecord.setOpenId(request.getOpenId());
        wRecord.setAppid(request.getAppid());
        wRecord.setUnionid(request.getUnionid());
        wRecord.setUserId(userId);

        wRecord.setUserType(principalType.getCode());
        wechatRepository.insert(wRecord, null);

        res = userDetailRepository.queryByPK(userId);
        return res;
    }

    @Override
    public UserDto queryByUserId(String userId) {
        return userDetailRepository.queryByPK(userId);
    }

    @Override
    public TWechatAuthDTO queryByOpenId(String openId) {
        PrincipalTypeEnum principalType = PrincipalTypeEnum.USER;
        return wechatRepository.queryByOpenId(openId, principalType);
    }

    @Override
    public TWechatAuthDTO queryWechatByUserId(String userId) {
        PrincipalTypeEnum principalType = PrincipalTypeEnum.USER;
        return wechatRepository.queryByPrincipalId(userId, principalType);
    }
}
