package com.ruoyi.shortchain.web;

import com.ruoyi.reward.facade.dto.SysShortDTO;
import com.ruoyi.shortchain.client.SysShortFacadeClient;
import com.ruoyi.shortchain.param.GenerateShortParam;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.model.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;


/**
 * @author wahaha
 */
@RestController
@RequestMapping(value = "/short")
@Slf4j
public class ShortController {

    private final static String SHORT_URL = "http://hailunjianzhi.cn/";
    @Autowired
    SysShortFacadeClient sysShortFacadeClient;

    @PostMapping("/generate")
    public AjaxResult generate(@RequestBody GenerateShortParam param) {
        log.info("param:{}", param);
        SysShortDTO dto = new SysShortDTO();
        String randomString = getRandomString(10);
        dto.setShortKey(randomString);
        String shortUrl = SHORT_URL + randomString;
        dto.setShortUrl(shortUrl);
        dto.setLongUrl(param.getUrl());
        dto.setShortStatus("0");
        int i = sysShortFacadeClient.insertSysShort(dto);
        if (i > 0) {
            return AjaxResult.success(shortUrl);
        }
        return AjaxResult.error();
    }

    public static String getRandomString(int length) {
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }
}
