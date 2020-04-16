package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.sms.domain.TUserDetail;
import com.ruoyi.sms.service.ITUserDetailService;
import org.apache.commons.codec.binary.Base64;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 平台用户Controller
 *
 * @author ruoyi
 * @date 2020-04-11
 */
@Controller
@RequestMapping("/system/wxuser")
public class TUserDetailController extends BaseController {
    private String prefix = "system/wxuser";

    @Autowired
    private ITUserDetailService tUserDetailService;

    @RequiresPermissions("system:wxuser:view")
    @GetMapping()
    public String wxuser() {
        return prefix + "/wxuser";
    }

    /**
     * 查询平台用户列表
     */
    @RequiresPermissions("system:wxuser:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TUserDetail tUserDetail) {
        startPage();
        List<TUserDetail> list = tUserDetailService.selectTUserDetailList(tUserDetail);
        for (TUserDetail userDetail : list) {
            userDetail.setNickname(new String(Base64.decodeBase64(userDetail.getNickname())));
        }
        return getDataTable(list);
    }

    /**
     * 导出平台用户列表
     */
    @RequiresPermissions("system:wxuser:export")
    @Log(title = "平台用户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TUserDetail tUserDetail) {
        List<TUserDetail> list = tUserDetailService.selectTUserDetailList(tUserDetail);
        ExcelUtil<TUserDetail> util = new ExcelUtil<TUserDetail>(TUserDetail.class);
        return util.exportExcel(list, "wxuser");
    }

    /**
     * 新增平台用户
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存平台用户
     */
    @RequiresPermissions("system:wxuser:add")
    @Log(title = "平台用户", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TUserDetail tUserDetail) {
        return toAjax(tUserDetailService.insertTUserDetail(tUserDetail));
    }

    /**
     * 修改平台用户
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        TUserDetail tUserDetail = tUserDetailService.selectTUserDetailById(id);
        mmap.put("tUserDetail", tUserDetail);
        return prefix + "/edit";
    }

    /**
     * 修改保存平台用户
     */
    @RequiresPermissions("system:wxuser:edit")
    @Log(title = "平台用户", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TUserDetail tUserDetail) {
        return toAjax(tUserDetailService.updateTUserDetail(tUserDetail));
    }

    /**
     * 删除平台用户
     */
    @RequiresPermissions("system:wxuser:remove")
    @Log(title = "平台用户", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(tUserDetailService.deleteTUserDetailByIds(ids));
    }
}
