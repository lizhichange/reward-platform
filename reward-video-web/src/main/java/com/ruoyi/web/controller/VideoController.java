package com.ruoyi.web.controller;

import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSON;
import com.ruoyi.web.PageForm;

import com.ruoyi.web.client.*;
import com.ruoyi.web.config.AppConfig;
import com.ruoyi.web.result.TableDataInfo;
import com.ruoyi.web.util.AjaxResult;
import com.ruoyi.reward.facade.dto.ShipinDTO;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import com.ruoyi.reward.facade.enums.OrderPayType;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import lombok.extern.slf4j.Slf4j;
import org.near.servicesupport.result.TPageResult;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.context.SessionContext;
import org.near.toolkit.model.Money;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import static com.ruoyi.reward.facade.enums.OrderPayType.WE_CHAT_PAY;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/video")
@Slf4j
public class VideoController {
    private static final String prefix = "video";
    @Autowired
    ThreadPoolTaskExecutor threadPoolTaskExecutor;
    @Autowired
    ShipinFacadeClient shipinFacadeClient;
    @Autowired
    ISysCategoryFacadeClient sysCategoryFacadeClient;
    @Autowired
    ISysOrderFacadeClient sysOrderFacadeClient;
    @Autowired
    ISysWebMainFacadeClient sysWebMainFacadeClient;
    @Autowired
    ISysConfigFacadeClient sysConfigFacadeClient;

    private void xxx(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        log.info("userId:{}", userid);
        ShipinDTO shipinDTO = new ShipinDTO();
        String orderByClause = " create_time desc ";
        TPageResult<ShipinDTO> result = shipinFacadeClient.queryPage(1, 12, shipinDTO, orderByClause);
        List<ShipinDTO> list = result.getValues();
        convert(list);
        list.sort((o1, o2) -> o2.getCreateTime().compareTo(o1.getCreateTime()));
        modelmap.addAttribute("list", list);
        getCategory(modelmap);
    }

    @GetMapping("/redirect")
    public String redirect(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        xxx(userid, modelmap);
        return prefix + "/index";
    }


    @GetMapping()
    public String index(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
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
        return redirect(userid, modelmap);
    }

    @GetMapping("/category")
    public String category(@RequestParam(value = "categoryId") Long categoryId, @RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        log.info("user:{},categoryId:{}", userid, categoryId);
        getCategory(modelmap);
        SysCategoryDTO sysCategory = sysCategoryFacadeClient.selectDeptById(categoryId);
        if (sysCategory == null) {
            modelmap.addAttribute("category", new SysCategoryDTO());
        } else {
            modelmap.addAttribute("category", sysCategory);
        }
        return prefix + "/category";
    }

    @Autowired
    AppConfig appConfig;

    @GetMapping("/detail")
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
        modelmap.addAttribute("wxPayUrl", appConfig.getWxPayUrl() + "?tradeType=" + tradeType);
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
            return dataTable;
        }
        //如果查询出来的数据小于
        if (list.size() < pageSize && list.size() <= 20) {
            // shuffle 打乱顺序
            Collections.shuffle(list);
            TableDataInfo dataTable = getDataTable(list);
            dataTable.setTotal(result.getTotalRows());
            return dataTable;
        }
        Collections.shuffle(list);
        List<ShipinDTO> collect = list.stream().limit(20).collect(Collectors.toList());
        TableDataInfo dataTable = getDataTable(collect);
        dataTable.setTotal(result.getTotalRows());
        return dataTable;
    }

    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ShipinDTO shipinDTO, PageForm pageForm) {
        int pageNum = pageForm.getPageNum();
        int pageSize = pageForm.getPageSize();
        String orderByClause = " create_time desc ";
        TPageResult<ShipinDTO> result = shipinFacadeClient.queryPage(pageNum, pageSize, shipinDTO, orderByClause);
        List<ShipinDTO> list = result.getValues();
        convert(list);
        TableDataInfo dataTable = getDataTable(list);
        dataTable.setTotal(result.getTotalRows());
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
    public AjaxResult queryOrder(ShipinDTO shipinDTO) {
        String openId = SessionContext.getOpenId();
        String userId = SessionContext.getUserId();
        log.info("id:{},openId:{}", shipinDTO.getId(), openId);
        SysOrderDTO order = new SysOrderDTO();
        order.setGoodsId(shipinDTO.getId());
        // TODO: 2020/4/20 必填参数
        order.setOpenId(StringUtil.isBlank(openId) ? "x" : "1");
        List<SysOrderDTO> sysOrders = sysOrderFacadeClient.selectSysOrder(order);
        if (CollectionUtils.isEmpty(sysOrders)) {
            ShipinDTO dto = shipinFacadeClient.selectShipinDTOById(shipinDTO.getId().longValue());
            order.setCreateTime(new Date());
            //代理推广的id
            order.setExtensionUserId(userId);
            order.setUpdateTime(new Date());
            //商品快照信息
            order.setGoodsSnapshot(JSON.toJSONString(dto));
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
            //备注
            order.setPayTag(m.toString());
            //支付类型
            order.setType(Integer.valueOf(WE_CHAT_PAY.getCode()));
            order.setTypeStr(WE_CHAT_PAY.getDesc());
            order.setStatus(Integer.valueOf(OrderStatusType.N_PAY.getCode()));
            order.setStatusStr(OrderStatusType.N_PAY.getDesc());
            sysOrderFacadeClient.insertSysOrder(order);
            return AjaxResult.success(order);
        } else {
            SysOrderDTO sysOrder = sysOrders.get(0);
            //如果为空
            if (StringUtil.isBlank(sysOrder.getExtensionUserId())) {
                //异步执行
                threadPoolTaskExecutor.execute(() -> {
                    SysOrderDTO upOrder = new SysOrderDTO();
                    upOrder.setOrderId(sysOrder.getOrderId());
                    upOrder.setExtensionUserId(userId);
                    sysOrderFacadeClient.updateSysOrderByOrderId(upOrder);
                });
            }
            Money money = new Money();
            money.setCent(sysOrder.getMoney());
            sysOrder.setMoneyStr(money.toString());
            sysOrder.setTypeStr(EnumUtil.queryByCode(sysOrder.getType().toString(), OrderPayType.class).getDesc());
            sysOrder.setStatusStr(EnumUtil.queryByCode(sysOrder.getStatus().toString(), OrderStatusType.class).getDesc());
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

    private void getCategory(ModelMap modelmap) {
        SysCategoryDTO sysCategory = new SysCategoryDTO();
        sysCategory.setParentId(100L);
        List<SysCategoryDTO> categoryList = sysCategoryFacadeClient.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
    }
}