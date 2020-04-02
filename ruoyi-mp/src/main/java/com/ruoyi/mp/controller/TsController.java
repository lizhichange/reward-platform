package com.ruoyi.mp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author sunflower
 */
@Controller
public class TsController {
    private final static Logger LOGGER = LoggerFactory.getLogger(TsController.class);

    @GetMapping("/ts")
    public String ts(ModelMap modelmap) {
        return "ts";
    }

    @GetMapping("/tswq")
    public String tswq(ModelMap modelmap) {
        return "tswq";
    }

}
