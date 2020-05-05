package com.ruoyi.web.service;

import com.ruoyi.reward.facade.dto.UserDto;

import com.ruoyi.web.feign.UserDetailFacadeFeign;
import com.ruoyi.web.model.CustomUserDetails;
import com.ruoyi.web.model.Users;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * @author sunflower
 */
@Service
public class CustomUserDetailsService implements UserDetailsService {

    final
    UserDetailFacadeFeign userDetailFacadeFeign;

    public CustomUserDetailsService(UserDetailFacadeFeign userDetailFacadeFeign) {
        this.userDetailFacadeFeign = userDetailFacadeFeign;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDto userDto = userDetailFacadeFeign.queryByUserName(username);
        if (userDto == null) {
            throw new UsernameNotFoundException("Username not found");
        }
        Users users = new Users();
        BeanUtils.copyProperties(userDto, users);
        Optional<Users> optionalUsers = Optional.of(users);
        return optionalUsers.map(CustomUserDetails::new).get();
    }
}
