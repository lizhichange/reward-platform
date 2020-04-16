package com.ruoyi.web.controller.system;

import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.sms.facade.enums.AccountBizCode;
import com.ruoyi.sms.facade.enums.AccountOptType;
import com.ruoyi.system.domain.AccountDetail;
import com.ruoyi.system.service.IAccountDetailService;
import com.ruoyi.web.controller.vo.SelectOption;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.model.Money;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 账户明细Controller
 *
 * @author ruoyi
 * @date 2020-04-13
 */
@Controller
@RequestMapping("/system/accountDetail")
public class AccountDetailController extends BaseController {
    private String prefix = "system/accountDetail";

    @Autowired
    private IAccountDetailService accountDetailService;

    @RequiresPermissions("system:accountDetail:view")
    @GetMapping()
    public String accountDetail(ModelMap modelMap) {


        List<SelectOption> types = Lists.newArrayList();
        for (AccountOptType value : AccountOptType.values()) {
            SelectOption option = new SelectOption();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            types.add(option);
        }
        modelMap.addAttribute("types", types);


        List<SelectOption> biz = Lists.newArrayList();
        for (AccountBizCode value : AccountBizCode.values()) {
            SelectOption option = new SelectOption();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            biz.add(option);
        }
        modelMap.addAttribute("biz", biz);


        return prefix + "/accountDetail";
    }

    /**
     * 查询账户明细列表
     */
    @RequiresPermissions("system:accountDetail:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(AccountDetail accountDetail) {

        startPage();
        List<AccountDetail> list = accountDetailService.selectAccountDetailList(accountDetail);
        for (AccountDetail detail : list) {
            String optType = detail.getOptType();
            AccountOptType accountOptType = EnumUtil.queryByCode(optType, AccountOptType.class);
            detail.setOptTypeStr(accountOptType.getDesc());
            Long amount = detail.getAmount();
            Money money = new Money();
            money.setCent(amount);
            detail.setAmountStr(money.toString());


            AccountBizCode bizCode = EnumUtil.queryByCode(detail.getBizCode(), AccountBizCode.class);

            detail.setBizCodeStr(bizCode.getDesc());



        }
        return getDataTable(list);
    }

    /**
     * 导出账户明细列表
     */
    @RequiresPermissions("system:accountDetail:export")
    @Log(title = "账户明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(AccountDetail accountDetail) {
        List<AccountDetail> list = accountDetailService.selectAccountDetailList(accountDetail);
        ExcelUtil<AccountDetail> util = new ExcelUtil<AccountDetail>(AccountDetail.class);
        return util.exportExcel(list, "accountDetail");
    }

    /**
     * 新增账户明细
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存账户明细
     */
    @RequiresPermissions("system:accountDetail:add")
    @Log(title = "账户明细", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(AccountDetail accountDetail) {
        return toAjax(accountDetailService.insertAccountDetail(accountDetail));
    }

    /**
     * 修改账户明细
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        AccountDetail accountDetail = accountDetailService.selectAccountDetailById(id);
        mmap.put("accountDetail", accountDetail);
        return prefix + "/edit";
    }

    /**
     * 修改保存账户明细
     */
    @RequiresPermissions("system:accountDetail:edit")
    @Log(title = "账户明细", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(AccountDetail accountDetail) {
        return toAjax(accountDetailService.updateAccountDetail(accountDetail));
    }

    /**
     * 删除账户明细
     */
    @RequiresPermissions("system:accountDetail:remove")
    @Log(title = "账户明细", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(accountDetailService.deleteAccountDetailByIds(ids));
    }
}
