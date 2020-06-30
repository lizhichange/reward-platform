package com.ruoyi.system.rest;

import com.ruoyi.reward.facade.api.SysCategoryFacade;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 部门管理 服务实现
 *
 * @author ruoyi
 */
@RequestMapping("/rest/category")
@RestController
@Slf4j
public class SysCategoryFacadeController {


    @Autowired
    SysCategoryFacade sysCategoryFacade;

    @PostMapping("/selectDeptList")
    public List<SysCategoryDTO> selectDeptList(@RequestBody SysCategoryDTO dept) {
        return sysCategoryFacade.selectDeptList(dept);
    }

    @PostMapping("/selectDeptCount")
    public int selectDeptCount(Long parentId) {
        return sysCategoryFacade.selectDeptCount(parentId);
    }

    @PostMapping("/deleteDeptById")
    public int deleteDeptById(Long deptId) {
        return sysCategoryFacade.deleteDeptById(deptId);
    }


    @PostMapping("/selectDeptById")
    public SysCategoryDTO selectDeptById(Long deptId) {
        return sysCategoryFacade.selectDeptById(deptId);
    }
}
