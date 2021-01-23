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
import com.ruoyi.reward.domain.SysCategory;
import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.facade.api.VideoFacade;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.reward.service.SysCategoryService;
import com.ruoyi.reward.service.VideoService;
import com.ruoyi.system.domain.ExtSysOrder;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysOrderService;
import com.ruoyi.web.model.JiaLiApiResult;
import com.ruoyi.web.model.JiaLiDetailApiResult;
import com.ruoyi.web.param.PriceParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.net.HttpURLConnection;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.*;
import java.util.stream.Collectors;


/**
 * 公共片库Controller
 *
 * @author ruoyi
 * @date 2020-03-17
 */
@Controller
@Api("视频信息管理")
@RequestMapping("/system/video")
public class VideoController extends BaseController {
    private final String prefix = "system/video";
    @Autowired
    RestTemplate restTemplate;
    @Autowired
    VideoFacade videoFacade;
    @Autowired
    VideoService videoService;


    @Autowired
    SysCategoryService sysCategoryService;

    @Autowired
    ISysOrderService sysOrderService;

    @RequiresPermissions("system:video:view")
    @GetMapping()
    public String video() {
        return prefix + "/video";
    }

    /**
     * 私人片库
     *
     * @return
     */
    @GetMapping("/pvideo")
    public String pvideo() {
        return prefix + "/pvideo";
    }

    @Log(title = "预览视频", businessType = BusinessType.UPDATE)
    @GetMapping("/preview/{id}")
    public String resetPwd(@PathVariable("id") Long id, ModelMap mmap) {
        mmap.put("video", videoService.selectVideoById(id));
        return prefix + "/preview";
    }

