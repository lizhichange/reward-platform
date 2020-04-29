package com.ruoyi.system.facade;


import com.alibaba.dubbo.config.annotation.Service;
import com.ruoyi.reward.facade.api.AccountFacade;
import com.ruoyi.reward.facade.api.SysOrderFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.system.CuratorClientUtils;
import com.ruoyi.system.biz.OrderStatusDispatcher;
import com.ruoyi.system.biz.UserOrderStatusProcessor;
import lombok.extern.slf4j.Slf4j;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.recipes.locks.InterProcessMutex;
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
@Slf4j
public class AccountFacadeImpl implements AccountFacade {

    @Autowired
    OrderStatusDispatcher orderStatusDispatcher;
    @Autowired
    SysOrderFacade sysOrderFacade;
    @Autowired
    CuratorClientUtils curatorClientUtils;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void take(SysOrderDTO dto) throws Exception {
        CuratorFramework curatorFramework = curatorClientUtils.getCuratorFramework();
        InterProcessMutex interProcessMutex = new InterProcessMutex(
                curatorFramework, CuratorClientUtils.ROOT_LOCKS);
        try {
            //加锁
            interProcessMutex.acquire();
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
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw e;
        } finally {
            //判断是否持有锁 进而进行锁是否释放的操作
            if (interProcessMutex.isAcquiredInThisProcess()) {
                try {
                    interProcessMutex.release();
                    log.info("释放锁成功,成功数据模型dto:{}", dto);
                } catch (Exception e) {
                    log.error(e.getMessage(), e);
                }

            }
        }
    }
}