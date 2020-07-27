package com.ruoyi.mp.controller

import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.GetMapping

@Controller
class PoController {
    @GetMapping("/po")
    String render(ModelMap modelMap) {
        "promo"
    }
}
