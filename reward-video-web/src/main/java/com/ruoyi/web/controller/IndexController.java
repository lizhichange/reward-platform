package com.ruoyi.web.controller;

import com.ruoyi.web.client.SysConfigFacadeClient;
import com.ruoyi.web.client.VideoFacadeClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    RedisTemplate<String, Object> redisTemplate;

    @GetMapping
    public String index(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        getCategory(modelmap);
        modelmap.addAttribute("wxPayUrl", "http://www.1xii1.cn/video/qrcode");
        return "index";
    }

    @GetMapping("/index")
    public String render(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        return "index";
    }
}
