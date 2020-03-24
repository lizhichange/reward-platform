package com.ruoyi.web.controller.wechat;


import com.alibaba.fastjson.JSON;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.near.toolkit.common.DoMainUtil;
import org.near.toolkit.security.codec.AESCoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/wechat")

public class WechatController {

    private static final Logger LOGGER = LoggerFactory.getLogger(WechatController.class);
    @Autowired
    WxMpService wxMpService;

    private final String key = "U2FsdGVkX1/TjFjEE/3lTCOvPLdrPUkMqYYHWZmteHw=";

    public static void write(WxMpUser wxMpUser, String cookieName, String key, String domain,
                             HttpServletResponse response) {
        String encryptJson = AESCoder.encrypt(JSON.toJSONString(wxMpUser), key, null);
        Cookie cookie = new Cookie(cookieName, encryptJson);
        cookie.setMaxAge(-1);
        cookie.setDomain(domain);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
    }


    @GetMapping("/callback")
    public String callback(@RequestParam("code") String code, HttpServletRequest request,
                           HttpServletResponse response) throws WxErrorException {


        HttpSession session = request.getSession();
        Object referer = session.getAttribute("referer");
        LOGGER.info("code:{}", code);
        WxMpOAuth2AccessToken accessToken = wxMpService.oauth2getAccessToken(code);
        if (accessToken != null) {
            //用户信息
            WxMpUser wxMpUser = wxMpService.oauth2getUserInfo(accessToken, null);
            if (referer != null) {
                String doMain = DoMainUtil.getDoMain(referer.toString());
                String userInfoKey = "USER_INFO_KEY";
                write(wxMpUser, userInfoKey, key, doMain, response);
            }
        }
        assert referer != null;
        return "redirect:" + referer.toString();
    }

    public static void main(String[] args) {
        WxMpUser wxMpUser = new WxMpUser();
        String str = AESCoder.encrypt(JSON.toJSONString(wxMpUser), "U2FsdGVkX1/TjFjEE/3lTCOvPLdrPUkMqYYHWZmteHw=", "utf-8");
        System.out.println(str);
    }
}