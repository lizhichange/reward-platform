package com.ruoyi.shortchain.web;

import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSON;
import com.ruoyi.reward.facade.dto.SysShortDTO;
import com.ruoyi.shortchain.client.SysShortFacadeClient;
import com.ruoyi.shortchain.param.GenerateShortParam;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.model.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


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

        int shortKey = RandomUtil.randomNumber();
        dto.setShortKey(String.valueOf(shortKey));
        String shortUrl = SHORT_URL + shortKey;

        dto.setShortUrl(shortUrl);
        dto.setLongUrl(param.getUrl());
        dto.setShortStatus("0");

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
