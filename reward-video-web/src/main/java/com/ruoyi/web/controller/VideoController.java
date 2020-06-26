package com.ruoyi.web.controller;

import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Predicate;
import com.google.common.collect.Lists;
import com.ruoyi.reward.facade.dto.*;
import com.ruoyi.reward.facade.enums.MultiTypeEnum;
import com.ruoyi.reward.facade.enums.OrderPayType;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import com.ruoyi.web.client.*;
import com.ruoyi.web.config.AppConfig;
import com.ruoyi.web.interceptor.WxPnUserAuth;
import com.ruoyi.web.model.AjaxResult;
import com.ruoyi.web.model.PageForm;
import com.ruoyi.web.result.TableDataInfo;
import lombok.Data;
import org.apache.commons.lang.StringUtils;
import org.near.servicesupport.result.TPageResult;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.context.SessionContext;
import org.near.toolkit.model.Money;
import org.near.toolkit.model.ToString;
import org.near.utils.IpUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

import static com.ruoyi.reward.facade.enums.OrderPayType.WE_CHAT_PAY;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/video")
@WxPnUserAuth
@CacheConfig(cacheNames = "videos")
public class VideoController extends BaseController {

    private static final Logger log = LoggerFactory.getLogger(VideoController.class);

    private static final String prefix = "video";

    @Autowired
    private AppConfig appConfig;

    @Autowired
    ThreadPoolTaskExecutor threadPoolTaskExecutor;
    @Autowired
    private ShipinFacadeClient shipinFacadeClient;
    @Autowired
    private SysCategoryFacadeClient sysCategoryFacadeClient;
    @Autowired
    private SysOrderFacadeClient sysOrderFacadeClient;
    @Autowired
    private SysWebMainFacadeClient sysWebMainFacadeClient;

    private void xxx(@RequestParam(value = "userid", required = false) String userid,
                     @RequestParam(value = "categoryId", required = false) String categoryId,
                     @RequestParam(value = "shipinId", required = false) String shipinId,
                     ModelMap modelmap) {
        log.info("userId:{}", userid);
        ShipinDTO shipinDTO = new ShipinDTO();
        String orderByClause = " create_time desc ";
        TPageResult<ShipinDTO> result = shipinFacadeClient.queryPage(1, 12, shipinDTO, orderByClause);
        List<ShipinDTO> list = result.getValues();
        convert(list);
        list.sort((o1, o2) -> o2.getCreateTime().compareTo(o1.getCreateTime()));
        modelmap.addAttribute("list", list);
        getCategory(modelmap);
        modelmap.addAttribute("categoryId", categoryId);
        if (StringUtil.isNotBlank(shipinId)) {
            try {
                ShipinDTO dto = shipinFacadeClient.selectShipinDTOById(Long.parseLong(shipinId));
                modelmap.addAttribute("shipin", dto);
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
        }
    }

    @GetMapping("/redirect")
    @WxPnUserAuth
    public String redirect(@RequestParam(value = "userid", required = false) String userid,
                           @RequestParam(value = "categoryId", required = false) String categoryId,
                           @RequestParam(value = "shipinId", required = false) String shipinId,
                           ModelMap modelmap) {
        xxx(userid, categoryId, shipinId, modelmap);
        String tradeType = sysConfigFacadeClient.selectConfigByKey("sys.tradeType");
        String wxAuthUrl = sysConfigFacadeClient.selectConfigByKey("wxAuthUrl");
        String wxPayUrl = wxAuthUrl + "/pay";
        modelmap.addAttribute("wxPayUrl", wxPayUrl + "?tradeType=" + tradeType);
        return prefix + "/index";
    }

    @GetMapping("/index")
    @WxPnUserAuth
    public String render(@RequestParam(value = "userid", required = false) String userid,
                         @RequestParam(value = "categoryId", required = false) String categoryId,
                         @RequestParam(value = "shipinId", required = false) String shipinId,

                         ModelMap modelmap) {
        return index(userid, categoryId, shipinId, modelmap);
    }

    @GetMapping()
    @WxPnUserAuth
    public String index(@RequestParam(value = "userid", required = false) String userid,
                        @RequestParam(value = "categoryId", required = false) String categoryId,
                        @RequestParam(value = "shipinId", required = false) String shipinId,

                        ModelMap modelmap) {
        String user = StringUtil.isBlank(userid) ? "" : userid;
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
            String url = item.getMainUrl() + "/video/redirect?userid=" + user;
            log.info("redirect.url:{}", url);
            return "redirect:" + url;
        }
        return redirect(userid, categoryId, shipinId, modelmap);
    }

