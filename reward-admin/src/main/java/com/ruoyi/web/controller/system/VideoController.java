package com.ruoyi.web.controller.system;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.SysCategory;
import com.ruoyi.reward.facade.api.VideoFacade;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.reward.service.VideoService;
import com.ruoyi.reward.service.SysCategoryService;
import com.ruoyi.system.domain.ExtSysOrder;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysOrderService;
import com.ruoyi.web.param.PriceParam;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


/**
 * 公共片库Controller
 *
 * @author ruoyi
 * @date 2020-03-17
 */
@Controller
@RequestMapping("/system/shipin")
public class VideoController extends BaseController {
    private final String prefix = "system/shipin";

    @Autowired
    VideoFacade videoFacade;
    @Autowired
    VideoService videoService;


    @Autowired
    SysCategoryService sysCategoryService;

    @Autowired
    ISysOrderService sysOrderService;

    @RequiresPermissions("system:shipin:view")
    @GetMapping()
    public String shipin() {
        return prefix + "/shipin";
    }

    /**
     * 私人片库
     *
     * @return
     */
    @GetMapping("/pshipin")
    public String pshipin() {
        return prefix + "/pshipin";
    }


    /**
     * 查询公共片库列表
     */
    @RequiresPermissions("system:shipin:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Video shipin) {
        startPage();
        boolean b = !"admin".equals(ShiroUtils.getLoginName());
        if (b) {
            shipin.setUserIdList(Lists.newArrayList("admin", ShiroUtils.getLoginName()));
        }
        List<Video> list = videoService.selectVideoList(shipin);
        if (!CollectionUtils.isEmpty(list)) {

            String main = null;
            List<PriceParam> itemList = null;
            SysConfig sysConfig = sysConfigService.queryConfigByKey(ShiroUtils.getLoginName());
            if (sysConfig != null && StringUtils.isNotBlank(sysConfig.getConfigValue())) {
                Map valueMap = JSONObject.parseObject(sysConfig.getConfigValue(), Map.class);
                if (valueMap.containsKey("main")) {
                    main = valueMap.get("main").toString();
                }
                if (valueMap.containsKey("item")) {
                    JSONArray array = (JSONArray) valueMap.get("item");
                    itemList = convert(array);
                }
            }
            for (Video item : list) {

                SysCategory sysCategory = sysCategoryService.selectDeptById(item.getCategoryId().longValue());
                if (sysCategory != null) {
                    item.setCategoryName(sysCategory.getCategoryName());
                }


                ExtSysOrder extSysOrder = new ExtSysOrder();
                extSysOrder.setGoodsId(item.getId());
                extSysOrder.setStatus(Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
                if (b) {
                    extSysOrder.setExtensionUserId(ShiroUtils.getLoginName());
                }
                long count = sysOrderService.countByExample(extSysOrder);
                item.setCs(String.valueOf(count));
                if (!CollectionUtils.isEmpty(itemList)) {
                    List<PriceParam> collect = itemList.stream().filter(param -> {
                        String id = param.getId();
                        return StringUtil.equals(id, item.getId().toString());
                    }).collect(Collectors.toList());
                    if (!CollectionUtils.isEmpty(collect)) {
                        PriceParam priceParam = collect.get(0);
                        item.setPrivateMoney(priceParam.getPrice());
                    } else {
                        if (StringUtils.isNotBlank(main)) {
                            item.setPrivateMoney(main);
                        } else {
                            item.setPrivateMoney(item.getMoney());
                        }
                    }
                } else {
                    if (StringUtils.isNotBlank(main)) {
                        item.setPrivateMoney(main);
                    } else {
                        item.setPrivateMoney(item.getMoney());
                    }
                }
            }
        }

        return getDataTable(list);
    }

    /**
     * 导出公共片库列表
     */
    @RequiresPermissions("system:shipin:export")
    @PostMapping("/export")
    @RequiresRoles("admin")
    @ResponseBody
    public AjaxResult export(Video shipin) {
        List<Video> list = videoService.selectVideoList(shipin);
        ExcelUtil<Video> util = new ExcelUtil<>(Video.class);
        return util.exportExcel(list, "shipin");
    }

    /**
     * 新增公共片库
     */
    @GetMapping("/add")
    @RequiresPermissions("system:shipin:add")
    @RequiresRoles("admin")
    public String add() {
        return prefix + "/add";
    }

    @Autowired
    RestTemplate restTemplate;

    /**
     * 新增保存公共片库
     */
    @RequiresPermissions("system:shipin:add")
    @RequiresRoles("admin")
    @Log(title = "公共片库", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(VideoDTO shipin) {
        String loginName = ShiroUtils.getLoginName();
        shipin.setUserId(loginName);
        shipin.setClick(0);
        shipin.setCreateTime(new Date());
        shipin.setMoney(shipin.getStartMoney() + "-" + shipin.getEndMoney());
        return toAjax(videoFacade.insertVideoDTO(shipin));
    }

    @Autowired
    ISysConfigService sysConfigService;


    @Log(title = "批量发布价格", businessType = BusinessType.INSERT)
    @PostMapping("/batchForceLogout")
    @ResponseBody
    public AjaxResult batchForceLogout(PriceParam param, @RequestParam("ids[]") String[] ids) {
        logger.info("param:{},ids:{}", param, ids);
        String loginName = ShiroUtils.getLoginName();
        SysConfig item = sysConfigService.queryConfigByKey(loginName);
        if (item == null) {
            SysConfig config = new SysConfig();
            config.setConfigKey(loginName);
            Map<String, Object> map = Maps.newHashMap();
            map.put("main", param.getPrice());
            config.setConfigValue(JSONObject.toJSONString(map));
            config.setConfigType("N");
            config.setCreateBy(loginName);
            config.setConfigName("视频自定义私人价格");
            config.setCreateTime(new Date());
            return toAjax(sysConfigService.insertConfig(config));
        } else {
            Long configId = item.getConfigId();
            SysConfig config = new SysConfig();
            config.setConfigId(configId);
            String configValue = item.getConfigValue();
            if (StringUtils.isNotBlank(configValue)) {
                String string = getString(param, ids, configValue);
                config.setConfigValue(string);
            }
            config.setUpdateTime(new Date());
            return toAjax(sysConfigService.updateConfig(config));

        }

    }

    @Deprecated
    private String getString(PriceParam param, @RequestParam("ids[]") String[] ids, String configValue) {
        Map valueMap = JSONObject.parseObject(configValue, Map.class);
        ArrayList<PriceParam> newArrayList = Lists.newArrayList();
        if (valueMap.containsKey("item")) {
            JSONArray array = (JSONArray) valueMap.get("item");
            List<PriceParam> itemList = convert(array);
            if (!ArrayUtils.isEmpty(ids)) {
                for (String id : ids) {
                    List<PriceParam> collect = itemList.stream().filter(it -> it.getId().equals(id)).collect(Collectors.toList());
                    //不为空
                    if (!CollectionUtils.isEmpty(collect)) {
                        PriceParam priceParam = collect.get(0);
                        //modify
                        priceParam.setPrice(param.getPrice());
                        newArrayList.add(priceParam);
                        //原集合remove
                        itemList.remove(priceParam);
                    } else {
                        //add
                        PriceParam priceParam = new PriceParam();
                        priceParam.setPrice(param.getPrice());
                        priceParam.setId(id);
                        newArrayList.add(priceParam);
                    }
                }
                newArrayList.addAll(itemList);
                valueMap.put("item", newArrayList);
            }
        } else {
            if (!ArrayUtils.isEmpty(ids)) {
                for (String id : ids) {
                    PriceParam priceParam = new PriceParam();
                    priceParam.setPrice(param.getPrice());
                    priceParam.setId(id);
                    newArrayList.add(priceParam);
                }
            }
            valueMap.put("item", newArrayList);
        }
        return JSONArray.toJSONString(valueMap);
    }

    @Log(title = "一键发布价格", businessType = BusinessType.INSERT)
    @PostMapping("/price")
    @ResponseBody
    public AjaxResult price(PriceParam param) {
        String loginName = ShiroUtils.getLoginName();
        SysConfig item = sysConfigService.queryConfigByKey(loginName);
        if (item == null) {
            SysConfig config = new SysConfig();
            config.setConfigKey(loginName);
            Map<String, Object> map = Maps.newHashMap();
            map.put("main", param.getPrice());
            config.setConfigValue(JSONObject.toJSONString(map));
            config.setConfigType("N");
            config.setCreateBy(loginName);
            config.setConfigName("视频自定义私人价格");
            config.setCreateTime(new Date());
            return toAjax(sysConfigService.insertConfig(config));
        } else {
            Long configId = item.getConfigId();
            SysConfig config = new SysConfig();
            config.setConfigId(configId);
            Map<String, Object> map = Maps.newHashMap();
            map.put("main", param.getPrice());

            config.setConfigValue(JSONArray.toJSONString(map));
            config.setUpdateTime(new Date());
            return toAjax(sysConfigService.updateConfig(config));
        }
    }

    private String getString(Map<String, Object> map, String configValue) {
        if (StringUtils.isNotBlank(configValue)) {
            Map<String, Object> valueMap = JSONObject.parseObject(configValue, Map.class);
            if (valueMap.containsKey("item")) {
                List<PriceParam> itemList = (List<PriceParam>) valueMap.get("item");
                map.put("item", itemList);
            }
        }
        return JSONArray.toJSONString(map);
    }


    /**
     * 修改公共片库
     */
    @GetMapping("/edit/{id}")
    @RequiresRoles("admin")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        VideoDTO shipin = videoFacade.selectVideoDTOById(id);
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
    @RequiresRoles("admin")
    @Log(title = "公共片库", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(VideoDTO shipin) {
        shipin.setMoney(shipin.getStartMoney() + "-" + shipin.getEndMoney());
        return toAjax(videoFacade.updateVideoDTO(shipin));
    }


    /**
     * 删除公共片库
     */
    @RequiresPermissions("system:shipin:remove")
    @RequiresRoles("admin")
    @Log(title = "公共片库", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {


        SysUser sysUser = ShiroUtils.getSysUser();
        List<SysRole> roles = sysUser.getRoles();
        SysRole sysRole = roles.get(0);
        //如果是管理员。直接删除
        if ("admin".equals(sysRole.getRoleKey())) {
            return toAjax(videoFacade.deleteVideoDTOByIds(ids));
        }

        if (ids.contains(",")) {
            Iterable<String> split = Splitter.on(',')
                    .trimResults()
                    .omitEmptyStrings().split(ids);
            for (String s : split) {
                if (!xxx(s)) {
                    return error("只能删除自己发布的视频");
                }
                if (!checkOrder(s)) {
                    return error("发布的视频已关联订单");
                }
            }
        } else {
            if (!xxx(ids)) {
                return error("只能删除自己发布的视频");
            }
            if (!checkOrder(ids)) {
                return error("发布的视频已关联订单");
            }
        }
        return toAjax(videoFacade.deleteVideoDTOByIds(ids));
    }

    private boolean xxx(String s) {
        VideoDTO item = new VideoDTO();
        int id = Integer.parseInt(s);
        item.setId(id);
        item.setUserId(ShiroUtils.getLoginName());
        int count = videoFacade.count(item);
        return count == 0;
    }

    private boolean checkOrder(String s) {
        int id = Integer.parseInt(s);
        ExtSysOrder sysOrder = new ExtSysOrder();
        sysOrder.setGoodsId(id);
        long count = sysOrderService.countByExample(sysOrder);
        return count == 0;

    }

    List<PriceParam> convert(JSONArray array) {
        ArrayList<PriceParam> objects = Lists.newArrayList();
        for (Object ite : array) {
            JSONObject a = (JSONObject) ite;
            String price = a.getString("price");
            String id = a.getString("id");
            PriceParam priceParam = new PriceParam();
            priceParam.setId(id);
            priceParam.setPrice(price);
            objects.add(priceParam);
        }
        return objects;
    }

}
