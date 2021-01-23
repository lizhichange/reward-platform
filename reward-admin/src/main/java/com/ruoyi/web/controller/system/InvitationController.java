package com.ruoyi.web.controller.system;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.reward.facade.enums.YqmStatusEnum;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.domain.Yqm;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.service.InvitationService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;


/**
 * 邀请码管理Controller
 *
 * @author ruoyi
 * @date 2020-03-17
 */
@Controller
@RequestMapping("/system/invitation")
public class InvitationController extends BaseController {
    private String prefix = "system/invitation";

    @Autowired
    private InvitationService yqmService;


    @Autowired
    ISysUserService iSysUserService;

    @RequiresPermissions("system:invitation:view")
    @GetMapping()
    public String invitation() {
        return prefix + "/invitation";
    }

    /**
     * 查询邀请码管理列表
     */
    @RequiresPermissions("system:invitation:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Yqm invitation) {
        startPage();
        startOrderBy();
        //如果是不管理员
        if (!"admin".equals(ShiroUtils.getLoginName())) {
            invitation.setUserIdList(Lists.newArrayList(ShiroUtils.getLoginName()));
        }
        List<Yqm> list = yqmService.selectYqmList(invitation);
        for (Yqm item : list) {
            item.setZtDesc(EnumUtil.queryByCode(item.getStatus(), YqmStatusEnum.class).getDesc());
        }
        return getDataTable(list);
    }

    /**
     * 导出邀请码管理列表
     */
    @RequiresPermissions("system:invitation:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Yqm invitation) {
        List<Yqm> list = yqmService.selectYqmList(invitation);
        ExcelUtil<Yqm> util = new ExcelUtil<Yqm>(Yqm.class);
        return util.exportExcel(list, "invitation");
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
    @RequiresPermissions("system:invitation:add")
    @Log(title = "邀请码管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Yqm invitation) {
        //未使用默认
        if (StringUtil.isBlank(invitation.getYqm())) {
            return AjaxResult.error("邀请码不能为空");
        }

        List<Yqm> list = yqmService.selectYqmList(invitation);
        if (!CollectionUtils.isEmpty(list)) {
            return AjaxResult.error("邀请码邀请码已存在");
        }
        String username = invitation.getUserId();
        SysUser user = iSysUserService.selectUserByLoginName(username);
        if (user == null) {
            return AjaxResult.error("邀请人账号信息不存在");
        }
        invitation.setStatus(YqmStatusEnum.N.getCode());
        invitation.setDuration(DateUtils.formatNewFormat(new Date()));
        return toAjax(yqmService.insertYqm(invitation));
    }

    /**
     * 修改邀请码管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        Yqm invitation = yqmService.selectYqmById(id);
        mmap.put("invitation", invitation);
        return prefix + "/edit";
    }

    /**
     * 修改保存邀请码管理
     */
    @RequiresPermissions("system:invitation:edit")
    @Log(title = "邀请码管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Yqm invitation) {
        return toAjax(yqmService.updateYqm(invitation));
    }

    /**
     * 删除邀请码管理
     */
    @RequiresPermissions("system:invitation:remove")
    @Log(title = "邀请码管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        if (ids.contains(",")) {
            Iterable<String> split = Splitter.on(',')
                    .trimResults()
                    .omitEmptyStrings().split(ids);
            for (String str : split) {
                Yqm item = new Yqm();
                item.setId(Long.parseLong(str));
                item.setUserId(ShiroUtils.getLoginName());
                List<Yqm> xxx = yqmService.selectYqmList(item);
                if (xxx.size() == 0) {
                    return error("只能删除自己添加的邀请码");
                } else {
                    for (Yqm dto : xxx) {
                        if (dto.getStatus().equals(YqmStatusEnum.Y.getCode())) {
                            return error("邀请码已经被其他用户使用不能删除");
                        }
                    }
                }
            }
        } else {
            Yqm item = new Yqm();
            item.setId(Long.parseLong(ids));
            item.setUserId(ShiroUtils.getLoginName());
            List<Yqm> xxx = yqmService.selectYqmList(item);
            if (xxx.size() == 0) {
                return error("只能删除自己添加的邀请码");
            } else {
                for (Yqm dto : xxx) {
                    if (dto.getStatus().equals(YqmStatusEnum.Y.getCode())) {
                        return error("邀请码已经被其他用户使用不能删除");
                    }
                }
            }
        }
        return toAjax(yqmService.deleteYqmByIds(ids));
    }


}
