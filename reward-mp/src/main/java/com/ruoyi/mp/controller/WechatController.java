package com.ruoyi.mp.controller;


import com.ruoyi.mp.client.UserDetailClient;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.reward.facade.request.UserWechatLoginRequest;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import me.chanjar.weixin.mp.config.WxMpConfigStorage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


/**
 * @author sunflower
 */
@Controller
@RequestMapping("/wechat")
public class WechatController {

    private static final Logger LOGGER = LoggerFactory.getLogger(WechatController.class);
    @Autowired
    WxMpService wxMpService;
    @Autowired

    UserDetailClient userDetailClient;

    @Autowired
    MpAuthConfig mpAuthConfig;


    @GetMapping("/auth")
    public String auth(HttpServletRequest request) {
        String callback = request.getParameter("callback");
        //预授权回调地址
        String url = mpAuthConfig.getWxPnCallbackUrl();
        LOGGER.info("auth.callback:{}", callback);
        if (url.contains("?")) {
            url += "&callback=" + callback;
        } else {
            url += "?callback=" + callback;
        }
        //执行预授权
        String authorizationUrl = wxMpService.oauth2buildAuthorizationUrl(url, WxConsts.OAuth2Scope.SNSAPI_USERINFO, callback);
        //重定向跳转
        return "redirect:" + authorizationUrl;
    }

    @GetMapping("/callback")
    public String callback(@RequestParam("code") String code, @RequestParam("callback") String callback, @RequestParam("state") String state) throws WxErrorException {
        LOGGER.info("callback.code:{},state:{},callback:{}", code, state, callback);
        WxMpOAuth2AccessToken accessToken = wxMpService.oauth2getAccessToken(code);
        if (accessToken != null) {
            //用户信息
            WxMpUser wxMpUser = wxMpService.oauth2getUserInfo(accessToken, null);
            WxMpConfigStorage wxMpConfigStorage = wxMpService.getWxMpConfigStorage();
            String appId = wxMpConfigStorage.getAppId();
            UserWechatLoginRequest userWechatLoginRequest = new UserWechatLoginRequest();
            userWechatLoginRequest.setOpenId(wxMpUser.getOpenId());
            userWechatLoginRequest.setAppid(appId);
            userWechatLoginRequest.setNickName(wxMpUser.getNickname());
            userWechatLoginRequest.setGender(wxMpUser.getSexDesc());
            userWechatLoginRequest.setUnionid(wxMpUser.getUnionId());
            userWechatLoginRequest.setHeadImg(wxMpUser.getHeadImgUrl());
            userDetailClient.wechatLogin(userWechatLoginRequest);
            if (callback.contains("?")) {
                callback += "&op=" + wxMpUser.getOpenId();
            } else {
                callback += "?op=" + wxMpUser.getOpenId();
            }
            LOGGER.info("callback.redirect:{}", callback);
            return "redirect:" + callback;
        }
        return "redirect:";
    }


}