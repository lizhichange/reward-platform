package com.ruoyi.web.controller.statistics;

import com.ruoyi.common.core.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 打赏统计
 *
 * @author ruoyi
 */
@Controller
@RequestMapping("/statistics/statistics")
public class StatisticsController extends BaseController {

    private String prefix = "statistics/statistics";


    @GetMapping()
    public String statistics() {
        return prefix + "/index";
    }
}
