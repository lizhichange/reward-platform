/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.mp.feign;


import com.ruoyi.reward.facade.dto.TWechatAuthDTO;
import com.ruoyi.reward.facade.dto.UserDTO;
import com.ruoyi.reward.facade.request.UserWechatLoginRequest;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;


/**
 *
 */
@FeignClient(value = "reward-service", path = "/rest/userDetail")
public interface UserDetailFeign {

    /**
     * 微信登录，已存在信息则直接返回用户信息，否则执行注册后返回用户信息
     *
     * @param request {@link UserWechatLoginRequest}
     * @return {@link UserDTO}
     */
    @PostMapping("/wechatLogin")
    UserDTO wechatLogin(@RequestBody UserWechatLoginRequest request);

    /**
     * 用户唯一标识查询用户
     *
     * @param userId 用户唯一标识
     * @return {@link UserDTO}
     */
    @PostMapping("/queryByUserId")
    UserDTO queryByUserId(@RequestParam("userId") String userId);

    /**
     * 用户唯一标识查询用户
     *
     * @param openId 用户openId
     * @return {@link UserDTO}
     */
    @PostMapping("/queryByOpenId")
    TWechatAuthDTO queryByOpenId(@RequestParam("openId") String openId);


    /**
     * 用户唯一标识查询用户
     *
     * @param userId 用户openId
     * @return {@link UserDTO}
     */
    @PostMapping("/queryWechatByUserId")
    TWechatAuthDTO queryWechatByUserId(@RequestParam("userId") String userId);
}
