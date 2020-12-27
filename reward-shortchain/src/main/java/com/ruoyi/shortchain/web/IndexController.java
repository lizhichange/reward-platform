package com.ruoyi.shortchain.web;

/**
 * @author wahaha
 */

import com.ruoyi.reward.facade.dto.SysShortDTO;
import com.ruoyi.shortchain.client.SysShortFacadeClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    SysShortFacadeClient sysShortFacadeClient;


    @RequestMapping("/{key}")
    String render(@PathVariable(value = "key") String key) {
        SysShortDTO dto = new SysShortDTO();
        dto.setShortKey(key);
        List<SysShortDTO> shortList = sysShortFacadeClient.selectSysShortList(dto);
        if (CollectionUtils.isEmpty(shortList)) {
            return "redirect:/toList";
        }
        SysShortDTO sysShortDTO = shortList.get(0);
        return "redirect:" + sysShortDTO.getLongUrl();
    }
}
