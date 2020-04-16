/**
 * The MIT License
 * Copyright (c) 2014-2016 Ilkka Seppälä
 */
package com.ruoyi.system.biz;

import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.system.service.ISysConfigService;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * 公共业务抽象处理器
 *
 * @author lizhi
 */
@Slf4j
public abstract class AbstractOrderStatusProcessor implements UserOrderStatusProcessor {


    @Autowired
    ISysConfigService configService;

    /**
     * Get long.
     *
     * @param orderInfo the order info
     * @return 获取返利金额 long
     */
    public Long get(SysOrderDTO orderInfo) {
        //佣金配置 百分比20
        Integer snapshot = 20;
        String configByKey = configService.selectConfigByKey("sys.order.rebate");
        if (StringUtil.isNotBlank(configByKey)) {
            snapshot = Integer.parseInt(configByKey);
        }
        //支付金额
        Integer promotionAmount = orderInfo.getMoney();
        log.info("配置用户百分比:{},订单金额:{}", snapshot, promotionAmount);
        Long amount = (long) ((promotionAmount * snapshot) / 100);
        log.info("预计返利金额:{}", amount);
        return amount;
    }


    protected abstract void confuseTarget(SysOrderDTO target);

    protected abstract void stealTheItem(SysOrderDTO target);


}