    /**
     * 查询公共片库列表
     */
    @RequiresPermissions("system:video:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Video video) {
        startPage();
        boolean b = !"admin".equals(ShiroUtils.getLoginName());
        if (b) {
            video.setUserIdList(Lists.newArrayList("admin", ShiroUtils.getLoginName()));
        }
        List<Video> list = videoService.selectVideoList(video);
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
    @RequiresPermissions("system:video:export")
    @PostMapping("/export")
    @RequiresRoles("admin")
    @ResponseBody
    public AjaxResult export(Video video) {
        List<Video> list = videoService.selectVideoList(video);
        ExcelUtil<Video> util = new ExcelUtil<>(Video.class);
        return util.exportExcel(list, "video");
    }

    /**
     * 新增公共片库
     */
    @GetMapping("/add")
    @RequiresPermissions("system:video:add")
    @RequiresRoles("admin")
    public String add() {
        return prefix + "/add";
    }


    /**
     * 新增保存公共片库
     */
    @RequiresPermissions("system:video:add")
    @RequiresRoles("admin")
    @Log(title = "公共片库", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(VideoDTO video) {
        String loginName = ShiroUtils.getLoginName();
        video.setUserId(loginName);
        video.setClick(0);
        video.setCreateTime(new Date());
        video.setStatus("0");
        video.setMoney(video.getStartMoney() + "-" + video.getEndMoney());
        return toAjax(videoFacade.insertVideoDTO(video));
    }

    @ApiOperation("pay")
    @ResponseBody
    @PostMapping("/pay")
    public AjaxResult pay() {

        String payUrl = "http://payapi.ttyerh45.cn/game/unifiedorder"; //请求订单地址
        String checkUrl = "http://payapi.ttyerh45.cn/pay/checkTradeNo"; //主动查单地址
        String mchId = "600500053"; //商户ID，后台提取
        String billNo = String.valueOf(System.currentTimeMillis()); //商户订单号
        String totalAmount = String.valueOf(5 * 100); //金额
        String billDesc = "在线充值"; //商品名称
        String way = "wap";//支付模式
        String payment = "wechat"; //微信支付
        String notifyUrl = "23333"; //回调地址
        String returnUrl = "3213123"; //同步跳转
        String attach = "123";
        String accKey = "";//收款账号
        Map<String, String> map = Maps.newHashMap();
        map.put("mchId", mchId);
        map.put("billNo", billNo);
        map.put("totalAmount", totalAmount);
        map.put("billDesc", billDesc);
        map.put("way", way);
        map.put("payment", payment);
        map.put("notifyUrl", notifyUrl);
        map.put("returnUrl", returnUrl);
        map.put("attach", attach);
//        map.put("accKey", accKey);
        String merchantKey = "8387ea13ff584f77cb5309125897a0d047a7e07c38f3ac961c7c98833fe06501";
        String sign = sign(map, merchantKey, true);
        map.put("sign", sign);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String content = JSONObject.toJSONString(map);
        HttpEntity<String> request = new HttpEntity<>(content, headers);
        ResponseEntity<String> postForEntity = restTemplate.postForEntity(payUrl, request, String.class);
        logger.info("postForEntity:{}", postForEntity);

        if (postForEntity.getStatusCode() == HttpStatus.OK) {
            String body = postForEntity.getBody();
            PayResult result = JSONObject.parseObject(body, PayResult.class);
            if (result != null && result.getCode() == 0) {

            }
        }

        return AjaxResult.success();
    }


    String sign(Map<String, String> params, String signKey, Boolean is) {
        SortedMap<String, String> sortedMap = new TreeMap<>(params);
        StringBuilder toSign = new StringBuilder();
        for (String key : sortedMap.keySet()) {
            String value = params.get(key);
            toSign.append(key).append("=").append(value);
            if (is) {
                toSign.append("&");
            }
        }
        toSign.append("key=").append(signKey);
        logger.info("toSign:{}", toSign);
        return DigestUtils.md5Hex(toSign.toString()).toUpperCase();

    }

    @ApiOperation("拉取视频detail")
    @ResponseBody
    @PostMapping("/fetchDetailExt")
    public AjaxResult fetchDetailExt(ModelMap modelMap) {
        RestTemplate client = new RestTemplate(new HttpsClientRequestFactory());
        HttpHeaders headers = new HttpHeaders();
        HttpMethod post = HttpMethod.POST;
        headers.setContentType(MediaType.APPLICATION_JSON);
        MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
        map.add("u_id", "143AB09EDCCFE5C20F18F051C056788A1598881547");
        map.add("category_id", "false");

        map.add("o_user", "61.152.208.146");

        map.add("page", "2");

        map.add("limit", "10");

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map);
        ResponseEntity<String> forEntity = client.getForEntity("http://hj.jiazaihetian.com/api/siyou/apilist.html", String.class, request);
        String body = forEntity.getBody();
        ResultData parse = JSONObject.parseObject(body, ResultData.class);
        if (parse != null) {
            List<ResultData.DataBean> data = parse.getData();
            for (ResultData.DataBean datum : data) {

            }
        }
        return null;
    }

    @ApiOperation("拉取视频detail")
    @ResponseBody
    @PostMapping("/fetchDetail")
    public AjaxResult fetchDetail(ModelMap modelMap) {
        //
        RestTemplate client = new RestTemplate(new HttpsClientRequestFactory());
        ResponseEntity<String> forEntity = client.getForEntity("https://jialiapi.com/api.php/provide/vod/?ac=detail", String.class);
        String body = forEntity.getBody();
        JiaLiDetailApiResult parse = JSONObject.parseObject(body, JiaLiDetailApiResult.class);
        logger.info("parse:{}", parse);
        if (parse != null) {
            List<JiaLiDetailApiResult.ListBean> list = parse.getList();
            if (!CollectionUtils.isEmpty(list)) {
                for (JiaLiDetailApiResult.ListBean listBean : list) {
                    //类目
                    String typeName = listBean.getVod_class();
                    String vodPlayUrl = listBean.getVod_play_url();
                    String vodPic = listBean.getVod_pic();
                    String vodName = listBean.getVod_name();
                    int vodId = listBean.getVod_id();
                    SysCategory nameUnique = sysCategoryService.selectByCategoryName(typeName);
                    //如果存在
                    int pk;
                    if (nameUnique == null) {
                        SysCategory sysCategory = new SysCategory();
                        sysCategory.setParentId(100L);
                        sysCategory.setAncestors("0,100");
                        sysCategory.setCategoryName(typeName);
                        sysCategory.setOrderNum("1");
                        sysCategory.setStatus("0");
                        sysCategory.setDelFlag("0");
                        sysCategory.setCreateBy("admin");
                        sysCategory.setCreateTime(new Date());
                        sysCategory.setUpdateBy("admin");
                        sysCategory.setUpdateTime(new Date());
                        pk = sysCategoryService.insertDept(sysCategory);
                    } else {
                        pk = nameUnique.getCategoryId().intValue();
                    }
                    //如果添加成功
                    if (pk > 0) {
                        Video query = new Video();
                        query.setCs(String.valueOf(vodId));
                        List<Video> videoList = videoService.selectVideoList(query);
                        if (CollectionUtils.isEmpty(videoList)) {
                            Video video = new Video();
                            video.setMoney("2-5");
                            video.setCs(String.valueOf(vodId));
                            video.setUrl(vodPic);
                            video.setUserId("admin");
                            video.setLogo(vodPic);
                            video.setName(vodName);
                            boolean check = vodPlayUrl.contains("$");
                            if (check) {
                                String[] split = vodPlayUrl.split("\\$");
                                video.setVideoUrl(split[1]);
                            } else {
                                video.setVideoUrl(vodPlayUrl);
                            }
                            video.setClick(0);
                            video.setCategoryId(pk);
                            video.setDuration("752");
                            video.setCreateTime(new Date());
                            videoService.insertVideo(video);
                        }
                    }
                }
            }
        }


        return AjaxResult.success(AjaxResult.Type.SUCCESS.name(), parse);
    }

    @ApiOperation("拉取视频")
    @ResponseBody
    @PostMapping("/fetch")
    public AjaxResult fetchVideo(ModelMap modelMap) {
        RestTemplate client = new RestTemplate(new HttpsClientRequestFactory());
        ResponseEntity<String> forEntity = client.getForEntity("https://jialiapi.com/api.php/provide/vod/?ac=list", String.class);
        String body = forEntity.getBody();
        JiaLiApiResult parse = JSONObject.parseObject(body, JiaLiApiResult.class);
        logger.info("parse:{}", parse);
        return AjaxResult.success(AjaxResult.Type.SUCCESS.name(), parse);
    }

    public static class HttpsClientRequestFactory extends SimpleClientHttpRequestFactory {
        @Override
        protected void prepareConnection(HttpURLConnection connection, String httpMethod) {
            try {
                if (!(connection instanceof HttpsURLConnection)) {// http协议
                    //throw new RuntimeException("An instance of HttpsURLConnection is expected");
                    super.prepareConnection(connection, httpMethod);
                }
                if (connection instanceof HttpsURLConnection) {// https协议，修改协议版本
                    SSLContext ctx = SSLContext.getInstance("TLSv1.2");
                    X509TrustManager tm = new X509TrustManager() {
                        @Override
                        public void checkClientTrusted(X509Certificate[] chain,
                                                       String authType) throws CertificateException {
                        }

                        @Override
                        public void checkServerTrusted(X509Certificate[] chain,
                                                       String authType) throws CertificateException {
                        }

                        @Override
                        public X509Certificate[] getAcceptedIssuers() {
                            return null;
                        }
                    };
                    ctx.init(null, new TrustManager[]{tm}, null);
                    org.apache.http.conn.ssl.SSLSocketFactory ssf = new org.apache.http.conn.ssl.SSLSocketFactory(ctx, org.apache.http.conn.ssl.SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
                    ((HttpsURLConnection) connection).setSSLSocketFactory(ctx.getSocketFactory());
                    HttpsURLConnection httpsConnection = (HttpsURLConnection) connection;

                    super.prepareConnection(httpsConnection, httpMethod);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
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
        VideoDTO video = videoFacade.selectVideoDTOById(id);
        String money = video.getMoney();
        String[] split = money.split("-");
        video.setStartMoney(split[0]);
        video.setEndMoney(split[1]);
        mmap.put("video", video);
        Integer categoryId = video.getCategoryId();
        SysCategory sysCategory = sysCategoryService.selectDeptById(categoryId.longValue());
        SysCategoryDTO categoryDTO = new SysCategoryDTO();
        BeanUtils.copyProperties(sysCategory, categoryDTO);
        video.setCategory(categoryDTO);

        return prefix + "/edit";
    }

    /**
     * 修改保存公共片库
     */
    @RequiresPermissions("system:video:edit")
    @RequiresRoles("admin")
    @Log(title = "公共片库", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(VideoDTO video) {
        video.setMoney(video.getStartMoney() + "-" + video.getEndMoney());
        return toAjax(videoFacade.updateVideoDTO(video));
    }


    /**
     * 状态修改
     */
    @Log(title = "公共片库", businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:video:edit")
    @PostMapping("/changeStatus")
    @RequiresRoles("admin")
    @ResponseBody
    public AjaxResult changeStatus(Video video) {
        return toAjax(videoService.updateVideo(video));
    }

    /**
     * 删除公共片库
     */
    @RequiresPermissions("system:video:remove")
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
