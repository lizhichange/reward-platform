package com.ruoyi.reward.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.reward.domain.SysCategory;
import com.ruoyi.reward.facade.api.VideoFacade;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.reward.service.SysCategoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 栏目信息
 *
 * @author ruoyi
 */
@Controller
@RequestMapping("/system/category")
public class SysCategoryController extends BaseController {
    private String prefix = "system/category";

    @Autowired
    private SysCategoryService categoryService;

    @RequiresPermissions("system:category:view")
    @GetMapping()
    public String category() {
        return prefix + "/category";
    }

    @RequiresPermissions("system:category:list")
    @PostMapping("/list")
    @ResponseBody
    public List<SysCategory> list(SysCategory category) {
        return categoryService.selectDeptList(category);
    }

    /**
     * 新增栏目
     */
    @GetMapping("/add/{parentId}")
    public String add(@PathVariable("parentId") Long parentId, ModelMap mmap) {
        mmap.put("dept", categoryService.selectDeptById(parentId));
        return prefix + "/add";
    }

    /**
     * 新增保存栏目
     */
    @Log(title = "栏目管理", businessType = BusinessType.INSERT)
    @RequiresPermissions("system:SysDeptController:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated SysCategory dept) {
        if (UserConstants.DEPT_NAME_NOT_UNIQUE.equals(categoryService.checkDeptNameUnique(dept))) {
            return error("新增栏目'" + dept.getCategoryName() + "'失败，栏目名称已存在");
        }
        return toAjax(categoryService.insertDept(dept));
    }

    /**
     * 修改
     */
    @GetMapping("/edit/{deptId}")
    public String edit(@PathVariable("deptId") Long deptId, ModelMap mmap) {
        SysCategory dept = categoryService.selectDeptById(deptId);
        if (StringUtils.isNotNull(dept) && 100L == deptId) {
            dept.setParentName("无");
        }
        mmap.put("dept", dept);
        return prefix + "/edit";
    }

    /**
     * 保存
     */
    @Log(title = "栏目管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:category:edit")
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated SysCategory dept) {
        if (UserConstants.DEPT_NAME_NOT_UNIQUE.equals(categoryService.checkDeptNameUnique(dept))) {
            return error("修改栏目'" + dept.getCategoryName() + "'失败，栏目名称已存在");
        } else if (dept.getParentId().equals(dept.getCategoryId())) {
            return error("修改栏目'" + dept.getCategoryName() + "'失败，上级栏目不能是自己");
        }

        return toAjax(categoryService.updateDept(dept));
    }

    /**
     * 删除
     */
    @Log(title = "栏目管理", businessType = BusinessType.DELETE)
    @RequiresPermissions("system:category:remove")
    @GetMapping("/remove/{deptId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("deptId") Long deptId) {
        if (categoryService.selectDeptCount(deptId) > 0) {
            return AjaxResult.warn("存在下级栏目,不允许删除");
        }
        VideoDTO videoDTO = new VideoDTO();
        videoDTO.setCategoryId(Math.toIntExact(deptId));
        List<VideoDTO> list = videoFacade.selectVideoDTOList(videoDTO);
        if (!CollectionUtils.isEmpty(list)) {
            return AjaxResult.warn("该类目关联了视频,不允许删除");
        }
        return toAjax(categoryService.deleteDeptById(deptId));
    }

    @Autowired
    VideoFacade videoFacade;

    /**
     * 校验栏目名称
     */
    @PostMapping("/checkDeptNameUnique")
    @ResponseBody
    public String checkDeptNameUnique(SysCategory dept) {
        return categoryService.checkDeptNameUnique(dept);
    }

    /**
     * 选择栏目树
     */
    @GetMapping("/selectDeptTree/{deptId}")
    public String selectDeptTree(@PathVariable("deptId") Long deptId, ModelMap mmap) {
        SysCategory sysCategory = categoryService.selectDeptById(deptId);
        mmap.put("dept", sysCategory);
        return prefix + "/tree";
    }

    /**
     * 加载栏目列表树
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData() {
        return categoryService.selectDeptTree(new SysCategory());
    }


}
