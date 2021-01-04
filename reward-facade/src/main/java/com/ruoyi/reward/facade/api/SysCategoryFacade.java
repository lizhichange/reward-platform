package com.ruoyi.reward.facade.api;

import com.ruoyi.reward.facade.dto.SysCategoryDTO;

import java.util.List;

/**
 * 部门管理 服务层
 *
 * @author ruoyi
 */
public interface SysCategoryFacade {
    /**
     * 查询部门管理数据
     *
     * @param dept 部门信息
     * @return 部门信息集合
     */
    List<SysCategoryDTO> selectDeptList(SysCategoryDTO dept);


    int selectDeptCount(Long parentId);


    int deleteDeptById(Long deptId);


    SysCategoryDTO selectDeptById(Long deptId);


}
