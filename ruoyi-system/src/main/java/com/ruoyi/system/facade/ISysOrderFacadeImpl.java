package com.ruoyi.system.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.collect.Lists;
import com.ruoyi.sms.facade.ISysOrderFacade;
import com.ruoyi.sms.facade.dto.SysOrderDTO;
import com.ruoyi.system.domain.SysOrder;
import com.ruoyi.system.service.ISysOrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author sunflower
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class ISysOrderFacadeImpl implements ISysOrderFacade {

    @Autowired
    ISysOrderService sysOrderService;

    @Override
    public SysOrderDTO selectSysOrderById(Long id) {
        return null;
    }

    @Override
    public List<SysOrderDTO> selectSysOrderList(SysOrderDTO sysOrder) {
        SysOrder item = new SysOrder();
        BeanUtils.copyProperties(sysOrder, item);
        List<SysOrder> list = sysOrderService.selectSysOrderList(item);

        if (CollectionUtils.isEmpty(list)) {
            return Lists.newArrayList();
        }

        return list.stream().map(it ->
        {
            SysOrderDTO dto = new SysOrderDTO();
            BeanUtils.copyProperties(it, dto);
            return dto;
        }).collect(Collectors.toList());
    }

    @Override
    public int insertSysOrder(SysOrderDTO sysOrder) {
        return 0;
    }

    @Override
    public int updateSysOrder(SysOrderDTO sysOrder) {
        SysOrder item = new SysOrder();
        BeanUtils.copyProperties(sysOrder, item);
        return sysOrderService.updateSysOrder(item);
    }

    @Override
    public int deleteSysOrderByIds(String ids) {
        return 0;
    }

    @Override
    public int deleteSysOrderById(Long id) {
        return 0;
    }
}
