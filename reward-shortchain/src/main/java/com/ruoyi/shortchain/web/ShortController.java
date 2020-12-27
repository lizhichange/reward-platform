package com.ruoyi.shortchain.web;

import cn.hutool.core.util.RandomUtil;
import com.ruoyi.reward.facade.dto.SysShortDTO;
import com.ruoyi.shortchain.client.SysShortFacadeClient;
import org.near.toolkit.model.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

/**
 * @author wahaha
 */
@RestController

public class ShortController {

    @Autowired
    SysShortFacadeClient sysShortFacadeClient;

    @RequestMapping("/short")
    public Object shortLink(Long id) {
        return sysShortFacadeClient.selectSysShortById(id);
    }

    @PostMapping("/generate")
    public AjaxResult generate(String url) {
        SysShortDTO sysShortDTO = new SysShortDTO();
        sysShortDTO.setLongUrl(url);
        sysShortDTO.setShortKey(String.valueOf(RandomUtil.randomNumber()));

        sysShortFacadeClient.insertSysShort(sysShortDTO);
        return AjaxResult.success();
    }


}
