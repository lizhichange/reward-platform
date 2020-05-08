package com.ruoyi.web.controller;

import com.ruoyi.reward.facade.dto.UserDTO;
import com.ruoyi.web.model.AjaxResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author sunflower
 */
@Controller
@Slf4j
public class LoginController extends BaseController {
    @Autowired
    PasswordEncoder passwordEncoder;

    @GetMapping("/register")
    public String register(HttpServletRequest request, ModelMap modelMap, HttpServletResponse response) {
        // 如果是Ajax请求，返回Json字符串。
        getCategory(modelMap);
        return "register";
    }

    @PostMapping("/register")
    @ResponseBody
    public AjaxResult ajaxReg(UserDTO userDTO) {
        String password = userDTO.getPassword();
        String encode = passwordEncoder.encode(password);
        userDTO.setPassword(encode);

        UserDTO item = userDetailFacadeFeign.queryByUserName(userDTO.getUserName());
        if (item != null) {
            return AjaxResult.error("用户账户已经存在");
        }
        int register = userDetailFacadeFeign.register(userDTO);
        return register > 0 ? AjaxResult.success() : AjaxResult.error("注册失败");
    }


    @GetMapping("/login")
    public String login(HttpServletRequest request, ModelMap modelMap, HttpServletResponse response) {
        // 如果是Ajax请求，返回Json字符串。
        getCategory(modelMap);
        if (isAjaxRequest(request)) {
            return renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }
        return "login";
    }

    @GetMapping("/login.html")
    public String loginPage(HttpServletRequest request, ModelMap modelMap, HttpServletResponse response) {
        // 如果是Ajax请求，返回Json字符串。
        getCategory(modelMap);
        if (isAjaxRequest(request)) {
            return renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }
        return "login";
    }

}