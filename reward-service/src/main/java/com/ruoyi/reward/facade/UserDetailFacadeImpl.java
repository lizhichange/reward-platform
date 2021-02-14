/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.reward.facade;


import com.alibaba.dubbo.config.annotation.Service;
import com.ruoyi.common.sequence.ConcurrentSequence;
import com.ruoyi.reward.domain.TUserDetail;
import com.ruoyi.reward.domain.TWechatAuth;
import com.ruoyi.reward.facade.api.UserDetailFacade;
import com.ruoyi.reward.facade.dto.TWechatAuthDTO;
import com.ruoyi.reward.facade.dto.UserDTO;
import com.ruoyi.reward.facade.enums.PrincipalType;
import com.ruoyi.reward.facade.request.UserWechatLoginRequest;
import com.ruoyi.reward.repository.UserDetailRepository;
import com.ruoyi.reward.repository.WechatAuthRepository;
import com.ruoyi.reward.service.TUserDetailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;


/**
 * @author Willard Hu on 2017/11/1.
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
@Slf4j
public class UserDetailFacadeImpl implements UserDetailFacade {
    @Autowired
    WechatAuthRepository wechatRepository;
    @Autowired
    UserDetailRepository userDetailRepository;
    @Autowired
    TUserDetailService userDetailService;
    @Autowired
    ConcurrentSequence concurrentSequence;

    @Override
    public UserDTO wechatLogin(UserWechatLoginRequest request) {
        PrincipalType principalType = PrincipalType.USER;
        TWechatAuthDTO wechat = wechatRepository.queryByOpenId(request.getOpenId(), principalType);
        UserDTO res;
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

    @Override
    public UserDTO queryByUserName(String userName) {
        UserDTO userDTO = userDetailRepository.queryByUserName(userName);
        log.info("userName:{},userDTO:{}", userName, userDTO);

        return userDTO;

    }


    private UserDTO take(UserWechatLoginRequest request, PrincipalType principalType) {
        UserDTO res;
        String userId = concurrentSequence.nextId().toString();
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
    public UserDTO queryByUserId(String userId) {
        return userDetailRepository.queryByPK(userId);
    }

    @Override
    public TWechatAuthDTO queryByOpenId(String openId) {
        PrincipalType principalType = PrincipalType.USER;
        return wechatRepository.queryByOpenId(openId, principalType);
    }

    @Override
    public int insertTUserDetail(UserDTO userDTO) {
        TUserDetail tUserDetail = new TUserDetail();
        BeanUtils.copyProperties(userDTO, tUserDetail);
        String userId = concurrentSequence.nextId().toString();
        tUserDetail.setUserId(userId);
        tUserDetail.setCreateTime(new Date());
        tUserDetail.setGmtModified(new Date());
        return userDetailService.insertTUserDetail(tUserDetail);
    }

    @Override
    public TWechatAuthDTO queryWechatByUserId(String userId) {
        PrincipalType principalType = PrincipalType.USER;
        return wechatRepository.queryByPrincipalId(userId, principalType);
    }
}
