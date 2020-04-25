package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.web.client.ISysCategoryFacadeClient;
import com.ruoyi.reward.facade.api.ISysCategoryFacade;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class ISysCategoryFacadeClientImpl implements ISysCategoryFacadeClient {

    @Reference(version = "1.0.0", check = false)
    ISysCategoryFacade sysCategoryFacade;

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
