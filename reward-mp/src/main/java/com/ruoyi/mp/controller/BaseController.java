package com.ruoyi.mp.controller;

import com.github.binarywang.wxpay.service.WxPayService;
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
    ISysWebMainFacadeFeign sysWebMainFacadeFeign;


    @Autowired
    ConfigFactory configFactory;


    @Autowired
    IAccountFacadeFeign accountFacadeFeign;


    @Autowired
    ISysConfigFacadeFeign sysConfigFacadeFeign;


    @Autowired
    ISysOrderFacadeFeign sysOrderFacadeFeign;


    @Autowired
    UserDetailFeign userDetailFeign;


}
