/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.mp.client;


import com.ruoyi.reward.facade.dto.TWechatAuthDTO;
import com.ruoyi.reward.facade.dto.UserDTO;
import com.ruoyi.reward.facade.request.UserWechatLoginRequest;


/**
 *
 * @author sunflower
 */
public interface UserDetailClient {

    /**
     * 微信登录，已存在信息则直接返回用户信息，否则执行注册后返回用户信息
     *
     * @param request {@link UserWechatLoginRequest}
     * @return {@link UserDTO}
     */
    UserDTO wechatLogin(UserWechatLoginRequest request);

    /**
     * 用户唯一标识查询用户
     *
     * @param userId 用户唯一标识
     * @return {@link UserDTO}
     */
    UserDTO queryByUserId(String userId);

    /**
     * 用户唯一标识查询用户
     *
     * @param openId 用户openId
     * @return {@link UserDTO}
     */
    TWechatAuthDTO queryByOpenId(String openId);


    /**
     * 用户唯一标识查询用户
     *
     * @param userId 用户openId
     * @return {@link UserDTO}
     */
    TWechatAuthDTO queryWechatByUserId(String userId);
}
