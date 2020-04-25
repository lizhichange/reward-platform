package com.reward.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysShort;
import com.ruoyi.system.service.ISysShortService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 链接管理Controller
 *
 * @author ruoyi
 * @date 2020-03-23
 */
@Controller
@RequestMapping("/system/short")
public class SysShortController extends BaseController {
    private String prefix = "system/short";

    @Autowired
    private ISysShortService sysShortService;

    @RequiresPermissions("system:short:view")
    @GetMapping()
    public String index() {
        return prefix + "/short";
    }

    /**
     * 查询链接管理列表
     */
    @RequiresPermissions("system:short:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysShort sysShort) {
        startPage();
        List<SysShort> list = sysShortService.selectSysShortList(sysShort);
        return getDataTable(list);
    }

    /**
     * 导出链接管理列表
     */
    @RequiresPermissions("system:short:export")
    @Log(title = "链接管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysShort sysShort) {
        List<SysShort> list = sysShortService.selectSysShortList(sysShort);
        ExcelUtil<SysShort> util = new ExcelUtil<SysShort>(SysShort.class);
        return util.exportExcel(list, "short");
    }

    /**
     * 新增链接管理
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存链接管理
     */
    @RequiresPermissions("system:short:add")
    @Log(title = "链接管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysShort sysShort) {
        return toAjax(sysShortService.insertSysShort(sysShort));
    }

    /**
     * 修改链接管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        SysShort sysShort = sysShortService.selectSysShortById(id);
        mmap.put("sysShort", sysShort);
        return prefix + "/edit";
    }

    /**
     * 修改保存链接管理
     */
    @RequiresPermissions("system:short:edit")
    @Log(title = "链接管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysShort sysShort) {
        return toAjax(sysShortService.updateSysShort(sysShort));
    }

    /**
     * 删除链接管理
     */
    @RequiresPermissions("system:short:remove")
    @Log(title = "链接管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(sysShortService.deleteSysShortByIds(ids));
    }
}
