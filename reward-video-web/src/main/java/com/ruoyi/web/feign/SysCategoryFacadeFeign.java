package com.ruoyi.web.feign;

import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 部门管理 服务实现
 *
 * @author ruoyi
 */
@FeignClient(value = "reward-service", path = "/rest/category")
public interface SysCategoryFacadeFeign {


    @PostMapping("/selectDeptList")
    List<SysCategoryDTO> selectDeptList(@RequestBody SysCategoryDTO dept);

    @PostMapping("/selectDeptCount")
    int selectDeptCount(@RequestParam("parentId") Long parentId);

    @PostMapping("/deleteDeptById")
    int deleteDeptById(@RequestParam("parentId") Long deptId);

    @PostMapping("/selectDeptById")
    SysCategoryDTO selectDeptById(@RequestParam("parentId") Long deptId);
}
