package com.ruoyi.reward.service.impl;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.reward.domain.SysCategory;
import com.ruoyi.reward.mapper.SysCategoryMapper;
import com.ruoyi.reward.service.ISysCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 部门管理 服务实现
 *
 * @author ruoyi
 */
@Service
public class SysCategoryServiceImpl implements ISysCategoryService {


    @Autowired
    SysCategoryMapper sysCategoryMapper;

    /**
     * 查询部门管理数据
     *
     * @param dept 部门信息
     * @return 部门信息集合
     */
    @Override
    public List<SysCategory> selectDeptList(SysCategory dept) {
        return sysCategoryMapper.selectDeptList(dept);
    }

    /**
     * 查询部门管理树
     *
     * @param dept 部门信息
     * @return 所有部门信息
     */
    @Override
    public List<Ztree> selectDeptTree(SysCategory dept) {
        List<SysCategory> deptList = sysCategoryMapper.selectDeptList(dept);
        return initZtree(deptList);
    }


    /**
     * 对象转部门树
     *
     * @param deptList 部门列表
     * @return 树结构列表
     */
    public List<Ztree> initZtree(List<SysCategory> deptList) {
        return initZtree(deptList, null);
    }

    /**
     * 对象转部门树
     *
     * @param deptList     部门列表
     * @param roleDeptList 角色已存在菜单列表
     * @return 树结构列表
     */
    public List<Ztree> initZtree(List<SysCategory> deptList, List<String> roleDeptList) {

        List<Ztree> ztrees = new ArrayList<>();
        boolean isCheck = StringUtils.isNotNull(roleDeptList);
        for (SysCategory dept : deptList) {
            if (UserConstants.DEPT_NORMAL.equals(dept.getStatus())) {
                Ztree ztree = new Ztree();
                ztree.setId(dept.getCategoryId());
                ztree.setpId(dept.getParentId());
                ztree.setName(dept.getCategoryName());
                ztree.setTitle(dept.getCategoryName());
                if (isCheck) {
                    ztree.setChecked(roleDeptList.contains(dept.getCategoryId() + dept.getCategoryName()));
                }
                ztrees.add(ztree);
            }
        }
        return ztrees;
    }

    /**
     * 查询部门人数
     *
     * @param parentId 部门ID
     * @return 结果
     */
    @Override
    public int selectDeptCount(Long parentId) {
        SysCategory dept = new SysCategory();
        dept.setParentId(parentId);
        return sysCategoryMapper.selectDeptCount(dept);
    }

    /**
     * 查询部门是否存在用户
     *
     * @param deptId 部门ID
     * @return 结果 true 存在 false 不存在
     */
    @Override
    public boolean checkDeptExistUser(Long deptId) {
        int result = sysCategoryMapper.checkDeptExistUser(deptId);
        return result > 0;
    }

    /**
     * 删除部门管理信息
     *
     * @param deptId 部门ID
     * @return 结果
     */
    @Override
    public int deleteDeptById(Long deptId) {
        return sysCategoryMapper.deleteDeptById(deptId);
    }

    /**
     * 新增保存部门信息
     *
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    public int insertDept(SysCategory dept) {
        SysCategory info = sysCategoryMapper.selectDeptById(dept.getParentId());
        // 如果父节点不为"正常"状态,则不允许新增子节点
        if (!UserConstants.DEPT_NORMAL.equals(info.getStatus())) {
            throw new BusinessException("部门停用，不允许新增");
        }
        dept.setAncestors(info.getAncestors() + "," + dept.getParentId());
        return sysCategoryMapper.insertDept(dept);
    }

    /**
     * 修改保存部门信息
     *
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    @Transactional
    public int updateDept(SysCategory dept) {
        SysCategory newParentDept = sysCategoryMapper.selectDeptById(dept.getParentId());
        SysCategory oldDept = selectDeptById(dept.getCategoryId());
        if (StringUtils.isNotNull(newParentDept) && StringUtils.isNotNull(oldDept)) {
            String newAncestors = newParentDept.getAncestors() + "," + newParentDept.getCategoryId();
            String oldAncestors = oldDept.getAncestors();
            dept.setAncestors(newAncestors);
            updateDeptChildren(dept.getCategoryId(), newAncestors, oldAncestors);
        }
        int result = sysCategoryMapper.updateDept(dept);
        if (UserConstants.DEPT_NORMAL.equals(dept.getStatus())) {
            // 如果该部门是启用状态，则启用该部门的所有上级部门
            updateParentDeptStatus(dept);
        }
        return result;
    }

    /**
     * 修改该部门的父级部门状态
     *
     * @param dept 当前部门
     */
    private void updateParentDeptStatus(SysCategory dept) {
        String updateBy = dept.getUpdateBy();
        dept = sysCategoryMapper.selectDeptById(dept.getCategoryId());
        dept.setUpdateBy(updateBy);
        sysCategoryMapper.updateDeptStatus(dept);
    }

    /**
     * 修改子元素关系
     *
     * @param deptId       被修改的部门ID
     * @param newAncestors 新的父ID集合
     * @param oldAncestors 旧的父ID集合
     */
    public void updateDeptChildren(Long deptId, String newAncestors, String oldAncestors) {
        List<SysCategory> children = sysCategoryMapper.selectChildrenDeptById(deptId);
        for (SysCategory child : children) {
            child.setAncestors(child.getAncestors().replace(oldAncestors, newAncestors));
        }
        if (children.size() > 0) {
            sysCategoryMapper.updateDeptChildren(children);
        }
    }

    /**
     * 根据部门ID查询信息
     *
     * @param deptId 部门ID
     * @return 部门信息
     */
    @Override
    public SysCategory selectDeptById(Long deptId) {
        return sysCategoryMapper.selectDeptById(deptId);
    }

    /**
     * 校验部门名称是否唯一
     *
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    public String checkDeptNameUnique(SysCategory dept) {
        Long deptId = StringUtils.isNull(dept.getCategoryId()) ? -1L : dept.getCategoryId();
        SysCategory info = sysCategoryMapper.checkDeptNameUnique(dept.getCategoryName(), dept.getParentId());
        if (StringUtils.isNotNull(info) && info.getCategoryId().longValue() != deptId.longValue()) {
            return UserConstants.DEPT_NAME_NOT_UNIQUE;
        }
        return UserConstants.DEPT_NAME_UNIQUE;
    }
}
