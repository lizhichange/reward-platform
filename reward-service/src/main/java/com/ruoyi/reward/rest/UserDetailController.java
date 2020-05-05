package com.ruoyi.reward.rest;

import com.ruoyi.reward.facade.api.UserDetailFacade;
import com.ruoyi.reward.facade.dto.TsDTO;
import com.ruoyi.reward.facade.dto.UserDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author sunflower
 */
@RequestMapping("/rest/user")
@RestController
@Slf4j
public class UserDetailController {

    final
    UserDetailFacade userDetailFacade;

    public UserDetailController(UserDetailFacade userDetailFacade) {
        this.userDetailFacade = userDetailFacade;
    }

    @PostMapping("/queryByUserName")
    public UserDto queryByUserName(@RequestParam("userName") String userName) {
        return userDetailFacade.queryByUserName(userName);
    }

}
