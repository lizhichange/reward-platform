package com.ruoyi.web.controller;

import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.reward.facade.dto.VideoRelPriceDTO;
import com.ruoyi.reward.facade.enums.OrderPayType;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import com.ruoyi.web.client.*;
import com.ruoyi.web.interceptor.WxPnUserAuth;
import com.ruoyi.web.model.PageForm;
import com.ruoyi.web.result.PayResult;
import com.ruoyi.web.result.TableDataInfo;
import org.apache.commons.codec.digest.DigestUtils;
import org.near.servicesupport.result.TPageResult;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.context.SessionContext;
import org.near.toolkit.model.AjaxResult;
import org.near.toolkit.model.Money;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.http.*;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.util.*;
import java.util.stream.Collectors;

import static com.ruoyi.reward.facade.enums.OrderPayType.WE_CHAT_PAY;

/**
 * ¬
 *
 * @author sunflower
 */
@Controller
@RequestMapping("/video")
@CacheConfig(cacheNames = "videos")
public class VideoController extends BaseController {

    private static final Logger log = LoggerFactory.getLogger(VideoController.class);

    private static final String prefix = "video";

    @Autowired
    ThreadPoolTaskExecutor threadPoolTaskExecutor;
    @Autowired
    VideoFacadeClient videoFacadeClient;
    @Autowired
    SysOrderFacadeClient sysOrderFacadeClient;
    @Autowired
    SysWebMainFacadeClient sysWebMainFacadeClient;

    @Autowired
    RestTemplate restTemplate;

    @Autowired
    SysConfigFacadeClient sysConfigFacadeClient;

    @Autowired
    VideoRelPriceFacadeClient videoRelPriceFacadeClient;

    @GetMapping("/redirect")
    public String redirect(@RequestParam(value = "userId", required = false) String userId,
                           @RequestParam(value = "categoryId", required = false) String categoryId,
                           @RequestParam(value = "videoId", required = false) String videoId,
                           ModelMap modelmap) {
        xxx(userId, categoryId, videoId, modelmap);
        String tradeType = sysConfigFacadeClient.selectConfigByKey("sys.tradeType");
        String wxAuthUrl = sysConfigFacadeClient.selectConfigByKey("wxAuthUrl");
        String wxPayUrl = wxAuthUrl + "/pay";
        modelmap.addAttribute("wxPayUrl", wxPayUrl + "?tradeType=" + tradeType);
        return prefix + "/index";
    }

    @GetMapping("/index")
    public String render(@RequestParam(value = "userId", required = false) String userId,
                         @RequestParam(value = "categoryId", required = false) String categoryId,
                         @RequestParam(value = "videoId", required = false) String videoId,
                         ModelMap modelmap) {
        return index(userId, categoryId, videoId, modelmap);
    }

    @GetMapping()
    public String index(@RequestParam(value = "userId", required = false) String userId,
                        @RequestParam(value = "categoryId", required = false) String categoryId,
                        @RequestParam(value = "videoId", required = false) String videoId,

                        ModelMap modelmap) {
        String user = StringUtil.isBlank(userId) ? "" : userId;
        SysWebMainDTO webMain = new SysWebMainDTO();
        webMain.setMainStatus(WebMainStatus.OK.getCode());
        List<SysWebMainDTO> list = sysWebMainFacadeClient.selectSysWebMainList(webMain);
        if (!CollectionUtils.isEmpty(list)) {
            int size = list.size();
            SysWebMainDTO item;
            if (size == 1) {
                item = list.get(0);
            } else {
                int i = RandomUtil.randomInt(0, size - 1);
                item = list.get(i);
            }
            String url = item.getMainUrl() + "/video/redirect?userId=" + user;
            log.info("redirect.url:{}", url);
            return "redirect:" + url;
        }
        return redirect(userId, categoryId, videoId, modelmap);
    }


