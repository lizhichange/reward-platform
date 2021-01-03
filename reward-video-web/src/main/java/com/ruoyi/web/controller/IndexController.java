package com.ruoyi.web.controller;

import com.google.common.collect.Lists;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.web.client.SysConfigFacadeClient;
import com.ruoyi.web.client.VideoFacadeClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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

    @GetMapping("/")
    public String index(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        getCategory(modelmap);
        return "index";
    }

    protected void getCategory(ModelMap modelmap) {
        SysCategoryDTO sysCategory = new SysCategoryDTO();
        sysCategory.setParentId(100L);
        sysCategory.setStatus("0");
        List<SysCategoryDTO> categoryList = sysCategoryFacadeClient.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
    }

    @GetMapping("/index")
    public String render(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        return "redirect:/video";
    }


    @GetMapping("/add")
    @ResponseBody
    public ArrayList<String> add() {
        SetOperations<String, Object> open = redisTemplate.opsForSet();
        ArrayList<String> strings = Lists.newArrayList();
        strings.add("1");
        strings.add("2");
        open.add("strings", strings);

        ArrayList<String> arrayList = Lists.newArrayList();
        arrayList.add("1");
        arrayList.add("2");
        arrayList.add("3");
        open.add("arrayList", arrayList);
        return strings;
    }

    @GetMapping("/intersect")
    @ResponseBody
    public Set<Object> intersect() {
        SetOperations<String, Object> open = redisTemplate.opsForSet();
        return open.intersect("strings", "arrayList");
    }

    @GetMapping("/difference")
    @ResponseBody
    public Set<Object> difference() {
        SetOperations<String, Object> open = redisTemplate.opsForSet();
        return open.difference("strings", "arrayList");
    }
}
