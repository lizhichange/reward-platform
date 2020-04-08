package com.ruoyi.web.controller.system;

import com.google.common.base.Splitter;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.sms.domain.Shipin;
import com.ruoyi.sms.facade.IShipinFacade;
import com.ruoyi.sms.facade.dto.ShipinDTO;
import com.ruoyi.sms.facade.dto.SysCategoryDTO;
import com.ruoyi.sms.service.IShipinService;
import com.ruoyi.system.domain.SysCategory;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.ISysCategoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.Date;
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
    private IShipinFacade shipinFacade;
    @Autowired

    IShipinService shipinService;


    @Autowired
    ISysCategoryService sysCategoryService;

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
    public TableDataInfo list(Shipin shipin) {
        startPage();
        List<Shipin> list = shipinService.selectShipinList(shipin);
        return getDataTable(list);
    }

    /**
     * 导出公共片库列表
     */
    @RequiresPermissions("system:shipin:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Shipin shipin) {
        List<Shipin> list = shipinService.selectShipinList(shipin);
        ExcelUtil<Shipin> util = new ExcelUtil<>(Shipin.class);
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
        String loginName = ShiroUtils.getLoginName();
        shipin.setUserid(loginName);
        shipin.setClick(0);
        shipin.setCreateTime(new Date());
        shipin.setMoney(shipin.getStartMoney() + "-" + shipin.getEndMoney());
        return toAjax(shipinFacade.insertShipinDTO(shipin));
    }


    /**
     * 修改公共片库
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        ShipinDTO shipin = shipinFacade.selectShipinDTOById(id);
        String money = shipin.getMoney();
        String[] split = money.split("-");
        shipin.setStartMoney(split[0]);
        shipin.setEndMoney(split[1]);
        mmap.put("shipin", shipin);
        Integer categoryId = shipin.getCategoryId();
        SysCategory sysCategory = sysCategoryService.selectDeptById(categoryId.longValue());
        SysCategoryDTO categoryDTO = new SysCategoryDTO();
        BeanUtils.copyProperties(sysCategory, categoryDTO);
        shipin.setCategory(categoryDTO);

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
        shipin.setMoney(shipin.getStartMoney() + "-" + shipin.getEndMoney());
        return toAjax(shipinFacade.updateShipinDTO(shipin));
    }

    /**
     * 删除公共片库
     */
    @RequiresPermissions("system:shipin:remove")
    @Log(title = "公共片库", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        SysUser sysUser = ShiroUtils.getSysUser();
        List<SysRole> roles = sysUser.getRoles();
        SysRole sysRole = roles.get(0);
        //如果是管理员。直接删除
        if (sysRole.getRoleKey().equals("admin")) {
            return toAjax(shipinFacade.deleteShipinDTOByIds(ids));
        }


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
        return toAjax(shipinFacade.deleteShipinDTOByIds(ids));
    }

    private boolean xxx(String s) {
        ShipinDTO item = new ShipinDTO();
        item.setId(Integer.parseInt(s));
        item.setUserid(ShiroUtils.getLoginName());
        int count = shipinFacade.count(item);
        return count == 0;
    }
}
