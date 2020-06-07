package com.ruoyi.reward.controller;

import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.reward.domain.Trade;
import com.ruoyi.reward.facade.api.AccountFacade;
import com.ruoyi.reward.facade.enums.AccountBizCode;
import com.ruoyi.reward.facade.enums.AccountOptType;
import com.ruoyi.reward.facade.enums.TradeStateEnum;
import com.ruoyi.reward.facade.request.UserAccountOperatorRequest;
import com.ruoyi.reward.service.ITradeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.near.toolkit.model.SelectOptionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * 交易信息Controller
 *
 * @author s
 * @date 2020-06-05
 */
@Controller
@RequestMapping("/system/trade")
public class TradeController extends BaseController {
    private String prefix = "system/trade";

    @Autowired
    private ITradeService tradeService;
    @Autowired
    private AccountFacade accountFacade;

    @RequiresPermissions("system:trade:view")
    @GetMapping()
    public String trade(ModelMap modelMap) {
        List<SelectOptionVO> states = Lists.newArrayList();
        for (TradeStateEnum value : TradeStateEnum.values()) {
            SelectOptionVO option = new SelectOptionVO();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            states.add(option);
        }
        modelMap.addAttribute("states", states);
        return prefix + "/trade";
    }

    /**
     * 查询交易信息列表
     */
    @RequiresPermissions("system:trade:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Trade trade) {
        startPage();
        List<Trade> list = tradeService.selectTradeList(trade);
        return getDataTable(list);
    }

    /**
     * 用户状态修改
     */
    @RequiresPermissions("system:trade:edit")
    @Log(title = "交易管理", businessType = BusinessType.UPDATE)
    @PostMapping("/changeState")
    @ResponseBody
    public AjaxResult changeState(Trade trade) {
        String tradeNo = trade.getTradeNo();
        Trade tradeById = tradeService.selectTradeById(tradeNo);
        if (tradeById == null) {
            return error("系统异常,未查询到交易信息");
        }
        trade.setGmtModified(new Date());
        int i = tradeService.updateTrade(trade);
        UserAccountOperatorRequest request = new UserAccountOperatorRequest();
        request.setUserId(tradeById.getCreateBy());
        request.setAmount(tradeById.getAmount());
        request.setOptType(AccountOptType.OUTLAY.getCode());
        request.setBizCode(AccountBizCode.WITHDRAW.getCode());
        accountFacade.minusBalance(request);
        return toAjax(i > 0);
    }

    /**
     * 导出交易信息列表
     */
    @RequiresPermissions("system:trade:export")
    @Log(title = "交易信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Trade trade) {
        List<Trade> list = tradeService.selectTradeList(trade);
        ExcelUtil<Trade> util = new ExcelUtil<Trade>(Trade.class);
        return util.exportExcel(list, "trade");
    }

    /**
     * 新增交易信息
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存交易信息
     */
    @RequiresPermissions("system:trade:add")
    @Log(title = "交易信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Trade trade) {
        return toAjax(tradeService.insertTrade(trade));
    }

    /**
     * 修改交易信息
     */
    @GetMapping("/edit/{tradeNo}")
    public String edit(@PathVariable("tradeNo") String tradeNo, ModelMap mmap) {
        Trade trade = tradeService.selectTradeById(tradeNo);
        mmap.put("trade", trade);
        return prefix + "/edit";
    }

    /**
     * 修改保存交易信息
     */
    @RequiresPermissions("system:trade:edit")
    @Log(title = "交易信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Trade trade) {
        return toAjax(tradeService.updateTrade(trade));
    }

    /**
     * 删除交易信息
     */
    @RequiresPermissions("system:trade:remove")
    @Log(title = "交易信息", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(tradeService.deleteTradeByIds(ids));
    }
}
