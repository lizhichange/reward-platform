package com.ruoyi.mp.controller;

import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import lombok.Getter;
import lombok.Setter;
import org.near.toolkit.common.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author sunflower
 */
@Controller

public class IndexController extends BaseController {
    private final static Logger LOGGER = LoggerFactory.getLogger(IndexController.class);
    @Value("${share.time:0}")
    @Getter
    @Setter
    private Integer shareTime;


    @GetMapping("/")
    public String index(@RequestParam(value = "userId", required = false) String userId,
                        HttpServletRequest request, ModelMap modelMap) {
        String url = request.getScheme() + "://" + request.getServerName() + request.getRequestURI();
        modelMap.put("url", url);
        modelMap.put("userId", userId);
        String desc = sysConfigFacadeClient.selectConfigByKey("share.desc");
        if (StringUtil.isBlank(desc)) {
            desc = "今日更新，拉無人免提";
        }
        String title = sysConfigFacadeClient.selectConfigByKey("share.title");
        if (StringUtil.isBlank(title)) {
            title = "點擊觀看,完整影視";
        }
        modelMap.put("title", title);
        modelMap.put("desc", desc);
        modelMap.put("shareTime", shareTime);
        return "index";
    }

    @GetMapping("/index")
    public String render(@RequestParam(value = "userId", required = false) String userId) {
        String user = StringUtil.isBlank(userId) ? "" : userId;
        SysWebMainDTO webMain = new SysWebMainDTO();
        webMain.setMainStatus(WebMainStatus.OK.getCode());
        List<SysWebMainDTO> list = sysWebMainFacadeClient.selectSysWebMainList(webMain);
        if (!CollectionUtils.isEmpty(list)) {
            SysWebMainDTO item = list.get(0);
            String url = item.getMainUrl() + "/redirect?userId=" + user;
            LOGGER.info("redirect.url:{}", url);
            return "redirect:" + url;
        }
        return "404";
    }

    @GetMapping("/404")

    public String noFound() {
        return "404";
    }

}