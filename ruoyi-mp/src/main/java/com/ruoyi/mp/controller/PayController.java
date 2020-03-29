package com.ruoyi.mp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.sms.facade.ISysWebMainFacade;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/pay")
public class PayController {
    private final static Logger LOGGER = LoggerFactory.getLogger(PayController.class);
    @Reference(version = "1.0.0", check = false)
    ISysWebMainFacade sysWebMainFacade;

    @GetMapping
    public String pay(ModelMap modelmap) {
        return "pay";
    }
}
