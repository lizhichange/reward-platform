package com.ruoyi.reward.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.reward.domain.VideoRelPrice;
import com.ruoyi.reward.service.VideoRelPriceService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 发布价格Controller
 *
 * @author ruoyi
 * @date 2021-02-12
 */
@Controller
@RequestMapping("/system/price")
public class VideoRelPriceController extends BaseController {
    private String prefix = "system/price";

    @Autowired
    private VideoRelPriceService videoRelPriceService;

    @RequiresPermissions("system:price:view")
    @GetMapping()
    public String price() {
        return prefix + "/price";
    }

    /**
     * 查询发布价格列表
     */
    @RequiresPermissions("system:price:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(VideoRelPrice videoRelPrice) {
        startPage();
        List<VideoRelPrice> list = videoRelPriceService.selectVideoRelPriceList(videoRelPrice);
        return getDataTable(list);
    }

    /**
     * 导出发布价格列表
     */
    @RequiresPermissions("system:price:export")
    @Log(title = "发布价格", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(VideoRelPrice videoRelPrice) {
        List<VideoRelPrice> list = videoRelPriceService.selectVideoRelPriceList(videoRelPrice);
        ExcelUtil<VideoRelPrice> util = new ExcelUtil<VideoRelPrice>(VideoRelPrice.class);
        return util.exportExcel(list, "price");
    }

    /**
     * 新增发布价格
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存发布价格
     */
    @RequiresPermissions("system:price:add")
    @Log(title = "发布价格", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(VideoRelPrice videoRelPrice) {
        return toAjax(videoRelPriceService.insertVideoRelPrice(videoRelPrice));
    }

    /**
     * 修改发布价格
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        VideoRelPrice videoRelPrice = videoRelPriceService.selectVideoRelPriceById(id);
        mmap.put("videoRelPrice", videoRelPrice);
        return prefix + "/edit";
    }

    /**
     * 修改保存发布价格
     */
    @RequiresPermissions("system:price:edit")
    @Log(title = "发布价格", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(VideoRelPrice videoRelPrice) {
        return toAjax(videoRelPriceService.updateVideoRelPrice(videoRelPrice));
    }

    /**
     * 删除发布价格
     */
    @RequiresPermissions("system:price:remove")
    @Log(title = "发布价格", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(videoRelPriceService.deleteVideoRelPriceByIds(ids));
    }
}
