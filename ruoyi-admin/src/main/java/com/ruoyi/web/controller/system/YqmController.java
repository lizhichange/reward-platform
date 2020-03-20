package com.ruoyi.web.controller.system;

import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.sms.facade.api.IYqmService;
import com.ruoyi.sms.facade.dto.YqmDTO;
import com.ruoyi.sms.facade.enums.YqmStatusEnum;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.web.vo.YqmVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;


/**
 * 邀请码管理Controller
 *
 * @author ruoyi
 * @date 2020-03-17
 */
@Controller
@RequestMapping("/system/yqm")
public class YqmController extends BaseController {
    private String prefix = "system/yqm";

    @Autowired
    private IYqmService yqmService;


    @Autowired
    ISysUserService iSysUserService;

    @RequiresPermissions("system:yqm:view")
    @GetMapping()
    public String yqm() {
        return prefix + "/yqm";
    }

    /**
     * 查询邀请码管理列表
     */
    @RequiresPermissions("system:yqm:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(YqmDTO yqm) {
        startPage();
        yqm.setUserid(ShiroUtils.getLoginName());
        List<YqmDTO> list = yqmService.selectYqmList(yqm);
        List<YqmVO> collect = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(list)) {
            collect = list.stream().map(ie -> {
                YqmVO vo = new YqmVO();
                BeanUtils.copyProperties(ie, vo);
                if (StringUtil.isNotBlank(vo.getZt())) {
                    vo.setZtDesc(EnumUtil.queryByCode(vo.getZt(), YqmStatusEnum.class).getDesc());
                }
                return vo;
            }).collect(Collectors.toList());
        }
        return getDataTable(collect);
    }

    /**
     * 导出邀请码管理列表
     */
    @RequiresPermissions("system:yqm:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(YqmDTO yqm) {
        List<YqmDTO> list = yqmService.selectYqmList(yqm);
        ExcelUtil<YqmDTO> util = new ExcelUtil<YqmDTO>(YqmDTO.class);
        return util.exportExcel(list, "yqm");
    }

    /**
     * 新增邀请码管理
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存邀请码管理
     */
    @RequiresPermissions("system:yqm:add")
    @Log(title = "邀请码管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(YqmDTO yqm) {
        //未使用默认
        if (StringUtil.isBlank(yqm.getYqm())) {
            return AjaxResult.error("邀请码不能为空");
        }
        YqmDTO tar = new YqmDTO();
        tar.setYqm(yqm.getYqm());
        List<YqmDTO> list = yqmService.selectYqmList(tar);
        if (!CollectionUtils.isEmpty(list)) {
            return AjaxResult.error("邀请码邀请码已存在");
        }
        String username = yqm.getUserid();
        SysUser user = iSysUserService.selectUserByLoginName(username);
        if (user == null) {
            return AjaxResult.error("邀请人账号信息不存在");
        }
        yqm.setZt(YqmStatusEnum.N.getCode());
        yqm.setShijian(DateUtils.formatNewFormat(new Date()));
        return toAjax(yqmService.insertYqm(yqm));
    }

    /**
     * 修改邀请码管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        YqmDTO yqm = yqmService.selectYqmById(id);
        mmap.put("yqm", yqm);
        return prefix + "/edit";
    }

    /**
     * 修改保存邀请码管理
     */
    @RequiresPermissions("system:yqm:edit")
    @Log(title = "邀请码管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(YqmDTO yqm) {
        return toAjax(yqmService.updateYqm(yqm));
    }

    /**
     * 删除邀请码管理
     */
    @RequiresPermissions("system:yqm:remove")
    @Log(title = "邀请码管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(yqmService.deleteYqmByIds(ids));
    }
}
