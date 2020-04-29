package com.ruoyi.web.controller.system;


import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.reward.domain.Ts;
import com.ruoyi.reward.facade.api.TsFacade;
import com.ruoyi.reward.service.ITsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 投诉列表Controller
 *
 * @author ruoyi
 * @date 2020-03-16
 */
@Controller
@RequestMapping("/system/ts")
public class TsController extends BaseController {
    private String prefix = "system/ts";

    @Autowired
    TsFacade tsFacade;
    @Autowired
    ITsService tsService;

    @RequiresPermissions("system:ts:view")
    @GetMapping()
    public String ts(ModelMap modelMap) {
        int count = tsFacade.count();
        modelMap.addAttribute("count", count);
        return prefix + "/ts";
    }

    /**
     * 查询投诉列表列表
     */
    @RequiresPermissions("system:ts:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Ts ts) {
        startPage();
        List<Ts> list = tsService.selectTsList(ts);
        return getDataTable(list);
    }

    /**
     * 导出投诉列表列表
     */
    @RequiresPermissions("system:ts:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Ts ts) {
        List<Ts> list = tsService.selectTsList(ts);
        ExcelUtil<Ts> util = new ExcelUtil<>(Ts.class);
        return util.exportExcel(list, "ts");
    }

    /**
     * 新增投诉列表
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存投诉列表
     */
    @RequiresPermissions("system:ts:add")
    @Log(title = "投诉列表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Ts ts) {
        return toAjax(tsService.insertTs(ts));
    }

    /**
     * 修改投诉列表
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        Ts ts = tsService.selectTsById(id);
        mmap.put("ts", ts);
        return prefix + "/edit";
    }

    /**
     * 修改保存投诉列表
     */
    @RequiresPermissions("system:ts:edit")
    @Log(title = "投诉列表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Ts ts) {
        return toAjax(tsService.updateTs(ts));
    }

    /**
     * 删除投诉列表
     */
    @RequiresPermissions("system:ts:remove")
    @Log(title = "投诉列表", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(tsService.deleteTsByIds(ids));
    }
}
