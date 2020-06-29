package com.ruoyi.mp.controller;

import com.github.binarywang.wxpay.service.WxPayService;
import com.ruoyi.mp.client.*;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.mp.factory.ConfigFactory;
import com.ruoyi.mp.feign.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author sunflower
 */
public abstract class BaseController {

    @Autowired
    WxPayService wxPayService;
    @Autowired
    MpAuthConfig mpAuthConfig;


    @Autowired
    ConfigFactory configFactory;


    @Autowired
    AccountFacadeFeign accountFacadeFeign;

    @Autowired
    protected SysWebMainFacadeFeign sysWebMainFacadeFeign;

    @Autowired
    SysConfigFacadeFeign sysConfigFacadeFeign;

    @Autowired
    SysOrderFacadeFeign sysOrderFacadeFeign;

    @Autowired
    UserDetailFeign userDetailFeign;


    @Autowired
    AccountFacadeClient accountFacadeClient;


    @Autowired
    SysConfigFacadeClient sysConfigFacadeClient;

    @Autowired
    SysOrderFacadeClient sysOrderFacadeClient;

    @Autowired
    SysWebMainFacadeClient sysWebMainFacadeClient;

    @Autowired
    SysWechatConfigClient sysWechatConfigClient;

    @Autowired
    UserDetailClient userDetailClient;


}
