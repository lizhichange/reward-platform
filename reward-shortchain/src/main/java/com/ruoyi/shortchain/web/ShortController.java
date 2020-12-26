package com.ruoyi.shortchain.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ShortController {

    @RequestMapping("/check")
    public Object userList(String url) {
        return checkUrlService.check(url);
    }

}
