package com.ruoyi.web.controller;

import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.web.feign.SysCategoryFacadeFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

import java.util.List;

/**
 * @author sunflower
 */
public class BaseController {
    @Autowired
    SysCategoryFacadeFeign sysCategoryFacadeFeign;

    protected void getCategory(ModelMap modelmap) {
        SysCategoryDTO sysCategory = new SysCategoryDTO();
        sysCategory.setParentId(100L);
        List<SysCategoryDTO> categoryList = sysCategoryFacadeFeign.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
    }
}
