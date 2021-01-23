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
import com.ruoyi.reward.facade.enums.InvitationStatusEnum;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.domain.Invitation;
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
    InvitationService invitationService;


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
    public TableDataInfo list(Invitation invitation) {
        startPage();
        startOrderBy();
        //如果是不管理员
        if (!"admin".equals(ShiroUtils.getLoginName())) {
            invitation.setUserIdList(Lists.newArrayList(ShiroUtils.getLoginName()));
        }
        List<Invitation> list = invitationService.selectInvitationList(invitation);
        for (Invitation item : list) {
            item.setZtDesc(EnumUtil.queryByCode(item.getStatus(), InvitationStatusEnum.class).getDesc());
        }
        return getDataTable(list);
    }

    /**
     * 导出邀请码管理列表
     */
    @RequiresPermissions("system:invitation:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Invitation invitation) {
        List<Invitation> list = invitationService.selectInvitationList(invitation);
        ExcelUtil<Invitation> util = new ExcelUtil<>(Invitation.class);
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
    public AjaxResult addSave(Invitation invitation) {
        //未使用默认
        if (StringUtil.isBlank(invitation.getInvitation())) {
            return AjaxResult.error("邀请码不能为空");
        }

        List<Invitation> list = invitationService.selectInvitationList(invitation);
        if (!CollectionUtils.isEmpty(list)) {
            return AjaxResult.error("邀请码邀请码已存在");
        }
        String username = invitation.getUserId();
        SysUser user = iSysUserService.selectUserByLoginName(username);
        if (user == null) {
            return AjaxResult.error("邀请人账号信息不存在");
        }
        invitation.setStatus(InvitationStatusEnum.N.getCode());
        invitation.setDuration(DateUtils.formatNewFormat(new Date()));
        return toAjax(invitationService.insertInvitation(invitation));
    }

    /**
     * 修改邀请码管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        Invitation invitation = invitationService.selectInvitationById(id);
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
    public AjaxResult editSave(Invitation invitation) {
        return toAjax(invitationService.updateInvitation(invitation));
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
                Invitation item = new Invitation();
                item.setId(Long.parseLong(str));
                item.setUserId(ShiroUtils.getLoginName());
                List<Invitation> xxx = invitationService.selectInvitationList(item);
                if (xxx.size() == 0) {
                    return error("只能删除自己添加的邀请码");
                } else {
                    for (Invitation dto : xxx) {
                        if (dto.getStatus().equals(InvitationStatusEnum.Y.getCode())) {
                            return error("邀请码已经被其他用户使用不能删除");
                        }
                    }
                }
            }
        } else {
            Invitation item = new Invitation();
            item.setId(Long.parseLong(ids));
            item.setUserId(ShiroUtils.getLoginName());
            List<Invitation> xxx = invitationService.selectInvitationList(item);
            if (xxx.size() == 0) {
                return error("只能删除自己添加的邀请码");
            } else {
                for (Invitation dto : xxx) {
                    if (dto.getStatus().equals(InvitationStatusEnum.Y.getCode())) {
                        return error("邀请码已经被其他用户使用不能删除");
                    }
                }
            }
        }
        return toAjax(invitationService.deleteInvitationByIds(ids));
    }


}
