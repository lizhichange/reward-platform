package com.ruoyi.mp.controller;

import com.github.binarywang.wxpay.service.WxPayService;
import com.ruoyi.mp.client.IAccountFacadeClient;
import com.ruoyi.mp.client.ISysConfigClient;
import com.ruoyi.mp.client.ISysOrderClient;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.mp.factory.ConfigFactory;
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
    ISysOrderClient sysOrderClient;
    @Autowired
    IAccountFacadeClient accountFacadeClient;

    @Autowired
    ISysConfigClient sysConfigClient;

    @Autowired
    ConfigFactory configFactory;

}
