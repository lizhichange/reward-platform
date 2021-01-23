package com.ruoyi.reward.controller;


import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.reward.domain.Complaint;
import com.ruoyi.reward.facade.api.ComplaintFacade;
import com.ruoyi.reward.service.ComplaintService;
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
public class ComplaintController extends BaseController {
    private String prefix = "system/ts";

    @Autowired
    ComplaintFacade complaintFacade;
    @Autowired
    ComplaintService complaintService;

    @RequiresPermissions("system:ts:view")
    @GetMapping()
    public String ts(ModelMap modelMap) {
        int count = complaintFacade.count();
        modelMap.addAttribute("count", count);
        return prefix + "/ts";
    }

    /**
     * 查询投诉列表列表
     */
    @RequiresPermissions("system:complaint:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Complaint complaint) {
        startPage();
        List<Complaint> list = complaintService.selectTsList(complaint);
        return getDataTable(list);
    }

    /**
     * 导出投诉列表列表
     */
    @RequiresPermissions("system:complaint:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Complaint complaint) {
        List<Complaint> list = complaintService.selectTsList(complaint);
        ExcelUtil<Complaint> util = new ExcelUtil<>(Complaint.class);
        return util.exportExcel(list, "complaint");
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
    @RequiresPermissions("system:complaint:add")
    @Log(title = "投诉列表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Complaint complaint) {
        return toAjax(complaintService.insertTs(complaint));
    }

    /**
     * 修改投诉列表
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        Complaint complaint = complaintService.selectTsById(id);
        mmap.put("complaint", complaint);
        return prefix + "/edit";
    }

    /**
     * 修改保存投诉列表
     */
    @RequiresPermissions("system:complaint:edit")
    @Log(title = "投诉列表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Complaint complaint) {
        return toAjax(complaintService.updateTs(complaint));
    }

    /**
     * 删除投诉列表
     */
    @RequiresPermissions("system:ts:remove")
    @Log(title = "投诉列表", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(complaintService.deleteTsByIds(ids));
    }
}
