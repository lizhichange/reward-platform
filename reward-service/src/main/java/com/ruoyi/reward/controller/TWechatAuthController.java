package com.ruoyi.reward.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.reward.domain.TWechatAuth;
import com.ruoyi.reward.service.TWechatAuthService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 授权信息Controller
 *
 * @author ruoyi
 * @date 2020-05-04
 */
@Controller
@RequestMapping("/system/wxauth")
public class TWechatAuthController extends BaseController {
    private String prefix = "system/wxauth";

    @Autowired
    private TWechatAuthService tWechatAuthService;

    @RequiresPermissions("system:wxauth:view")
    @GetMapping()
    public String wxauth() {
        return prefix + "/wxauth";
    }

    /**
     * 查询授权信息列表
     */
    @RequiresPermissions("system:wxauth:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TWechatAuth tWechatAuth) {
        startPage();
        List<TWechatAuth> list = tWechatAuthService.selectTWechatAuthList(tWechatAuth);
        return getDataTable(list);
    }

    /**
     * 导出授权信息列表
     */
    @RequiresPermissions("system:wxauth:export")
    @Log(title = "授权信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TWechatAuth tWechatAuth) {
        List<TWechatAuth> list = tWechatAuthService.selectTWechatAuthList(tWechatAuth);
        ExcelUtil<TWechatAuth> util = new ExcelUtil<TWechatAuth>(TWechatAuth.class);
        return util.exportExcel(list, "wxauth");
    }

    /**
     * 新增授权信息
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存授权信息
     */
    @RequiresPermissions("system:wxauth:add")
    @Log(title = "授权信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TWechatAuth tWechatAuth) {
        return toAjax(tWechatAuthService.insertTWechatAuth(tWechatAuth));
    }

    /**
     * 修改授权信息
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        TWechatAuth tWechatAuth = tWechatAuthService.selectTWechatAuthById(id);
        mmap.put("tWechatAuth", tWechatAuth);
        return prefix + "/edit";
    }

    /**
     * 修改保存授权信息
     */
    @RequiresPermissions("system:wxauth:edit")
    @Log(title = "授权信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TWechatAuth tWechatAuth) {
        return toAjax(tWechatAuthService.updateTWechatAuth(tWechatAuth));
    }

    /**
     * 删除授权信息
     */
    @RequiresPermissions("system:wxauth:remove")
    @Log(title = "授权信息", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(tWechatAuthService.deleteTWechatAuthByIds(ids));
    }
}