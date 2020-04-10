/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.sms.facade;


import com.alibaba.dubbo.config.annotation.Service;
import com.ruoyi.sms.domain.TUserDetail;
import com.ruoyi.sms.domain.WechatAuthDO;
import com.ruoyi.sms.facade.dto.UserDto;
import com.ruoyi.sms.facade.dto.WechatAuthDto;
import com.ruoyi.sms.facade.enums.PrincipalTypeEnum;
import com.ruoyi.sms.facade.request.UserWechatLoginRequest;
import com.ruoyi.sms.repository.UserDetailRepository;
import com.ruoyi.sms.repository.WechatAuthRepository;
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
        WechatAuthDto wechat = wechatRepository.queryByOpenId(request.getOpenId(), principalType);
        UserDto res;
        // 已注册
        if (wechat != null) {
            res = userDetailRepository.queryByPK(wechat.getPrincipalId());
        } else { // 未注册
            String userId = UUID.randomUUID().toString();
            TUserDetail uRecord = new TUserDetail();
            uRecord.setUserId(userId);
            uRecord.setNickname(request.getNickName());
            uRecord.setGender(request.getGender());
            uRecord.setHeadImg(request.getHeadImg());
            userDetailRepository.insert(uRecord, null);

            WechatAuthDO wRecord = new WechatAuthDO();
            wRecord.setOpenId(request.getOpenId());
            wRecord.setAppid(request.getAppid());
            wRecord.setUnionid(request.getUnionid());
            wRecord.setPrincipalId(userId);
            wRecord.setPrincipalType(principalType.getCode());
            wechatRepository.insert(wRecord, null);

            res = userDetailRepository.queryByPK(userId);
        }
        return res;
    }

    @Override
    public UserDto queryByUserId(String userId) {
        return userDetailRepository.queryByPK(userId);
    }

    @Override
    public WechatAuthDto queryByOpenId(String openId) {
        PrincipalTypeEnum principalType = PrincipalTypeEnum.USER;
        return wechatRepository.queryByOpenId(openId, principalType);
    }

    @Override
    public WechatAuthDto queryWechatByUserId(String userId) {
        PrincipalTypeEnum principalType = PrincipalTypeEnum.USER;
        return wechatRepository.queryByPrincipalId(userId, principalType);
    }
}
