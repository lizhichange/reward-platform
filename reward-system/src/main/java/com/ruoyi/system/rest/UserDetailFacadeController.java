package com.ruoyi.system.rest;

import com.ruoyi.reward.facade.api.UserDetailFacade;
import com.ruoyi.reward.facade.dto.UserDto;
import com.ruoyi.reward.facade.request.UserWechatLoginRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author sunflower
 */
@RequestMapping("/rest/userDetail")
@RestController
@Slf4j
public class UserDetailFacadeController {
    @Autowired
    UserDetailFacade userDetailFacade;

    @PostMapping("/wechatLogin")
    public UserDto wechatLogin(@RequestBody UserWechatLoginRequest request) {
        return userDetailFacade.wechatLogin(request);
    }
}
