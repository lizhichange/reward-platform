package com.ruoyi.web.controller;

import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.web.feign.SysCategoryFacadeFeign;
import com.ruoyi.web.feign.TsFeign;
import com.ruoyi.web.feign.UserDetailFacadeFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author sunflower
 */
public class BaseController {
    @Autowired
    SysCategoryFacadeFeign sysCategoryFacadeFeign;
    @Autowired
    TsFeign tsFeign;
    @Autowired
    UserDetailFacadeFeign userDetailFacadeFeign;

    public static Object getCurrentUser() {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();
        return authentication.getPrincipal();
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
        List<SysCategoryDTO> categoryList = sysCategoryFacadeFeign.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
    }
}
