package com.ruoyi.web.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.google.common.collect.Maps;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.web.client.SysCategoryFacadeClient;
import com.ruoyi.web.client.TsFacadeClient;
import com.ruoyi.web.client.UserDetailFacadeClient;
import com.ruoyi.web.feign.UserDetailFacadeFeign;
import com.ruoyi.web.model.Users;
import com.ruoyi.web.security.SecurityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;


/**
 * @author sunflower
 */
public class BaseController {

    public static final Logger LOGGER = LoggerFactory.getLogger(BaseController.class);
    @Autowired
    SysCategoryFacadeClient sysCategoryFacadeClient;
    @Autowired
    TsFacadeClient tsFacadeClient;
    @Autowired
    UserDetailFacadeFeign userDetailFacadeFeign;
    @Autowired
    UserDetailFacadeClient userDetailFacadeClient;

    public static Users getCurrentUser() {
        return SecurityUtil.getCurrentUser();
    }


    public static String renderString(HttpServletResponse response, String string) {
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(string);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean isAjaxRequest(HttpServletRequest request) {
        String ajaxFlag = request.getHeader("X-Requested-With");
        return "XMLHttpRequest".equals(ajaxFlag);
    }


    protected void getCategory(ModelMap modelmap) {
        SysCategoryDTO sysCategory = new SysCategoryDTO();
        sysCategory.setParentId(100L);
        List<SysCategoryDTO> categoryList = sysCategoryFacadeClient.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
    }

    public static void main(String[] args) {
        HashMap<Integer, Integer> objectObjectHashMap = Maps.newHashMap();
        for (int i = 0; i < 100; ++i) {
            objectObjectHashMap.put(i, Integer.valueOf(i + ""));
            objectObjectHashMap.remove(i - 1);
        }
        System.out.println(objectObjectHashMap.size());
    }

    @Reference(version = "1.0.0", check = false)
    com.ruoyi.reward.facade.api.DemoFacade demoFacade;

    @PostConstruct
    void init() {
        new Thread(() -> demoFacade.testOne()).start();
    }
}
