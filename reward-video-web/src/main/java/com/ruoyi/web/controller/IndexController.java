package com.ruoyi.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author sunflower
 */
@Controller
public class IndexController extends BaseController {

    public String index(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        return "redirect:/video";
    }
}
