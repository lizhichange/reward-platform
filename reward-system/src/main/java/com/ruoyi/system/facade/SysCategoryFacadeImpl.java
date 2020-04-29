package com.ruoyi.system.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.collect.Lists;
import com.ruoyi.reward.facade.api.SysCategoryFacade;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.system.domain.SysCategory;
import com.ruoyi.system.service.ISysCategoryService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 部门管理 服务实现
 *
 * @author ruoyi
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)public class SysCategoryFacadeImpl implements SysCategoryFacade {


    @Autowired
    ISysCategoryService sysCategoryService;

    @Override
    public List<SysCategoryDTO> selectDeptList(SysCategoryDTO dept) {
        SysCategory item = new SysCategory();
        BeanUtils.copyProperties(dept, item);
        List<SysCategory> list = sysCategoryService.selectDeptList(item);
        if (CollectionUtils.isEmpty(list)) {
            return Lists.newArrayList();
        }

        return list.stream().map(it -> {
            SysCategoryDTO dto = new SysCategoryDTO();
            BeanUtils.copyProperties(it, dto);
            return dto;
        }).collect(Collectors.toList());
    }

    @Override
    public int selectDeptCount(Long parentId) {
        return sysCategoryService.selectDeptCount(parentId);
    }

    @Override
    public int deleteDeptById(Long deptId) {
        return sysCategoryService.deleteDeptById(deptId);
    }

    @Override
    public SysCategoryDTO selectDeptById(Long deptId) {
        SysCategory sysCategory = sysCategoryService.selectDeptById(deptId);
        SysCategoryDTO item = new SysCategoryDTO();
        BeanUtils.copyProperties(sysCategory, item);
        return item;
    }
}
