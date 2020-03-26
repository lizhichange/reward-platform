package com.ruoyi.web.controller.wechat;


import com.alibaba.fastjson.JSON;
import com.ruoyi.framework.interceptor.WechatAuthInterceptor;
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

import static com.ruoyi.framework.interceptor.WechatAuthInterceptor.COOKIE_KEY;

/**
 * @author sunflower
 */


public class WechatController {

    private static final Logger LOGGER = LoggerFactory.getLogger(WechatController.class);





    public static void main(String[] args) {
        WxMpUser wxMpUser = new WxMpUser();
        String str1 = AESCoder.encrypt(JSON.toJSONString(wxMpUser), WechatAuthInterceptor.AES_KET, "utf-8");
        System.out.println(str1);
        String str2 = AESCoder.decrypt(str1, WechatAuthInterceptor.AES_KET, "utf-8");
        System.out.println(str2);
    }
}