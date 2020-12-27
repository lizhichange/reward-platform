package com.ruoyi.shortchain.web;

import cn.hutool.core.util.RandomUtil;
import com.ruoyi.reward.facade.dto.SysShortDTO;
import com.ruoyi.shortchain.client.SysShortFacadeClient;
import org.near.toolkit.model.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author wahaha
 */
@RestController
public class ShortController {

    private final static String SHORT_URL = "http://";
    @Autowired
    SysShortFacadeClient sysShortFacadeClient;

    @RequestMapping("/short")
    public Object shortLink(Long id) {
        return sysShortFacadeClient.selectSysShortById(id);
    }

    @PostMapping("/generate")
    public AjaxResult generate(String url) {
        SysShortDTO dto = new SysShortDTO();
        dto.setLongUrl(url);
        int shortKey = RandomUtil.randomNumber();
        dto.setShortKey(String.valueOf(shortKey));
        dto.setShortUrl(SHORT_URL + shortKey);
        sysShortFacadeClient.insertSysShort(dto);
        return AjaxResult.success();
    }


}
