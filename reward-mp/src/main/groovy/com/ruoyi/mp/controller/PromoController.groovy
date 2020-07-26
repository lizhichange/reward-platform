package com.ruoyi.mp.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping

@Controller
class PromoController {
    @GetMapping("/book")
    String render() {
        return "promo"
    }
}
