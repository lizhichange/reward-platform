package com.ruoyi.web.controller.system;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.reward.domain.SysCategory;
import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.VideoRelPrice;
import com.ruoyi.reward.facade.api.VideoFacade;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.reward.mapper.VideoRelPriceMapper;
import com.ruoyi.reward.service.SysCategoryService;
import com.ruoyi.reward.service.VideoRelPriceService;
import com.ruoyi.reward.service.VideoService;
import com.ruoyi.system.domain.ExtSysOrder;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.service.SysConfigService;
import com.ruoyi.system.service.SysOrderService;
import com.ruoyi.web.param.PriceParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.near.toolkit.model.Money;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.net.HttpURLConnection;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;


/**
 * 公共片库Controller
 *
 * @author ruoyi
 * @date 2020-03-17
 */
@Controller
@Api("视频信息管理")
@RequestMapping("/system/video")
@Slf4j
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
    SysOrderService sysOrderService;
    @Autowired
    VideoRelPriceService videoRelPriceService;
    @Autowired
    VideoRelPriceMapper videoRelPriceMapper;

    @Autowired
    SysConfigService sysConfigService;

    @Autowired
    ThreadPoolTaskExecutor threadPoolTaskExecutor;

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
    @GetMapping("/private_video")
    public String privateVideo() {
        return prefix + "/private_video";
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
        if (CollectionUtils.isEmpty(list)) {
            return getDataTable(list);
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
            item.setSucCount((int) count);
            VideoRelPrice price = new VideoRelPrice();
            price.setUserId(ShiroUtils.getLoginName());
            price.setVideoId(Long.valueOf(item.getId()));
            List<VideoRelPrice> relPrices = videoRelPriceMapper.selectVideoRelPriceList(price);
            if (!CollectionUtils.isEmpty(relPrices)) {
                VideoRelPrice relPrice = relPrices.get(0);
                Money money = new Money();
                money.setCent(relPrice.getPrice());
                item.setPrivateMoney(money.toString());
            } else {
                item.setPrivateMoney(item.getMoney());
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

    @ApiOperation("拉取视频")
    @ResponseBody
    @PostMapping("/fetch")
    @Deprecated
    public AjaxResult fetchVideo(ModelMap modelMap) {
        RestTemplate client = new RestTemplate(new HttpsClientRequestFactory());
        ResponseEntity<String> forEntity = client.getForEntity("https://jialiapi.com/api.php/provide/vod/?ac=list", String.class);
        String body = forEntity.getBody();
        return AjaxResult.success(AjaxResult.Type.SUCCESS.name(), new Object());
    }

    public static class HttpsClientRequestFactory extends SimpleClientHttpRequestFactory {
        @Override
        protected void prepareConnection(HttpURLConnection connection, String httpMethod) {
            try {
                if (!(connection instanceof HttpsURLConnection)) {
                    super.prepareConnection(connection, httpMethod);
                }
                if (connection instanceof HttpsURLConnection) {
                    SSLContext ctx = SSLContext.getInstance("TLSv1.2");
                    X509TrustManager tm = new X509TrustManager() {
                        @Override
                        public void checkClientTrusted(X509Certificate[] chain,
                                                       String authType) {
                        }

                        @Override
                        public void checkServerTrusted(X509Certificate[] chain,
                                                       String authType) {
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
                log.error(e.getMessage(), e);
            }
        }
    }


    @Log(title = "批量发布价格", businessType = BusinessType.INSERT)
    @PostMapping("/batchForceLogout")
    @ResponseBody
    public AjaxResult batchForceLogout(PriceParam param, @RequestParam("ids[]") String[] ids) {
        logger.info("param:{},ids:{}", param, ids);
        String loginName = ShiroUtils.getLoginName();
        VideoRelPrice price = new VideoRelPrice();
        price.setUserId(loginName);
        if (!ArrayUtils.isEmpty(ids)) {
            for (String videoId : ids) {
                price.setVideoId(Long.valueOf(videoId));
                List<VideoRelPrice> relPrices = videoRelPriceService.selectVideoRelPriceList(price);
                if (!CollectionUtils.isEmpty(relPrices)) {
                    String[] collect = new String[relPrices.size()];
                    for (int i = 0; i < relPrices.size(); i++) {
                        collect[i] = String.valueOf(relPrices.get(i).getId());
                    }
                    videoRelPriceMapper.deleteVideoRelPriceByIds(collect);
                }
                relPrice(param, loginName, Integer.valueOf(videoId));
            }
        }
        return toAjax(1);
    }

    @Log(title = "一键发布价格", businessType = BusinessType.INSERT)
    @PostMapping("/price")
    @ResponseBody
    public AjaxResult price(PriceParam param) {

        VideoRelPrice price = new VideoRelPrice();
        String loginName = ShiroUtils.getLoginName();
        price.setUserId(loginName);
        List<VideoRelPrice> relPrices = videoRelPriceService.selectVideoRelPriceList(price);
        if (!CollectionUtils.isEmpty(relPrices)) {
            videoRelPriceMapper.deleteVideoRelPriceByUserId(loginName);
        }
        return relPrice(param, loginName, null);
    }

    private AjaxResult relPrice(PriceParam param, String loginName,
                                Integer videoId) {
        List<VideoRelPrice> objects = Lists.newArrayList();
        Video record = new Video();
        if (Objects.nonNull(videoId)) {
            record.setId(videoId);
        }
        List<Video> videos = videoService.selectVideoList(record);
        if (CollectionUtils.isEmpty(videos)) {
            return toAjax(1);
        }
        for (Video video : videos) {
            VideoRelPrice relPrice = new VideoRelPrice();
            relPrice.setVideoId(Long.valueOf(video.getId()));
            relPrice.setUserId(loginName);
            Money money = new Money(param.getPrice());
            relPrice.setPrice(money.getCent());
            objects.add(relPrice);
        }
        return toAjax(videoRelPriceMapper.batchInsert(objects));

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
        logger.info("video:{}", video);
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
