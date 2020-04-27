package com.ruoyi.mp.controller;

import com.github.binarywang.wxpay.service.WxPayService;
import com.ruoyi.mp.client.IAccountFacadeClient;
import com.ruoyi.mp.client.ISysConfigFacadeClient;
import com.ruoyi.mp.client.ISysOrderFacadeClient;
import com.ruoyi.mp.client.UserDetailClient;
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
    ISysOrderFacadeClient sysOrderClient;
    @Autowired
    IAccountFacadeClient accountFacadeClient;
    @Autowired

    ISysWebMainFacadeFeign sysWebMainFacadeFeign;
    @Autowired
    ISysConfigFacadeClient sysConfigClient;

    @Autowired
    ConfigFactory configFactory;
    @Autowired

    IAccountFacadeFeign accountFacadeFeign;
    @Autowired

    ISysConfigFacadeFeign sysConfigFacadeFeign;
    @Autowired
    ISysOrderFacadeFeign sysOrderFacadeFeign;

    @Autowired
    UserDetailClient userDetailClient;
    @Autowired
    UserDetailFeign userDetailFeign;


}
