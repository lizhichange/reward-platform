/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.web.feign;


import com.ruoyi.reward.facade.dto.TWechatAuthDTO;
import com.ruoyi.reward.facade.dto.UserDto;
import com.ruoyi.reward.facade.request.UserWechatLoginRequest;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * @author sunflower
 */
@FeignClient(value = "reward-service", path = "/rest/user")
public interface UserDetailFacadeFeign {

    @PostMapping("/queryByUserName")
    UserDto queryByUserName(@RequestParam("userName") String userName);


}