    @PostMapping("/byCategoryList")
    @ResponseBody
    public TableDataInfo byCategoryList(VideoDTO videoDTO, PageForm pageForm) {
        int pageNum = pageForm.getPageNum();
        int pageSize = pageForm.getPageSize();
        String orderByClause = " create_time desc ";
        TPageResult<VideoDTO> result = videoFacadeClient.queryPage(pageNum, pageSize, videoDTO, orderByClause);
        List<VideoDTO> list = result.getValues();
        convert(list, SessionContext.getUserId());
        if (CollectionUtils.isEmpty(list)) {
            TableDataInfo dataTable = getDataTable(list);
            dataTable.setTotal(result.getTotalRows());
            dataTable.setTotalPage(result.getTotalPage());
            return dataTable;
        }
        //如果查询出来的数据小于
        if (list.size() < pageSize && list.size() <= 20) {
            // shuffle 打乱顺序
            Collections.shuffle(list);
            TableDataInfo dataTable = getDataTable(list);
            dataTable.setTotal(result.getTotalRows());
            dataTable.setTotalPage(result.getTotalPage());
            return dataTable;
        }
        Collections.shuffle(list);
        List<VideoDTO> collect = list.stream().limit(20).collect(Collectors.toList());
        TableDataInfo dataTable = getDataTable(collect);
        dataTable.setTotal(result.getTotalRows());
        dataTable.setTotalPage(result.getTotalPage());
        return dataTable;
    }


    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(VideoDTO videoDTO, PageForm pageForm) {
        int pageNum = pageForm.getPageNum();
        int pageSize = pageForm.getPageSize();
        String orderByClause = " create_time desc ";
        log.info("videoDTO:{}", videoDTO);
        // 启用
        videoDTO.setStatus("0");
        TPageResult<VideoDTO> result = videoFacadeClient.queryPage(pageNum, pageSize, videoDTO, orderByClause);
        List<VideoDTO> list = result.getValues();
        convert(list, SessionContext.getUserId());
        TableDataInfo dataTable = getDataTable(list);
        dataTable.setTotal(result.getTotalRows());
        dataTable.setTotalPage(result.getTotalPage());
        return dataTable;
    }

