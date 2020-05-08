package com.ruoyi.web.security;

import com.ruoyi.web.model.Users;
import org.springframework.beans.BeanUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author sunflower
 */
public class SecurityUtil {
    public static Users getCurrentUser() {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();
        Users users = null;
        if (authentication.getPrincipal() != null && authentication.getPrincipal() instanceof Users) {
            users = new Users();
            BeanUtils.copyProperties(authentication.getPrincipal(), users);
        }
        return users;
    }

}
