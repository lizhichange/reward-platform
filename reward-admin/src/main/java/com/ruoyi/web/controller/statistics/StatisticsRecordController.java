package com.ruoyi.web.controller.statistics;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.system.domain.SysOrder;
import com.ruoyi.system.service.SysOrderService;
import org.near.toolkit.model.Money;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

import static com.ruoyi.common.utils.DateUtils.YYYY_MM_DD;

/**
 * 打赏记录
 *
 * @author ruoyi
 */
@Controller
@RequestMapping("/statistics/record")
public class StatisticsRecordController extends BaseController {

    private final String prefix = "statistics/record";
    @Autowired
    SysOrderService sysOrderService;

    @GetMapping()
    public String record(ModelMap modelMap) {
        String loginName = ShiroUtils.getLoginName();
        String start = DateUtils.getDate() + " 00:00:00";
        String end = DateUtils.getDate() + " 23:59:59";
        long dayCount = sysOrderService.countStatus(start,
                end,
                loginName,
                Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
        modelMap.put("dayCount", dayCount);

        long dayMoney = sysOrderService.countMoney(start,
                end,
                loginName,
                Integer.valueOf(OrderStatusType.Y_PAY.getCode()));

        modelMap.put("dayMoney", convert(dayMoney));

        Date date = org.near.toolkit.common.DateUtils.addDays(new Date(), -1);
        start = DateUtils.parseDateToStr(YYYY_MM_DD, date) + " 00:00:00";
        end = DateUtils.parseDateToStr(YYYY_MM_DD, date) + " 23:59:59";
        long yesterdayCount = sysOrderService.countStatus(start,
                end,
                loginName,
                Integer.valueOf(OrderStatusType.Y_PAY.getCode()));

        modelMap.put("yesterdayCount", yesterdayCount);

        long yesterdayMoney = sysOrderService.countMoney(start,
                end,
                loginName,
                Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
        modelMap.put("yesterdayMoney", convert(yesterdayMoney));


        long historyCount = sysOrderService.countStatus(null,
                null,
                loginName,
                Integer.valueOf(OrderStatusType.Y_PAY.getCode()));


        modelMap.put("historyCount", historyCount);

        long historyMoney = sysOrderService.countMoney(null,
                null,
                loginName,
                Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
        modelMap.put("historyMoney", convert(historyMoney));
        return prefix + "/index";
    }

    String convert(long money) {
        Money amount = new Money();
        amount.setCent(money);
        return amount.toString();
    }

    /**
     * 查询订单列表列表
     */
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysOrder sysOrder) {
        startPage();
        String loginName = ShiroUtils.getLoginName();
        sysOrder.setExtensionUserId(loginName);
        List<SysOrder> list = sysOrderService.selectSysOrderList(sysOrder);
        return getDataTable(list);
    }
}
