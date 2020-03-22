package com.ruoyi.web.controller.system;

import com.alibaba.dubbo.common.URL;
import com.google.common.base.Splitter;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.sms.facade.api.IShipinService;
import com.ruoyi.sms.facade.dto.ShipinDTO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;


/**
 * 公共片库Controller
 *
 * @author ruoyi
 * @date 2020-03-17
 */
@Controller
@RequestMapping("/system/shipin")
public class ShipinController extends BaseController {
    private String prefix = "system/shipin";

    @Autowired
    private IShipinService shipinService;

    @RequiresPermissions("system:shipin:view")
    @GetMapping()
    public String shipin() {
        return prefix + "/shipin";
    }

    /**
     * 查询公共片库列表
     */
    @RequiresPermissions("system:shipin:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ShipinDTO shipin) {
        startPage();
        List<ShipinDTO> list = shipinService.selectShipinDTOList(shipin);
        return getDataTable(list);
    }

    /**
     * 导出公共片库列表
     */
    @RequiresPermissions("system:shipin:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ShipinDTO shipin) {
        List<ShipinDTO> list = shipinService.selectShipinDTOList(shipin);
        ExcelUtil<ShipinDTO> util = new ExcelUtil<>(ShipinDTO.class);
        return util.exportExcel(list, "shipin");
    }

    /**
     * 新增公共片库
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    @Autowired
    RestTemplate restTemplate;

    /**
     * 新增保存公共片库
     */
    @RequiresPermissions("system:shipin:add")
    @Log(title = "公共片库", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ShipinDTO shipin) {

        // TODO: 2020/3/18 推广链接 userId
        String data = URL.encode("www.baidu.com");
        String str = "http://mrw.so/api.htm?format=json&url=" + data + "&key=5e6ef6a244bb353b0f889030@54f90da6926dac28c12d0e31fdf820fc";
        LinkedHashMap forObject = restTemplate.getForObject(str, LinkedHashMap.class);
        if (forObject == null) {
            return AjaxResult.error("短链接转换失败");
        }
        Object url = forObject.get("url");
        if (url != null && StringUtil.isNotBlank(url.toString())) {
            shipin.setShorturl(url.toString());
        } else {
            return AjaxResult.error("短链接转换失败");
        }

        String loginName = ShiroUtils.getLoginName();
        shipin.setUserid(loginName);
        shipin.setMoney(shipin.getStartMoney() + "-" + shipin.getEndMoney());
        shipin.setClick(0);
        shipin.setZykey(shipin.getShiUrl());
        shipin.setCreateTime(new Date());
        return toAjax(shipinService.insertShipinDTO(shipin));
    }


    /**
     * 修改公共片库
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        ShipinDTO shipin = shipinService.selectShipinDTOById(id);
        mmap.put("shipin", shipin);
        return prefix + "/edit";
    }

    /**
     * 修改保存公共片库
     */
    @RequiresPermissions("system:shipin:edit")
    @Log(title = "公共片库", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ShipinDTO shipin) {
        return toAjax(shipinService.updateShipinDTO(shipin));
    }

    /**
     * 删除公共片库
     */
    @RequiresPermissions("system:shipin:remove")
    @Log(title = "公共片库", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        if (ids.contains(",")) {
            Iterable<String> split = Splitter.on(',')
                    .trimResults()
                    .omitEmptyStrings().split(ids);
            for (String s : split) {
                if (xxx(s)) {
                    return error("只能删除自己发布的视频");
                }
            }
        } else {
            if (xxx(ids)) {
                return error("只能删除自己发布的视频");
            }
        }
        return toAjax(shipinService.deleteShipinDTOByIds(ids));
    }

    private boolean xxx(String s) {
        ShipinDTO item = new ShipinDTO();
        item.setId(Integer.parseInt(s));
        item.setUserid(ShiroUtils.getLoginName());
        int count = shipinService.count(item);
        return count == 0;
    }
}
