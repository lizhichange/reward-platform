package com.ruoyi.web.controller.system;


import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.sms.facade.api.EnterpriseInfoService;
import com.ruoyi.sms.facade.dto.EnterpriseInfoDTO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 【请填写功能名称】Controller
 *
 * @author ruoyi
 * @date 2019-09-06
 */
@Controller
@RequestMapping("/system/info")
public class EnterpriseInfoController extends BaseController {
    private String prefix = "system/info";

    @Autowired
    private EnterpriseInfoService enterpriseInfoService;

    @RequiresPermissions("system:info:view")
    @GetMapping()
    public String info() {
        return prefix + "/info";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:info:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(EnterpriseInfoDTO enterpriseInfo) {
        startPage();
        List<EnterpriseInfoDTO> list = enterpriseInfoService.selectEnterpriseInfoList(enterpriseInfo);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:info:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(EnterpriseInfoDTO enterpriseInfo) {
        List<EnterpriseInfoDTO> list = enterpriseInfoService.selectEnterpriseInfoList(enterpriseInfo);
        ExcelUtil<EnterpriseInfoDTO> util = new ExcelUtil<>(EnterpriseInfoDTO.class);
        return util.exportExcel(list, "info");
    }

    /**
     * 新增【请填写功能名称】
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存【请填写功能名称】
     */
    @RequiresPermissions("system:info:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(EnterpriseInfoDTO enterpriseInfo) {
        return toAjax(enterpriseInfoService.insertEnterpriseInfo(enterpriseInfo));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        EnterpriseInfoDTO enterpriseInfo = enterpriseInfoService.selectEnterpriseInfoById(id);
        mmap.put("enterpriseInfo", enterpriseInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:info:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(EnterpriseInfoDTO enterpriseInfo) {
        return toAjax(enterpriseInfoService.updateEnterpriseInfo(enterpriseInfo));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:info:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(enterpriseInfoService.deleteEnterpriseInfoByIds(ids));
    }
}
