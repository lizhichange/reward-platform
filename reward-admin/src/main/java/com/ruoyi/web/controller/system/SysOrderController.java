package com.ruoyi.web.controller.system;

import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.reward.facade.enums.OrderPayType;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.system.domain.SysOrder;
import com.ruoyi.system.service.SysOrderService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.near.toolkit.model.SelectOptionVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 订单列表Controller
 *
 * @author ruoyi
 * @date 2020-03-26
 */
@Controller
@RequestMapping("/system/sysOrder")
public class SysOrderController extends BaseController {
    private String prefix = "system/sysOrder";

    private final SysOrderService sysOrderService;

    public SysOrderController(SysOrderService sysOrderService) {
        this.sysOrderService = sysOrderService;
    }

    @RequiresPermissions("system:sysOrder:view")
    @GetMapping()
    public String sysOrder(ModelMap modelMap) {


        OrderPayType[] values = OrderPayType.values();
        List<SelectOptionVO> types = Lists.newArrayList();
        for (OrderPayType value : values) {
            SelectOptionVO option = new SelectOptionVO();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            types.add(option);
        }
        modelMap.addAttribute("types", types);

        OrderStatusType[] status = OrderStatusType.values();
        List<SelectOptionVO> statusList = Lists.newArrayList();
        for (OrderStatusType value : status) {
            SelectOptionVO option = new SelectOptionVO();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            statusList.add(option);
        }
        modelMap.addAttribute("status", statusList);
        return prefix + "/sysOrder";
    }


    /**
     * 查询订单列表列表
     */
    @RequiresPermissions("system:sysOrder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysOrder sysOrder) {
        startPage();
        List<SysOrder> list = sysOrderService.selectSysOrderList(sysOrder);
        return getDataTable(list);
    }


    /**
     * 导出订单列表列表
     */
    @RequiresPermissions("system:sysOrder:export")
    @Log(title = "订单列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysOrder sysOrder) {
        List<SysOrder> list = sysOrderService.selectSysOrderList(sysOrder);
        ExcelUtil<SysOrder> util = new ExcelUtil<>(SysOrder.class);
        return util.exportExcel(list, "sysOrder");
    }

    /**
     * 新增订单列表
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存订单列表
     */
    @RequiresPermissions("system:sysOrder:add")
    @Log(title = "订单列表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysOrder sysOrder) {
        return toAjax(sysOrderService.insertSysOrder(sysOrder));
    }

    /**
     * 修改订单列表
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        SysOrder sysOrder = sysOrderService.selectSysOrderById(id);
        mmap.put("sysOrder", sysOrder);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单列表
     */
    @RequiresPermissions("system:sysOrder:edit")
    @Log(title = "订单列表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysOrder sysOrder) {
        return toAjax(sysOrderService.updateSysOrder(sysOrder));
    }

    /**
     * 删除订单列表
     */
    @RequiresPermissions("system:sysOrder:remove")
    @Log(title = "订单列表", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(sysOrderService.deleteSysOrderByIds(ids));
    }
}
