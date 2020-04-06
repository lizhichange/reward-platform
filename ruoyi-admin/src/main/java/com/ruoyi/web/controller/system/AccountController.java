package com.ruoyi.web.controller.system;


import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.sms.facade.enums.AccountType;
import com.ruoyi.sms.facade.enums.SwitchEnum;
import com.ruoyi.system.domain.Account;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.IAccountService;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.web.controller.vo.SelectOption;
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
 * @date 2020-04-06
 */
@Controller
@RequestMapping("/system/account")
public class AccountController extends BaseController {
    private String prefix = "system/account";

    @Autowired
    private IAccountService accountService;

    @RequiresPermissions("system:account:view")
    @GetMapping()
    public String account(ModelMap modelMap) {


        List<SelectOption> states = Lists.newArrayList();
        for (SwitchEnum value : SwitchEnum.values()) {
            SelectOption option = new SelectOption();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            states.add(option);
        }
        modelMap.addAttribute("states", states);


        List<SelectOption> types = Lists.newArrayList();
        for (AccountType value : AccountType.values()) {
            SelectOption option = new SelectOption();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            types.add(option);
        }
        modelMap.addAttribute("types", types);


        return prefix + "/account";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:account:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Account account) {
        startPage();
        List<Account> list = accountService.selectAccountList(account);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:account:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Account account) {
        List<Account> list = accountService.selectAccountList(account);
        ExcelUtil<Account> util = new ExcelUtil<Account>(Account.class);
        return util.exportExcel(list, "account");
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
    @RequiresPermissions("system:account:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Account account) {
        return toAjax(accountService.insertAccount(account));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        Account account = accountService.selectAccountById(id);
        mmap.put("account", account);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:account:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Account account) {
        return toAjax(accountService.updateAccount(account));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:account:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(accountService.deleteAccountByIds(ids));
    }

    ISysUserService sysUserService;

    /**
     * 用户状态修改
     */
    @Log(title = "账户管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:account:edit")
    @PostMapping("/changeStatus")
    @ResponseBody
    public AjaxResult changeStatus(Account account, SysUser user) {
        sysUserService.checkUserAllowed(user);
        return toAjax(accountService.changeStatus(account));
    }

}