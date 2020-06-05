package com.ruoyi.web.controller.statistics;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.system.domain.ExtSysOrder;
import com.ruoyi.system.domain.SysOrder;
import com.ruoyi.system.service.ISysOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 打赏记录
 *
 * @author ruoyi
 */
@Controller
@RequestMapping("/statistics/record")
public class StatisticsRecordController extends BaseController {

    private String prefix = "statistics/record";
    @Autowired
    ISysOrderService sysOrderService;

    @GetMapping()
    public String record(ModelMap modelMap) {
        String loginName = ShiroUtils.getLoginName();
        ExtSysOrder extSysOrder = new ExtSysOrder();
        extSysOrder.setExtensionUserId(loginName);
        extSysOrder.setStatus(Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
        long count = sysOrderService.countByExample(extSysOrder);
        modelMap.put("dayCount", 1);
        modelMap.put("dayMoney", 1);
        modelMap.put("yesterdayCount", 1);
        modelMap.put("yesterdayMoney", 1);
        modelMap.put("historyCount", 1);
        modelMap.put("historyMoney", 1);
        return prefix + "/index";
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
