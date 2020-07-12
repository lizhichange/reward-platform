package com.ruoyi.system.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.collect.Lists;
import com.ruoyi.reward.facade.api.SysOrderFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.system.domain.SysOrder;
import com.ruoyi.system.domain.ExtSysOrder;
import com.ruoyi.system.domain.ExtSysOrderExample;
import com.ruoyi.system.mapper.ExtSysOrderMapper;
import com.ruoyi.system.service.ISysOrderService;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author sunflower
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
@Slf4j
public class SysOrderFacadeImpl implements SysOrderFacade {

    @Autowired
    ISysOrderService sysOrderService;

    @Autowired
    ExtSysOrderMapper extSysOrderMapper;

    @Override
    public SysOrderDTO selectSysOrderById(Long id) {
        return null;
    }

    @Override
    public SysOrderDTO selectSysOrderByOrderId(String orderId) {
        ExtSysOrderExample example = new ExtSysOrderExample();
        example.createCriteria().andOrderIdEqualTo(orderId);
        List<ExtSysOrder> list = extSysOrderMapper.selectByExample(example);
        return convertOrder(list).get(0);

    }

    @Override
    public List<SysOrderDTO> selectSysOrderList(SysOrderDTO sysOrder) {
        SysOrder item = new SysOrder();
        BeanUtils.copyProperties(sysOrder, item);
        List<SysOrder> list = sysOrderService.selectSysOrderList(item);
        return convert(list);
    }

    @Override
    public List<SysOrderDTO> selectSysOrder(SysOrderDTO extSysOrder) {
        SysOrder item = new SysOrder();
        BeanUtils.copyProperties(extSysOrder, item);
        List<SysOrder> list = sysOrderService.selectSysOrder(item);
        return convert(list);
    }

    private List<SysOrderDTO> convert(List<SysOrder> list) {
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
    public List<SysOrderDTO> selectSysOrderListExt(SysOrderDTO sysOrder) {

        ExtSysOrderExample example = new ExtSysOrderExample();
        if (sysOrder.getOffset() != null) {
            example.setOffset(sysOrder.getOffset());
        }
        if (sysOrder.getLimit() != null) {
            example.setLimit(sysOrder.getLimit());
        }
        ExtSysOrderExample.Criteria criteria = example.createCriteria();
        if (Objects.nonNull(sysOrder.getStatus())) {
            criteria.andStatusEqualTo(sysOrder.getStatus());
        }

        if (StringUtil.isNotBlank(sysOrder.getOrderId())) {
            criteria.andOrderIdEqualTo(sysOrder.getOrderId());
        }
        if (StringUtil.isNotBlank(sysOrder.getOpenId())) {
            criteria.andOpenIdEqualTo(sysOrder.getOpenId());
        }

        List<ExtSysOrder> list = extSysOrderMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(list)) {
            return Lists.newArrayList();
        }
        return convertOrder(list);

    }

    private List<SysOrderDTO> convertOrder(List<ExtSysOrder> list) {
        return list.stream().map(it -> {
            SysOrderDTO dto = new SysOrderDTO();
            BeanUtils.copyProperties(it, dto);
            return dto;
        }).collect(Collectors.toList());
    }

    @Override
    public int insertSysOrder(SysOrderDTO sysOrder) {
        SysOrder item = new SysOrder();
        BeanUtils.copyProperties(sysOrder, item);
        return sysOrderService.insertSysOrder(item);
    }

    @Override
    public int updateSysOrder(SysOrderDTO sysOrder) {
        SysOrder item = new SysOrder();
        BeanUtils.copyProperties(sysOrder, item);
        return sysOrderService.updateSysOrder(item);
    }

    @Override
    public int updateSysOrderByOrderId(SysOrderDTO sysOrder) {
        SysOrder item = new SysOrder();
        BeanUtils.copyProperties(sysOrder, item);
        return sysOrderService.updateSysOrderByOrderId(item);
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
