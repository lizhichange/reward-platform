package com.ruoyi.system.scheduled;

import com.ruoyi.sms.facade.enums.OrderStatusType;
import com.ruoyi.system.domain.ext.ExtSysOrder;
import com.ruoyi.system.domain.ext.SysOrderExample;
import com.ruoyi.system.mapper.ExtSysOrderMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @author sunflower
 */
@Component
@Slf4j
public class WeChatOrderStatusCheckScheduled {

    private static final int PAGE = 1;
    private static final int ROWS = 100;
    @Autowired
    ExtSysOrderMapper extSysOrderMapper;

    public void execute() {
        SysOrderExample sysOrder = new SysOrderExample();
        sysOrder.setOffset(1);
        sysOrder.setLimit(100);
        SysOrderExample.Criteria criteria = sysOrder.createCriteria();
        criteria.andStatusEqualTo(Integer.valueOf(OrderStatusType.PAY_ING.getCode()));
        List<ExtSysOrder> list = extSysOrderMapper.selectByExample(sysOrder);
        if (CollectionUtils.isEmpty(list)) {
            return;
        }
        log.info("开始同步微信支付订单状态，检查数据{}", list.size());
        for (ExtSysOrder order : list) {

        }
    }
}
