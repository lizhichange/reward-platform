/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.web.feign;


import com.ruoyi.reward.facade.dto.UserDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * @author sunflower
 */
@FeignClient(value = "reward-service", path = "/rest/user")
public interface UserDetailFacadeFeign {

    @PostMapping("/queryByUserName")
    UserDTO queryByUserName(@RequestParam("userName") String userName);


}
