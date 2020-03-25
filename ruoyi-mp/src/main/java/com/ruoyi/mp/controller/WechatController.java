package com.ruoyi.mp.controller;


import com.alibaba.fastjson.JSON;

import com.ruoyi.mp.config.MpAuthConfig;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.near.toolkit.common.DoMainUtil;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.security.codec.AESCoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.PostConstruct;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * @author sunflower
 */
@Controller
@RequestMapping("/wechat")
public class WechatController {

    private static final Logger LOGGER = LoggerFactory.getLogger(WechatController.class);
    @Autowired
    WxMpService wxMpService;


    @GetMapping("/auth")
    public String auth(HttpServletRequest request, HttpServletResponse response) throws WxErrorException {

        String callback = request.getParameter("callback");
        //预授权回调地址
        String url = MpAuthConfig.getWxPnCallbackUrl();
        //执行预授权
        String authorizationUrl = wxMpService.oauth2buildAuthorizationUrl(url, WxConsts.OAuth2Scope.SNSAPI_BASE, callback);


        //重定向跳转
        return "redirect:" + authorizationUrl;
    }

    @GetMapping("/callback")
    public String callback(@RequestParam("code") String code, @RequestParam("state") String state) throws WxErrorException {
        LOGGER.info("code:{},state:{}", code, state);
        WxMpOAuth2AccessToken accessToken = wxMpService.oauth2getAccessToken(code);
        if (accessToken != null) {
            //用户信息
            WxMpUser wxMpUser = wxMpService.oauth2getUserInfo(accessToken, null);
        }

        return "redirect:";
    }
}