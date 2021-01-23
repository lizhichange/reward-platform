package com.ruoyi.web.controller;

import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import com.ruoyi.web.client.SysConfigFacadeClient;
import com.ruoyi.web.client.SysWebMainFacadeClient;
import com.ruoyi.web.client.VideoFacadeClient;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author sunflower
 */
@Controller
@RequestMapping
@Slf4j
public class IndexController extends BaseController {
    @Autowired
    VideoFacadeClient videoFacadeClient;
    @Autowired
    SysConfigFacadeClient sysConfigFacadeClient;
    @Autowired
    SysWebMainFacadeClient sysWebMainFacadeClient;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;

    @GetMapping
    public String index(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        getCategory(modelmap);
        return "index";
    }

    @GetMapping("/index")
    public String render(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        String user = StringUtil.isBlank(userId) ? "" : userId;
        SysWebMainDTO webMain = new SysWebMainDTO();
        webMain.setMainStatus(WebMainStatus.OK.getCode());
        List<SysWebMainDTO> list = sysWebMainFacadeClient.selectSysWebMainList(webMain);
        if (!CollectionUtils.isEmpty(list)) {
            SysWebMainDTO item = list.get(0);
            String url = item.getMainUrl() + "/redirect?userId=" + user;
            log.info("redirect.url:{}", url);
            return "redirect:" + url;
        }
        return "index";
    }

    @GetMapping("/redirect")
    public String redirect(@RequestParam(value = "userId", required = false) String userId,
                           @RequestParam(value = "categoryId", required = false) String categoryId,
                           @RequestParam(value = "videoId", required = false) String videoId,
                           ModelMap modelmap) {
        xxx(userId, categoryId, videoId, modelmap);
        String tradeType = sysConfigFacadeClient.selectConfigByKey("sys.tradeType");
        String wxPayUrl = sysConfigFacadeClient.selectConfigByKey("wxPayUrl");
        wxPayUrl = wxPayUrl + "/qrCode/qrcode";
        log.info("wxPayUrl:{}", wxPayUrl);
        modelmap.addAttribute("wxPayUrl", wxPayUrl + "?tradeType=" + tradeType);
        return "index";
    }

}
