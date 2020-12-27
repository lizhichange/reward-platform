package com.ruoyi.shortchain.web;

import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSON;
import com.ruoyi.reward.facade.dto.SysShortDTO;
import com.ruoyi.shortchain.client.SysShortFacadeClient;
import com.ruoyi.shortchain.param.GenerateShortParam;
import org.near.toolkit.model.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author wahaha
 */
@RestController
@RequestMapping(value = "/short")
public class ShortController {

    private final static String SHORT_URL = "http://hailunjianzhi.cn/";
    @Autowired
    SysShortFacadeClient sysShortFacadeClient;

    @PostMapping("/generate")
    public AjaxResult generate(@RequestParam GenerateShortParam param) {
        SysShortDTO dto = new SysShortDTO();
        dto.setLongUrl(param.getUrl());
        int shortKey = RandomUtil.randomNumber();
        dto.setShortKey(String.valueOf(shortKey));
        String shortUrl = SHORT_URL + shortKey;
        dto.setShortUrl(shortUrl);
        int i = sysShortFacadeClient.insertSysShort(dto);
        if (i > 0) {
            return AjaxResult.success(shortUrl);
        }
        return AjaxResult.error();
    }

    public static void main(String[] args) {
        AjaxResult success = AjaxResult.success("shortUrl");
        System.out.println(JSON.toJSON(success));
    }

}
