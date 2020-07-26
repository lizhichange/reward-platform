package com.ruoyi.mp.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping

@Controller
class PromoController {
    @RequestMapping("promo")
    String render() {
        return "promo"
    }
}
