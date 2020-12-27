package com.ruoyi.system.biz.processor;

import com.google.common.collect.Maps;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import org.springframework.context.support.ApplicationObjectSupport;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.Map;

/**
 * 订单流程变更业务注册
 *
 * @author lizhi
 */
@Component
public class OrderStatusDispatcher extends ApplicationObjectSupport {

    private Map<OrderStatusType, UserOrderStatusProcessor> map = Maps.newConcurrentMap();

    /**
     * Init.
     */
    @PostConstruct
    public void init() {
        Map<String, UserOrderStatusProcessor> handles = getApplicationContext()
                .getBeansOfType(UserOrderStatusProcessor.class);
        for (UserOrderStatusProcessor handle : handles.values()) {
            map.put(handle.getType(), handle);
        }
    }

    /**
     * Clear.
     */
    @PreDestroy
    public void clear() {
        map.clear();
    }

    /**
     * @param type the type
     * @return the user order status handle
     */
    public UserOrderStatusProcessor get(OrderStatusType type) {
        return map.get(type);
    }

}
