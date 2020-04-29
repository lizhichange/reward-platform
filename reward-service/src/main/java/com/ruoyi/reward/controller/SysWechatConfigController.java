package com.ruoyi.reward.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.reward.domain.SysWechatConfig;
import com.ruoyi.reward.service.SysWechatConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 公众号配置信息Controller
 *
 * @author ruoyi
 * @date 2020-03-24
 */
@Controller
@RequestMapping("/system/wechatConfig")
public class SysWechatConfigController extends BaseController {
    private String prefix = "system/wechatConfig";

    @Autowired
    private SysWechatConfigService sysWechatConfigService;

    @RequiresPermissions("system:wechatConfig:view")
    @GetMapping()
    public String wechatConfig() {
        return prefix + "/wechatConfig";
    }

    /**
     * 查询公众号配置信息列表
     */
    @RequiresPermissions("system:wechatConfig:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysWechatConfig sysWechatConfig) {
        startPage();
        List<SysWechatConfig> list = sysWechatConfigService.selectSysWechatConfigList(sysWechatConfig);
        return getDataTable(list);
    }

    /**
     * 导出公众号配置信息列表
     */
    @RequiresPermissions("system:wechatConfig:export")
    @Log(title = "公众号配置信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysWechatConfig sysWechatConfig) {
        List<SysWechatConfig> list = sysWechatConfigService.selectSysWechatConfigList(sysWechatConfig);
        ExcelUtil<SysWechatConfig> util = new ExcelUtil<SysWechatConfig>(SysWechatConfig.class);
        return util.exportExcel(list, "wechatConfig");
    }

    /**
     * 新增公众号配置信息
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存公众号配置信息
     */
    @RequiresPermissions("system:wechatConfig:add")
    @Log(title = "公众号配置信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysWechatConfig sysWechatConfig) {
        return toAjax(sysWechatConfigService.insertSysWechatConfig(sysWechatConfig));
    }

    /**
     * 修改公众号配置信息
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        SysWechatConfig sysWechatConfig = sysWechatConfigService.selectSysWechatConfigById(id);
        mmap.put("sysWechatConfig", sysWechatConfig);
        return prefix + "/edit";
    }

    /**
     * 修改保存公众号配置信息
     */
    @RequiresPermissions("system:wechatConfig:edit")
    @Log(title = "公众号配置信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysWechatConfig sysWechatConfig) {
        return toAjax(sysWechatConfigService.updateSysWechatConfig(sysWechatConfig));
    }

    /**
     * 删除公众号配置信息
     */
    @RequiresPermissions("system:wechatConfig:remove")
    @Log(title = "公众号配置信息", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(sysWechatConfigService.deleteSysWechatConfigByIds(ids));
    }
}
