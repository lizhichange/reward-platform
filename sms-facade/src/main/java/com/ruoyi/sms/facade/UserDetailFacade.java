/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.sms.facade;


import com.ruoyi.sms.facade.dto.UserDto;
import com.ruoyi.sms.facade.dto.WechatAuthDto;
import com.ruoyi.sms.facade.request.UserWechatLoginRequest;


/**

 *
 */
public interface UserDetailFacade {

    /**
     * 微信登录，已存在信息则直接返回用户信息，否则执行注册后返回用户信息
     *
     * @param request {@link UserWechatLoginRequest}
     * @return {@link UserDto}
     */
    UserDto wechatLogin(UserWechatLoginRequest request);

    /**
     * 用户唯一标识查询用户
     *
     * @param userId 用户唯一标识
     * @return {@link UserDto}
     */
    UserDto queryByUserId(String userId);

    /**
     * 用户唯一标识查询用户
     *
     * @param openId 用户openId
     * @return {@link UserDto}
     */
    WechatAuthDto queryByOpenId(String openId);


    /**
     * 用户唯一标识查询用户
     *
     * @param userId 用户openId
     * @return {@link UserDto}
     */
    WechatAuthDto queryWechatByUserId(String userId);
}
