package com.ruoyi.mp.controller

import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.GetMapping

import org.springframework.stereotype.Controller


@Controller
class PromoController {
    @GetMapping("/book")
    String render(ModelMap modelMap) {
        "promo"
    }
}
