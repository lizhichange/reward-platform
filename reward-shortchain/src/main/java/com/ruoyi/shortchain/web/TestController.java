package com.ruoyi.shortchain.web;

import com.ruoyi.shortchain.service.CheckUrlService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <b>TODO . </b>
 *
 * @author yangyl8 / 2020-04-02
 * @version 1.0.0
 * @since JDK 1.8
 */
@RestController
@Slf4j
public class TestController {

    @Resource
    CheckUrlService checkUrlService;

    @RequestMapping("/check")
    public Object userList(String url) {
        return checkUrlService.check(url);
    }

}