    @GetMapping("/category")
    @WxPnUserAuth
    public String category(@RequestParam(value = "categoryId") Long categoryId, @RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        log.info("user:{},categoryId:{}", userid, categoryId);
        getCategory(modelmap);
        Object currentUser = getCurrentUser();
        log.info("currentUser:{}", currentUser);
        SysCategoryDTO sysCategory = sysCategoryFacadeClient.selectDeptById(categoryId);
        if (sysCategory == null) {
            modelmap.addAttribute("category", new SysCategoryDTO());
        } else {
            modelmap.addAttribute("category", sysCategory);
        }
        return prefix + "/category";
    }


    @GetMapping("/detail")
    @WxPnUserAuth
    public String detail(@RequestParam(value = "id") Long id,
                         @RequestParam(value = "userid", required = false) String userid,
                         @RequestParam(value = "author", required = false) String author,
                         ModelMap modelmap) {
        log.info("user:{},id:{},author:{}", userid, id, author);
        ShipinDTO shipin = shipinFacadeClient.selectShipinDTOById(id);
        if (shipin != null) {
            convert(new Date(), shipin);
            modelmap.put("shipin", shipin);
            SysCategoryDTO category = sysCategoryFacadeClient.selectDeptById(shipin.getCategoryId().longValue());
            if (category != null) {
                modelmap.put("category", category);
            }
            //异步执行浏览加1
            threadPoolTaskExecutor.execute(() -> shipinFacadeClient.updateClickPlus(shipin.getId().longValue()));
        }

        String orderByClause = " create_time desc ";
        TPageResult<ShipinDTO> result = shipinFacadeClient.queryPage(1, 12, new ShipinDTO(), orderByClause);
        List<ShipinDTO> list = result.getValues();
        convert(list);
        modelmap.addAttribute("list", list);
        getCategory(modelmap);
        String tradeType = sysConfigFacadeClient.selectConfigByKey("sys.tradeType");
        String wxAuthUrl = sysConfigFacadeClient.selectConfigByKey("wxAuthUrl");
        String wxPayUrl = wxAuthUrl + "/pay";
        modelmap.addAttribute("wxPayUrl", wxPayUrl + "?tradeType=" + tradeType);
        return prefix + "/detail";
    }


    @PostMapping("/byCategoryList")
    @ResponseBody
    public TableDataInfo byCategoryList(ShipinDTO shipinDTO, PageForm pageForm) {

        int pageNum = pageForm.getPageNum();
        int pageSize = pageForm.getPageSize();
        String orderByClause = " create_time desc ";
        TPageResult<ShipinDTO> result = shipinFacadeClient.queryPage(pageNum, pageSize, shipinDTO, orderByClause);
        List<ShipinDTO> list = result.getValues();
        convert(list);
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
        List<ShipinDTO> collect = list.stream().limit(20).collect(Collectors.toList());
        TableDataInfo dataTable = getDataTable(collect);
        dataTable.setTotal(result.getTotalRows());
        dataTable.setTotalPage(result.getTotalPage());
        return dataTable;
    }


