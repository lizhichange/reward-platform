package com.ruoyi.web.controller.statistics;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.system.domain.ExtSysOrderTimeCount;
import com.ruoyi.system.service.SysOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/**
 * 打赏统计
 *
 * @author ruoyi
 */
@Controller
@RequestMapping("/statistics/statistics")
public class StatisticsController extends BaseController {

    private final String prefix = "statistics/statistics";

    @Autowired
    SysOrderService orderService;

    @GetMapping()
    public String statistics(ModelMap modelMap) {
        String loginName = ShiroUtils.getLoginName();
        String start = DateUtils.getDate() + " 00:00:00";
        String end = DateUtils.getDate() + " 23:59:59";
        List<ExtSysOrderTimeCount> list = orderService.selectGroupByTime(start, end, loginName, Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
        int[] item = new int[24];
        if (CollectionUtils.isEmpty(list)) {
            Arrays.fill(item, 0);
        } else {
            HashMap<String, Integer> hashMap = Maps.newHashMap();
            for (ExtSysOrderTimeCount count : list) {
                String[] s = split(count);
                String str = s[1];
                hashMap.put(str, count.getCount());
            }
            ExtSysOrderTimeCount max = list.stream().max((o1, o2) -> {
                if (o1.getCount() > o2.getCount()) {
                    return 1;
                } else {
                    return 0;
                }
            }).get();
            String[] split = split(max);
            ExtSysOrderTimeCount count = new ExtSysOrderTimeCount();
            count.setTime(split[1]);
            count.setCount(max.getCount());
            String string = JSON.toJSONString(count);
            modelMap.put("max", string);

            for (int i = 0; i < item.length; i++) {
                boolean b = hashMap.containsKey(String.valueOf(i));
                if (!b) {
                    item[i] = 0;
                } else {
                    item[i] = hashMap.get(String.valueOf(i));
                }
            }
        }

        modelMap.put("item", JSON.toJSON(item));
        return prefix + "/index";
    }

    private String[] split(ExtSysOrderTimeCount count) {
        return count.getTime().split(" ");
    }
}
