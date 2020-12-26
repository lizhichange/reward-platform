package com.ruoyi.shortchain.web;

import com.ruoyi.shortchain.client.SysShortFacadeClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ShortController {

    @Autowired
    SysShortFacadeClient sysShortFacadeClient;
    @RequestMapping("/short")
    public Object shortLink(Long id) {
        return sysShortFacadeClient.selectSysShortById(id);
    }

}