    @PostMapping("/buy")
    @ResponseBody
    @WxPnUserAuth
    public TableDataInfo buy(VideoDTO videoDTO, PageForm pageForm) {
        String openId = SessionContext.getOpenId();
        int pageNum = pageForm.getPageNum();
        int pageSize = pageForm.getPageSize();
        SysOrderDTO sysOrderDTO = new SysOrderDTO();
        sysOrderDTO.setOpenId(openId);
        sysOrderDTO.setStatus(Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
        log.info("sysOrderDTO:{}", sysOrderDTO);
        List<SysOrderDTO> listExt = sysOrderFacadeClient.selectSysOrderListExt(sysOrderDTO);
        log.info("listExt:{}", listExt);
        if (CollectionUtils.isEmpty(listExt)) {
            TableDataInfo dataTable = getDataTable(Lists.newArrayList());
            dataTable.setTotal(0);
            return dataTable;
        }
        //商品信息
        List<Integer> collect = listExt.stream().map(SysOrderDTO::getGoodsId).collect(Collectors.toList());
        videoDTO.setIds(collect);
        String orderByClause = " create_time desc ";
        log.info("videoDTO:{}", videoDTO);
        TPageResult<VideoDTO> result = videoFacadeClient.queryPage(pageNum, pageSize, videoDTO, orderByClause);
        List<VideoDTO> list = result.getValues();
        convert(list, SessionContext.getUserId());
        TableDataInfo dataTable = getDataTable(list);
        dataTable.setTotal(result.getTotalRows());
        dataTable.setTotalPage(result.getTotalPage());
        return dataTable;
    }


    protected TableDataInfo getDataTable(List<?> list) {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(list);
        return rspData;
    }


    @PostMapping("/queryOrder")
    @ResponseBody
    public AjaxResult queryOrder(VideoDTO videoDTO) {
        VideoDTO dtoById = videoFacadeClient.selectVideoDTOById(videoDTO.getId().longValue());
        if (dtoById == null) {
            return AjaxResult.warn("非法请求");
        }


        SysOrderDTO order = new SysOrderDTO();

        order.setGoodsId(dtoById.getId());
        order.setOpenId(SessionContext.getHostAdd());
        List<SysOrderDTO> sysOrders = sysOrderFacadeClient.selectSysOrder(order);
        log.info("sysOrders:{}", sysOrders);
        if (!CollectionUtils.isEmpty(sysOrders)) {
            SysOrderDTO sysOrder = sysOrders.get(0);
            // 如果原来的推广id 为空 补偿进去
            if (StringUtil.isBlank(sysOrder.getExtensionUserId())) {
                // 异步执行
                threadPoolTaskExecutor.execute(() -> {
                    SysOrderDTO upOrder = new SysOrderDTO();
                    upOrder.setOrderId(sysOrder.getOrderId());
                    // 推广人userId
                    upOrder.setExtensionUserId(SessionContext.getUserId());
                    sysOrderFacadeClient.updateSysOrderByOrderId(upOrder);
                });
            }

            // 商品快照信息
            order.setGoodsSnapshot(JSON.toJSONString(dtoById));
            String extensionUserId = StringUtil.isBlank(SessionContext.getUserId()) ? "admin" : SessionContext.getUserId();
            //推广人userId
            order.setExtensionUserId(extensionUserId);
            order.setOrderId(sysOrder.getOrderId());
            money(dtoById, order, extensionUserId);

            sysOrderFacadeClient.updateSysOrderByOrderId(order);

            sysOrder.setMoney(order.getMoney());
            sysOrder.setMoneyStr(order.getMoneyStr());

            if (sysOrder.getType() != null) {
                OrderPayType orderPayType = EnumUtil.queryByCode(sysOrder.getType().toString(), OrderPayType.class);
                sysOrder.setTypeStr(orderPayType.getDesc());
            }
            if (sysOrder.getStatus() != null) {
                OrderStatusType orderStatusType = EnumUtil.queryByCode(sysOrder.getStatus().toString(), OrderStatusType.class);
                sysOrder.setStatusStr(orderStatusType.getDesc());
            }

            return AjaxResult.success(sysOrder);
        }


        order.setUserId(SessionContext.getHostAdd());
        // 商品快照信息
        order.setGoodsSnapshot(JSON.toJSONString(dtoById));
        String extensionUserId = StringUtil.isBlank(SessionContext.getUserId()) ? "admin" : SessionContext.getUserId();
        money(dtoById, order, extensionUserId);
        // 推广人userId
        order.setExtensionUserId(extensionUserId);
        order.setOpenId(SessionContext.getHostAdd());
        // 支付类型
        order.setType(Integer.valueOf(WE_CHAT_PAY.getCode()));
        order.setTypeStr(WE_CHAT_PAY.getDesc());
        // 状态
        order.setStatus(Integer.valueOf(OrderStatusType.N_PAY.getCode()));
        order.setStatusStr(OrderStatusType.N_PAY.getDesc());
        sysOrderFacadeClient.insertSysOrder(order);

        SysOrderDTO newOrder = new SysOrderDTO();
        newOrder.setGoodsId(dtoById.getId());
        newOrder.setOpenId(SessionContext.getHostAdd());

        List<SysOrderDTO> newOrderDTO = sysOrderFacadeClient.selectSysOrder(newOrder);
        if (!CollectionUtils.isEmpty(newOrderDTO)) {
            return AjaxResult.success(newOrderDTO.get(0));
        }

        return AjaxResult.error("系统异常");

    }

    private void money(VideoDTO dtoById, SysOrderDTO order, String extensionUserId) {
        VideoRelPriceDTO relPriceDTO = new VideoRelPriceDTO();
        relPriceDTO.setVideoId(Long.valueOf(dtoById.getId()));
        relPriceDTO.setUserId(extensionUserId);
        List<VideoRelPriceDTO> dtoList = videoRelPriceFacadeClient.selectVideoDTOList(relPriceDTO);
        if (CollectionUtils.isEmpty(dtoList)) {
            //商品价格区间 原价
            String money = dtoById.getMoney();
            String[] split = money.split("-");
            int start = Integer.parseInt(split[0]);
            int end = Integer.parseInt(split[1]);
            //这个单位是元
            int i = RandomUtil.randomInt(start, end + 1);
            //实际金额 转换单位分
            Money m = new Money(i);
            int amount = Math.toIntExact(m.getCent());
            log.info("实际支付金额:{}", amount);
            order.setMoney(amount);
            order.setMoneyStr(String.valueOf(amount));
            //原价 转换单位分
            order.setPrice(Math.toIntExact(m.getCent()));
            order.setPayTag(m.toString());
        } else {
            VideoRelPriceDTO priceDTO = dtoList.get(0);
            Money m = new Money();
            m.setCent(priceDTO.getPrice());
            order.setMoney(Math.toIntExact(priceDTO.getPrice()));
            order.setMoneyStr(m.toString());
            order.setPrice(Math.toIntExact(priceDTO.getPrice()));
            order.setPayTag(m.toString());
        }
    }


    @GetMapping("/qrcode")
    public String qrcode(ModelMap modelMap,

                         @RequestParam(value = "orderId") String orderId,
                         @RequestParam(value = "callbackUrl") String callbackUrl,
                         HttpServletRequest request
    ) throws Exception {
        pay(modelMap, "qrcode", orderId, "tradeType", callbackUrl);
        return "qrcode";
    }

    @GetMapping("/h5")
    public String h5(ModelMap modelMap,
                     @RequestParam(value = "orderId") String orderId,
                     @RequestParam(value = "tradeType") String tradeType,
                     @RequestParam(value = "callbackUrl") String callbackUrl) throws Exception {
        pay(modelMap, "wap", orderId, tradeType, callbackUrl);
        return "h5";
    }

    private SysOrderDTO getSysOrderDTO(String orderId) {
        Assert.notNull(orderId, "orderId is not null");
        SysOrderDTO selectSysOrder = new SysOrderDTO();
        selectSysOrder.setOrderId(orderId);
        List<SysOrderDTO> list = sysOrderFacadeClient.selectSysOrder(selectSysOrder);
        if (CollectionUtils.isEmpty(list)) {
            throw new RuntimeException("系统异常");
        }
        return list.get(0);
    }

    public void pay(ModelMap modelMap, String way,
                    String orderId,
                    String tradeType,
                    String callbackUrl) throws Exception {
        SysOrderDTO sysOrderDTO = getSysOrderDTO(orderId);
        InetAddress netAddress = InetAddress.getLocalHost();
        String payUrl = "http://payapi.ttyerh45.cn/game/unifiedorder"; //请求订单地址
        String checkUrl = "http://payapi.ttyerh45.cn/pay/checkTradeNo"; //主动查单地址
        modelMap.addAttribute("checkUrl", checkUrl);
        String mchId = "600500053"; //商户ID，后台提取
        String billNo = orderId; //商户订单号
        String totalAmount = sysOrderDTO.getMoney().toString(); //金额
        String billDesc = "在线充值"; //商品名称
        String payment = "wechat"; //微信支付
        String notifyUrl = "23333"; //回调地址
        String returnUrl = "callbackUrl"; //同步跳转
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

        String merchantKey = "8387ea13ff584f77cb5309125897a0d047a7e07c38f3ac961c7c98833fe06501";
        String sign = sign(map, merchantKey, true);
        map.put("sign", sign);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String content = JSONObject.toJSONString(map);
        HttpEntity<String> request = new HttpEntity<>(content, headers);
        ResponseEntity<String> postForEntity = restTemplate.postForEntity(payUrl, request, String.class);
        log.info("postForEntity:{}", postForEntity);
        if (postForEntity.getStatusCode() == HttpStatus.OK) {
            String body = postForEntity.getBody();
            PayResult result = JSONObject.parseObject(body, PayResult.class);
            if (result != null && result.getCode() == 0) {
                modelMap.addAttribute("result", result.getResult());
            }
        }
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
        log.info("toSign:{}", toSign);
        return DigestUtils.md5Hex(toSign.toString()).toUpperCase();
    }
}
