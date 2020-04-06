package com.ruoyi.system.facade;


import com.alibaba.dubbo.config.annotation.Service;
import com.ruoyi.sms.facade.IAccountFacade;
import com.ruoyi.sms.facade.ISysOrderFacade;
import com.ruoyi.sms.facade.dto.SysOrderDTO;
import com.ruoyi.sms.facade.enums.OrderStatusType;
import com.ruoyi.system.biz.OrderStatusDispatcher;
import com.ruoyi.system.biz.UserOrderStatusProcessor;
import com.ruoyi.system.mapper.AccountMapper;
import org.near.toolkit.common.EnumUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.util.List;


/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2020-04-06
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class AccountFacadeImpl implements IAccountFacade {
    @Autowired
    private AccountMapper accountMapper;
    @Autowired
    OrderStatusDispatcher orderStatusDispatcher;
    @Autowired
    ISysOrderFacade sysOrderFacade;

    @Override
    @Transactional
    public void take(SysOrderDTO dto) {
        Assert.notNull(dto, "dto is not null");
        Integer status = dto.getStatus();
        Assert.notNull(status, "status is not null");
        Assert.notNull(dto.getOrderId(), "dto is not null");
        sysOrderFacade.updateSysOrderByOrderId(dto);


        SysOrderDTO ext = new SysOrderDTO();
        ext.setOrderId(dto.getOrderId());
        List<SysOrderDTO> result = sysOrderFacade.selectSysOrderListExt(ext);
        if (!CollectionUtils.isEmpty(result)) {
            SysOrderDTO resp = result.get(0);
            OrderStatusType type = EnumUtil.queryByCode(resp.getStatus().toString(), OrderStatusType.class);
            UserOrderStatusProcessor processor = orderStatusDispatcher.get(type);
            if (processor != null) {
                processor.execute(resp);
            }
        }
    }
}