    @PostMapping("/list")
    @ResponseBody
    @Cacheable(key = "#p0")
    public TableDataInfo list(ShipinDTO shipinDTO, PageForm pageForm) {
        int pageNum = pageForm.getPageNum();
        int pageSize = pageForm.getPageSize();
        String orderByClause = " create_time desc ";
        log.info("shipinDTO:{}", shipinDTO);
        TPageResult<ShipinDTO> result = shipinFacadeClient.queryPage(pageNum, pageSize, shipinDTO, orderByClause);
        List<ShipinDTO> list = result.getValues();
        convert(list);
        TableDataInfo dataTable = getDataTable(list);
        dataTable.setTotal(result.getTotalRows());
        dataTable.setTotalPage(result.getTotalPage());
        return dataTable;
    }

    @PostMapping("/buy")
    @ResponseBody
    public TableDataInfo buy(ShipinDTO shipinDTO, PageForm pageForm) {
        String openId = SessionContext.getOpenId();
        int pageNum = pageForm.getPageNum();
        int pageSize = pageForm.getPageSize();
        SysOrderDTO sysOrderDTO = new SysOrderDTO();
        sysOrderDTO.setOpenId(openId);
        sysOrderDTO.setStatus(Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
        List<SysOrderDTO> listExt = sysOrderFacadeClient.selectSysOrderListExt(sysOrderDTO);
        if (CollectionUtils.isEmpty(listExt)) {
            TableDataInfo dataTable = getDataTable(Lists.newArrayList());
            dataTable.setTotal(0);
            return dataTable;
        }
        List<Integer> collect = listExt.stream().map(SysOrderDTO::getId).collect(Collectors.toList());
        shipinDTO.setIds(collect);
        String orderByClause = " create_time desc ";
        log.info("shipinDTO:{}", shipinDTO);
        TPageResult<ShipinDTO> result = shipinFacadeClient.queryPage(pageNum, pageSize, shipinDTO, orderByClause);
        List<ShipinDTO> list = result.getValues();
        convert(list);
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

    @Autowired
    SysConfigFacadeClient sysConfigFacadeClient;

    @PostMapping("/queryOrder")
    @ResponseBody
    @WxPnUserAuth
    public AjaxResult queryOrder(ShipinDTO shipinDTO) {
        String openId = SessionContext.getOpenId();
        log.info("openId:{}", openId);
        ShipinDTO dtoById = shipinFacadeClient.selectShipinDTOById(shipinDTO.getId().longValue());
        if (dtoById == null) {
            return AjaxResult.warn("非法请求");
        }
        SysOrderDTO order = new SysOrderDTO();
        order.setGoodsId(shipinDTO.getId());
        order.setOpenId(openId);
        List<SysOrderDTO> sysOrders = sysOrderFacadeClient.selectSysOrder(order);
        if (CollectionUtils.isEmpty(sysOrders)) {
            TWechatAuthDTO authDTO = userDetailFacadeClient.queryByOpenId(openId);
            ShipinDTO dto = shipinFacadeClient.selectShipinDTOById(shipinDTO.getId().longValue());
            Date now = new Date();
            order.setCreateTime(now);
            order.setUpdateTime(now);
            order.setUserId(authDTO.getUserId());
            //推广人userId
            order.setExtensionUserId(SessionContext.getUserId());
            //商品快照信息
            order.setGoodsSnapshot(JSON.toJSONString(dto));

            String extensionUserId = SessionContext.getUserId();
            if (StringUtil.isBlank(extensionUserId)) {
                extensionUserId = "admin";
            }
            SysConfigDTO configDTO = sysConfigFacadeClient.queryConfigByKey(extensionUserId);
            if (configDTO != null && StringUtils.isNotBlank(configDTO.getConfigValue())) {
                String main = null;
                List<PriceParam> itemList = null;
                Map valueMap = JSONObject.parseObject(configDTO.getConfigValue(), Map.class);
                if (valueMap.containsKey("main")) {
                    main = valueMap.get("main").toString();
                }
                if (valueMap.containsKey("item")) {
                    JSONArray array = (JSONArray) valueMap.get("item");
                    itemList = convert(array);
                }
                if (!CollectionUtils.isEmpty(itemList)) {
                    List<PriceParam> collect = itemList.stream().filter((Predicate<PriceParam>) param -> {
                        assert param != null;
                        String id = param.getId();
                        return StringUtil.equals(id, shipinDTO.getId().toString());
                    }).collect(Collectors.toList());
                    if (!CollectionUtils.isEmpty(collect)) {
                        PriceParam priceParam = collect.get(0);
                        Money m = new Money(priceParam.getPrice());
                        order.setMoney((int) m.getCent());
                        //原价 转换单位分
                        order.setPrice(Math.toIntExact(m.getCent()));
                        order.setPayTag(m.toString());

                    } else {
                        if (StringUtils.isNotBlank(main)) {
                            Money m = new Money(main);
                            order.setMoney((int) m.getCent());
                            //原价 转换单位分
                            order.setPrice(Math.toIntExact(m.getCent()));
                            order.setPayTag(m.toString());
                        } else {

                            //商品价格区间 原价
                            String money = dto.getMoney();
                            String[] split = money.split("-");
                            int start = Integer.parseInt(split[0]);
                            int end = Integer.parseInt(split[1]);
                            //这个单位是元
                            int i = RandomUtil.randomInt(start, end);
                            //实际金额 转换单位分
                            Money m = new Money(i);
                            int amount = Math.toIntExact(m.getCent()) - RandomUtil.randomInt(1, 100);
                            log.info("实际支付金额:{}", amount);
                            order.setMoney(amount);
                            order.setMoneyStr(String.valueOf(amount));
                            //原价 转换单位分
                            order.setPrice(Math.toIntExact(m.getCent()));
                            order.setPayTag(m.toString());
                        }
                    }
                } else {
                    if (StringUtils.isNotBlank(main)) {
                        Money m = new Money(main);
                        order.setMoney((int) m.getCent());
                        //原价 转换单位分
                        order.setPrice(Math.toIntExact(m.getCent()));
                        order.setPayTag(m.toString());
                    } else {
                        String money = dto.getMoney();
                        String[] split = money.split("-");
                        int start = Integer.parseInt(split[0]);
                        int end = Integer.parseInt(split[1]);
                        //这个单位是元
                        int i = RandomUtil.randomInt(start, end);
                        //实际金额 转换单位分
                        Money m = new Money(i);
                        int amount = Math.toIntExact(m.getCent()) - RandomUtil.randomInt(1, 100);
                        log.info("实际支付金额:{}", amount);
                        order.setMoney(amount);
                        order.setMoneyStr(String.valueOf(amount));
                        //原价 转换单位分
                        order.setPrice(Math.toIntExact(m.getCent()));
                        order.setPayTag(m.toString());
                    }
                }
            } else {
                //商品价格区间 原价
                String money = dto.getMoney();
                String[] split = money.split("-");
                int start = Integer.parseInt(split[0]);
                int end = Integer.parseInt(split[1]);
                //这个单位是元
                int i = RandomUtil.randomInt(start, end);
                //实际金额 转换单位分
                Money m = new Money(i);
                int amount = Math.toIntExact(m.getCent()) - RandomUtil.randomInt(1, 100);
                log.info("实际支付金额:{}", amount);
                order.setMoney(amount);
                order.setMoneyStr(String.valueOf(amount));
                //原价 转换单位分
                order.setPrice(Math.toIntExact(m.getCent()));
                order.setPayTag(m.toString());
            }

            order.setOpenId(openId);
            //支付类型
            order.setType(Integer.valueOf(WE_CHAT_PAY.getCode()));
            order.setTypeStr(WE_CHAT_PAY.getDesc());
            //状态
            order.setStatus(Integer.valueOf(OrderStatusType.N_PAY.getCode()));
            order.setStatusStr(OrderStatusType.N_PAY.getDesc());
            sysOrderFacadeClient.insertSysOrder(order);

            SysOrderDTO newOrder = new SysOrderDTO();
            newOrder.setGoodsId(shipinDTO.getId());
            newOrder.setOpenId(openId);
            List<SysOrderDTO> newOrderDTO = sysOrderFacadeClient.selectSysOrder(newOrder);
            if (!CollectionUtils.isEmpty(newOrderDTO)) {
                return AjaxResult.success(newOrderDTO.get(0));
            }
            return AjaxResult.error("系统异常");
        } else {
            SysOrderDTO sysOrder = sysOrders.get(0);
            //如果为空
            if (StringUtil.isBlank(sysOrder.getExtensionUserId())) {
                //异步执行
                threadPoolTaskExecutor.execute(() -> {
                    SysOrderDTO upOrder = new SysOrderDTO();
                    upOrder.setOrderId(sysOrder.getOrderId());
                    //推广人userId
                    upOrder.setExtensionUserId(SessionContext.getUserId());
                    sysOrderFacadeClient.updateSysOrderByOrderId(upOrder);
                });
            }
            Money money = new Money();
            money.setCent(sysOrder.getMoney());
            sysOrder.setMoneyStr(money.toString());

            if (sysOrder.getType() != null) {
                OrderPayType orderPayType = EnumUtil.queryByCode(sysOrder.getType().toString(), OrderPayType.class);
                sysOrder.setTypeStr(orderPayType.getDesc());
                //微信扫码支付
                boolean b = orderPayType == OrderPayType.NATIVE;


            }
            if (sysOrder.getStatus() != null) {
                OrderStatusType orderStatusType = EnumUtil.queryByCode(sysOrder.getStatus().toString(), OrderStatusType.class);
                boolean b = orderStatusType == OrderStatusType.PAY_ING;
                //如果支付中
                if (b) {

                }
                sysOrder.setStatusStr(orderStatusType.getDesc());
            }

            return AjaxResult.success(sysOrder);
        }
    }

    private void convert(List<ShipinDTO> list) {
        if (!CollectionUtils.isEmpty(list)) {
            Date now = new Date();
            for (ShipinDTO dto : list) {
                convert(now, dto);
            }
        }
    }

    @Data
    public static class PriceParam extends ToString {
        private String price;
        private String id;
    }

    private void convert(Date now, ShipinDTO dto) {
        Date createTime = dto.getCreateTime();
        if (createTime != null) {
            long diffDays = DateUtils.getDiffDays(now, createTime);
            if (diffDays < 1) {
                dto.setDiffDays("刚刚");
            } else {
                dto.setDiffDays(diffDays + "天前");
            }
        }
        if (StringUtil.isNotBlank(dto.getShijian())) {
            dto.setShijianStr(DateUtils.getTimeString(Integer.parseInt(dto.getShijian())));
        }
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

    @GetMapping("/tips")

    public String tips(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        return prefix + "/tips";
    }

    @GetMapping("/audit")
    public String audit(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        return prefix + "/audit";
    }

    @GetMapping("/sub")
    public String success(@RequestParam(value = "userid", required = false) String userid,
                          HttpServletRequest request,
                          ModelMap modelmap) {

        threadPoolTaskExecutor.execute(() -> {
            TsDTO tsDTO = new TsDTO();
            tsDTO.setOpenId(SessionContext.getOpenId());
            tsDTO.setUserid(SessionContext.getUserId());
            tsDTO.setIp(IpUtils.getIpAddr(request));
            tsFacadeClient.insertTs(tsDTO);
        });
        return prefix + "/sub";
    }


    @GetMapping("/multi")
    public String multi(@RequestParam(value = "userid", required = false) String userid,
                        @RequestParam(value = "type") String type,
                        ModelMap modelmap) {
        MultiTypeEnum multiTypeEnum = EnumUtil.queryByCode(type, MultiTypeEnum.class);
        List<MultiTypeEnum.ItemContent> list = multiTypeEnum.getList();
        modelmap.addAttribute("list", list);
        return prefix + "/multi";
    }

    @GetMapping("/tswq")
    public String renderTs(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        return prefix + "/tswq";
    }

    @GetMapping("/demo")
    public String demo(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        return prefix + "/demo";
    }

}
