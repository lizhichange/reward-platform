package com.ruoyi.web.controller;

import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.web.client.SysCategoryFacadeClient;
import com.ruoyi.web.client.TsFacadeClient;
import com.ruoyi.web.client.UserDetailFacadeClient;
import com.ruoyi.web.feign.UserDetailFacadeFeign;
 

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        sysCategory.setStatus("0");
        List<SysCategoryDTO> categoryList = sysCategoryFacadeClient.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
    }
}
