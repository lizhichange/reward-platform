package com.ruoyi.reward.rest;

import com.ruoyi.reward.facade.api.UserDetailFacade;
import com.ruoyi.reward.facade.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

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
    public UserDTO queryByUserName(@RequestParam("userName") String userName) {
        return userDetailFacade.queryByUserName(userName);
    }

    @PostMapping("/register")
    @ResponseBody
    public int register(@RequestBody UserDTO userDTO) {
        return userDetailFacade.insertTUserDetail(userDTO);
    }

}
