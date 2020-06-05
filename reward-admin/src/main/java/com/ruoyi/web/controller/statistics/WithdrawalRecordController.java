package com.ruoyi.web.controller.statistics;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SysOrder;
import com.ruoyi.system.service.ISysOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 打赏记录
 *
 * @author ruoyi
 */
@Controller
@RequestMapping("/statistics/withdrawal")
public class WithdrawalRecordController extends BaseController {

    private final String prefix = "statistics/withdrawal";
    @Autowired
    ISysOrderService sysOrderService;

    @GetMapping("/applyWithdrawal")
    public String applyWithdrawal(ModelMap modelMap) {

        return prefix + "/applyWithdrawal";
    }


    @GetMapping("/withdrawalRecord")
    public String withdrawalRecord(ModelMap modelMap) {
        return prefix + "/withdrawalRecord";
    }


    /**
     *
     */
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysOrder sysOrder) {
        startPage();
        String loginName = ShiroUtils.getLoginName();
        sysOrder.setExtensionUserId(loginName);
        List<SysOrder> list = sysOrderService.selectSysOrderList(sysOrder);
        return getDataTable(list);
    }

    @Log(title = "申请提现", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysOrder sysOrder) {
        return toAjax(sysOrderService.insertSysOrder(sysOrder));
    }

}
