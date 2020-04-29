package com.ruoyi.web.controller.common;

import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.IpUtils;
import com.ruoyi.reward.facade.api.IShipinFacade;
import com.ruoyi.reward.facade.api.ITsFacade;
import com.ruoyi.reward.facade.dto.ShipinDTO;
import com.ruoyi.reward.facade.dto.TsDTO;
import com.ruoyi.reward.facade.enums.OrderPayType;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import com.ruoyi.system.domain.SysCategory;
import com.ruoyi.system.domain.SysOrder;
import com.ruoyi.system.domain.SysWebMain;
import com.ruoyi.system.service.ISysCategoryService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysOrderService;
import com.ruoyi.system.service.ISysWebMainService;
import com.ruoyi.web.controller.enums.MultiTypeEnum;
import lombok.extern.java.Log;
import org.near.servicesupport.result.TPageResult;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.context.SessionContext;
import org.near.toolkit.model.Money;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import static com.ruoyi.reward.facade.enums.OrderPayType.WE_CHAT_PAY;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/pron")
@Log
public class PronController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(PronController.class);

    private String prefix = "pron";


    @Autowired
    IShipinFacade shipinFacade;
    @Autowired
    ITsFacade tsService;
    @Autowired
    ISysWebMainService sysWebMainService;
    @Autowired
    ISysCategoryService categoryService;
    @Autowired
    ISysOrderService sysOrderService;
    @Autowired
    ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @Autowired
    ISysConfigService configService;

    @GetMapping("/redirect")
    @com.ruoyi.common.annotation.Log(title = "视频重定向", businessType = BusinessType.QUERY)
    public String redirect(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        xxx(userid, modelmap);
        return prefix + "/index";

    }


    @PostMapping("/queryOrder")
    @ResponseBody
    @com.ruoyi.common.annotation.Log(title = "前台查询订单", businessType = BusinessType.QUERY)
    public AjaxResult queryOrder(ShipinDTO shipinDTO) {
        String openId = SessionContext.getOpenId();
        String userId = SessionContext.getUserId();
        LOGGER.info("id:{},openId:{}", shipinDTO.getId(), openId);
        SysOrder order = new SysOrder();
        order.setGoodsId(shipinDTO.getId());
        order.setOpenId(StringUtil.isBlank(openId) ? "x" : "1");
        // TODO: 2020/4/20 必填参数
        List<SysOrder> sysOrders = sysOrderService.selectSysOrder(order);
        if (CollectionUtils.isEmpty(sysOrders)) {
            ShipinDTO dto = shipinFacade.selectShipinDTOById(shipinDTO.getId().longValue());
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
            //随机立减
            int amount = Math.toIntExact(m.getCent()) - RandomUtil.randomInt(1, 100);
            logger.info("实际支付金额:{}", amount);
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
            sysOrderService.insertSysOrder(order);
            return AjaxResult.success(order);
        } else {
            SysOrder sysOrder = sysOrders.get(0);
            //如果为空
            if (StringUtil.isBlank(sysOrder.getExtensionUserId())) {
                //异步执行
                threadPoolTaskExecutor.execute(() -> {
                    SysOrder upOrder = new SysOrder();
                    upOrder.setOrderId(sysOrder.getOrderId());
                    upOrder.setExtensionUserId(userId);
                    sysOrderService.updateSysOrderByOrderId(upOrder);
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


    @GetMapping()
    @com.ruoyi.common.annotation.Log(title = "视频首页", businessType = BusinessType.QUERY)
    public String index(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        String user = StringUtil.isBlank(userid) ? "" : userid;
        if (Global.isMock()) {
            return redirect(userid, modelmap);
        }
        SysWebMain webMain = new SysWebMain();
        webMain.setMainStatus(WebMainStatus.OK.getCode());
        List<SysWebMain> list = sysWebMainService.selectSysWebMainList(webMain);
        if (!CollectionUtils.isEmpty(list)) {
            int size = list.size();
            SysWebMain item;
            if (size == 1) {
                item = list.get(0);
            } else {
                int i = RandomUtil.randomInt(0, size - 1);
                item = list.get(i);
            }
            String url = item.getMainUrl() + "/pron/redirect?userid=" + user;
            LOGGER.info("redirect.url:{}", url);
            return "redirect:" + url;
        }
        return redirect(userid, modelmap);
    }

    private void xxx(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        LOGGER.info("userId:{}", userid);
        ShipinDTO shipinDTO = new ShipinDTO();
        PageHelper.startPage(1, 12, StringUtil.EMPTY_STRING);
        List<ShipinDTO> list = shipinFacade.selectShipinDTOList(shipinDTO);
        convert(list);
        list.sort((o1, o2) -> o2.getCreateTime().compareTo(o1.getCreateTime()));
        modelmap.addAttribute("list", list);
        getCategory(modelmap);
    }

    private void getCategory(ModelMap modelmap) {
        SysCategory sysCategory = new SysCategory();
        sysCategory.setParentId(100L);
        List<SysCategory> categoryList = categoryService.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
    }


    @GetMapping("/category")
    @com.ruoyi.common.annotation.Log(title = "前台类目首页", businessType = BusinessType.QUERY)
    public String category(@RequestParam(value = "categoryId") Long categoryId, @RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        LOGGER.info("user:{},categoryId:{}", userid, categoryId);
        getCategory(modelmap);
        SysCategory sysCategory = categoryService.selectDeptById(categoryId);
        if (sysCategory == null) {
            modelmap.addAttribute("category", new SysCategory());
        } else {
            modelmap.addAttribute("category", sysCategory);
        }
        return prefix + "/category";
    }


    @GetMapping("/detail")
    @com.ruoyi.common.annotation.Log(title = "视频详情页面", businessType = BusinessType.QUERY)
    public String detail(@RequestParam(value = "id") Long id,
                         @RequestParam(value = "userid", required = false) String userid,
                         @RequestParam(value = "author", required = false) String author,
                         ModelMap modelmap) {
        LOGGER.info("user:{},id:{},author:{}", userid, id, author);
        ShipinDTO shipin = shipinFacade.selectShipinDTOById(id);
        if (shipin != null) {
            convert(new Date(), shipin);
            modelmap.put("shipin", shipin);
            SysCategory category = categoryService.selectDeptById(shipin.getCategoryId().longValue());
            if (category != null) {
                modelmap.put("category", category);
            }
            //异步执行浏览加1
            threadPoolTaskExecutor.execute(() -> shipinFacade.updateClickPlus(shipin.getId().longValue()));
        }

        PageHelper.startPage(1, 12, StringUtil.EMPTY_STRING);
        List<ShipinDTO> list = shipinFacade.selectShipinDTOList(new ShipinDTO());
        convert(list);
        modelmap.addAttribute("list", list);
        getCategory(modelmap);
        //sys.tradeType
        String tradeType = configService.selectConfigByKey("sys.tradeType");
        modelmap.addAttribute("wxPayUrl", Global.getWxPayUrl() + "?tradeType=" + tradeType);
        return prefix + "/detail";
    }


    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ShipinDTO shipinDTO) {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String orderByClause = " create_time desc ";
        TPageResult<ShipinDTO> result = shipinFacade.queryPage(pageNum, pageSize, shipinDTO, orderByClause);
        List<ShipinDTO> list = result.getValues();
        convert(list);
        TableDataInfo dataTable = getDataTable(list);
        dataTable.setTotal(result.getTotalRows());
        return dataTable;
    }


    @PostMapping("/byCategoryList")
    @ResponseBody
    public TableDataInfo byCategoryList(ShipinDTO shipinDTO) {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String orderByClause = " create_time desc ";
        TPageResult<ShipinDTO> result = shipinFacade.queryPage(pageNum, pageSize, shipinDTO, orderByClause);
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


    @GetMapping("/pagination")
    public String pagination() {
        return prefix + "/pagination";
    }

    @GetMapping("/tips")
    @com.ruoyi.common.annotation.Log(title = "投诉页面", businessType = BusinessType.QUERY)

    public String tips(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        return prefix + "/tips";
    }

    @GetMapping("/audit")
    @com.ruoyi.common.annotation.Log(title = "举报页面", businessType = BusinessType.QUERY)
    public String audit(@RequestParam(value = "userid", required = false) String userid, ModelMap modelmap) {
        return prefix + "/audit";
    }

    @GetMapping("/sub")
    @com.ruoyi.common.annotation.Log(title = "提交请求", businessType = BusinessType.QUERY)
    public String success(@RequestParam(value = "userid", required = false) String userid,
                          HttpServletRequest request,
                          ModelMap modelmap) {

        threadPoolTaskExecutor.execute(() -> {
            TsDTO tsDTO = new TsDTO();
            tsDTO.setOpenId(SessionContext.getOpenId());
            tsDTO.setUserid(SessionContext.getUserId());
            tsDTO.setIp(IpUtils.getIpAddr(request));
            tsService.insertTs(tsDTO);
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

}





