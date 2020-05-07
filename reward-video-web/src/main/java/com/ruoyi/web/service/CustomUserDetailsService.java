package com.ruoyi.web.service;

import com.ruoyi.reward.facade.dto.UserDTO;
import com.ruoyi.web.feign.UserDetailFacadeFeign;
import com.ruoyi.web.model.CustomUserDetails;
import com.ruoyi.web.model.Users;
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
        UserDTO src = userDetailFacadeFeign.queryByUserName(username);
        if (src == null) {
            throw new UsernameNotFoundException("Username not found");
        }
        Users target = new Users();
        target.setUserId(src.getUserId());
        target.setId(src.getId());
        target.setUsername(src.getUserName());
        target.setPassword(src.getPassword());
        Optional<Users> optionalUsers = Optional.of(target);
        UserDetails item = optionalUsers.map(CustomUserDetails::new).get();
        return item;

    }
}
