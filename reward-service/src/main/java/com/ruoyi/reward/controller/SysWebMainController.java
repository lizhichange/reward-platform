package com.ruoyi.reward.controller;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.reward.client.WxMpShortUrlFacadeClient;
import com.ruoyi.reward.domain.SysWebMain;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import com.ruoyi.reward.service.SysWebMainService;
import lombok.Data;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.model.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 域名管理Controller
 *
 * @author ruoyi
 * @date 2020-03-23
 */
@Controller
@RequestMapping("/system/webmain")
public class SysWebMainController extends BaseController {
    private String prefix = "system/webmain";

    @Autowired
    private SysWebMainService sysWebMainService;

    @Autowired
    WxMpShortUrlFacadeClient wxMpShortUrlFacadeClient;

    @RequiresPermissions("system:webmain:view")
    @GetMapping()
    public String webmain() {
        return prefix + "/webmain";
    }

    /**
     * 查询域名管理列表
     */
    @RequiresPermissions("system:webmain:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysWebMain sysWebMain) {
        startPage();
        List<SysWebMain> list = sysWebMainService.selectSysWebMainList(sysWebMain);
        return getDataTable(list);
    }

    /**
     * 域名状态修改
     */
    @RequiresPermissions("system:webmain:edit")
    @PostMapping("/changeStatus")
    @ResponseBody
    public AjaxResult changeStatus(SysWebMain sysWebMain) {
        return toAjax(sysWebMainService.updateSysWebMain(sysWebMain));
    }

    /**
     * 域名状态检测
     */

    @PostMapping("/checkStatus")
    @ResponseBody
    public AjaxResult checkStatus(SysWebMain sysWebMain) {
        Long webMainId = sysWebMain.getId();
        SysWebMain main = sysWebMainService.selectSysWebMainById(webMainId);
        String check = wxMpShortUrlFacadeClient.check(main.getMainUrl());
        CheckResponse parse = JSONObject.parseObject(check, CheckResponse.class);
        logger.info("parse:{}", parse);

        return toAjax(1);
    }

    @Data
    public static class CheckResponse extends ToString {

        private static final long serialVersionUID = -9112489328957184263L;
        /**
         * msg : 已停止访问该网页
         * code : 01
         * desc : 据用户投诉及腾讯安全网址安全中心检测，该网页包含不安全内容。为维护绿色上网环境，已停止访问。
         */

        private String msg;
        private String code;
        private String desc;

        public String getMsg() {
            return msg;
        }

        public void setMsg(String msg) {
            this.msg = msg;
        }

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }

        public String getDesc() {
            return desc;
        }

        public void setDesc(String desc) {
            this.desc = desc;
        }

    }

    /**
     * 导出域名管理列表
     */
    @RequiresPermissions("system:webmain:export")
    @Log(title = "域名管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysWebMain sysWebMain) {
        List<SysWebMain> list = sysWebMainService.selectSysWebMainList(sysWebMain);
        ExcelUtil<SysWebMain> util = new ExcelUtil<SysWebMain>(SysWebMain.class);
        return util.exportExcel(list, "webmain");
    }

    /**
     * 新增域名管理
     */
    @GetMapping("/add")
    public String add() {


        return prefix + "/add";
    }

    /**
     * 新增保存域名管理
     */
    @RequiresPermissions("system:webmain:add")
    @Log(title = "域名管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysWebMain sysWebMain) {
        if (StringUtil.isNotBlank(sysWebMain.getMainStatus())
                && "on".equals(sysWebMain.getMainStatus())) {
            sysWebMain.setMainStatus("0");
        }
        return toAjax(sysWebMainService.insertSysWebMain(sysWebMain));
    }

    /**
     * 修改域名管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        SysWebMain sysWebMain = sysWebMainService.selectSysWebMainById(id);
        mmap.put("sysWebMain", sysWebMain);
        return prefix + "/edit";
    }

    /**
     * 修改保存域名管理
     */
    @RequiresPermissions("system:webmain:edit")
    @Log(title = "域名管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysWebMain sysWebMain) {
        return toAjax(sysWebMainService.updateSysWebMain(sysWebMain));
    }

    /**
     * 删除域名管理
     */
    @RequiresPermissions("system:webmain:remove")
    @Log(title = "域名管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(sysWebMainService.deleteSysWebMainByIds(ids));
    }
}
