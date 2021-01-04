package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.SysCategoryFacade;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.web.client.SysCategoryFacadeClient;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class SysCategoryFacadeClientImpl implements SysCategoryFacadeClient {

    @Reference(version = "1.0.0", check = false)
    SysCategoryFacade sysCategoryFacade;

    @Override
    public List<SysCategoryDTO> selectDeptList(SysCategoryDTO dept) {
        return sysCategoryFacade.selectDeptList(dept);
    }

    @Override
    public int selectDeptCount(Long parentId) {
        return 0;
    }

    @Override
    public int deleteDeptById(Long deptId) {
        return 0;
    }

    @Override
    public SysCategoryDTO selectDeptById(Long deptId) {
        return sysCategoryFacade.selectDeptById(deptId);
    }
}
