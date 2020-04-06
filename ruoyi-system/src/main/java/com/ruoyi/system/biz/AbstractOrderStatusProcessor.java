/**
 * The MIT License
 * Copyright (c) 2014-2016 Ilkka Seppälä
 */
package com.ruoyi.system.biz;

import com.ruoyi.sms.facade.dto.SysOrderDTO;
import lombok.extern.slf4j.Slf4j;


/**
 * 公共业务抽象处理器
 *
 * @author lizhi
 */
@Slf4j
public abstract class AbstractOrderStatusProcessor implements UserOrderStatusProcessor {


    /**
     * Get long.
     *
     * @param orderInfo the order info
     * @return 获取返利金额 long
     */
    public Long get(SysOrderDTO orderInfo) {
        //佣金配置
        Integer snapshot = 20;
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
