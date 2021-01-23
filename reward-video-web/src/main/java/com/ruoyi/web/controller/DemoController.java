package com.ruoyi.web.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/demo")
@Slf4j
public class DemoController extends BaseController {
    private static final String prefix = "demo";

    @GetMapping("/demo")
    public String demo(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        return prefix + "/demo";
    }

    @GetMapping("/mescroll-search")
    public String search(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        return prefix + "/mescroll-search";
    }

    @GetMapping("/zhihu")
    public String zhihu(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        return prefix + "/zhihu";
    }
}
