package com.ruoyi.mp.controller;

import cn.hutool.core.util.RandomUtil;
import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.ISysWebMainFacade;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import org.near.toolkit.common.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author sunflower
 */
@Controller
public class IndexController {
    private final static Logger LOGGER = LoggerFactory.getLogger(IndexController.class);
    @Reference(version = "1.0.0", check = false)
    ISysWebMainFacade sysWebMainFacade;

    @GetMapping("/")
    public String index(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        String user = StringUtil.isBlank(userid) ? "" : userid;
        SysWebMainDTO webMain = new SysWebMainDTO();
        webMain.setMainStatus(WebMainStatus.OK.getCode());
        List<SysWebMainDTO> list = sysWebMainFacade.selectSysWebMainList(webMain);
        if (!CollectionUtils.isEmpty(list)) {
            SysWebMainDTO item;
            int size = list.size();
            if (size == 1) {
                item = list.get(0);
            } else {
                int i = RandomUtil.randomInt(0, size - 1);
                item = list.get(i);
            }
            String url = item.getMainUrl() + "/pron/redirect?userid=" + user;
            LOGGER.info("redirect.url:{}", url);
            return "redirect:" + url;
        }
        return "404";
    }
}
