package com.ruoyi.system.biz;


import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;

/**
 * The interface User order status processor.
 *
 * @author lizhi
 */
public interface UserOrderStatusProcessor {

    /**
     * 查询订单状态枚举信息
     *
     * @return the type
     */
    OrderStatusType getType();

    /**
     * 执行
     *
     * @param orderInfo the order info
     * @return the long
     */
    Long execute(SysOrderDTO orderInfo);


}
