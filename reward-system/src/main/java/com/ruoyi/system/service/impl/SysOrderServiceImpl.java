package com.ruoyi.system.service.impl;

import com.google.common.collect.Lists;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.sequence.ConcurrentSequence;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.SysOrder;
import com.ruoyi.system.domain.ext.ExtSysOrder;
import com.ruoyi.system.domain.ext.SysOrderExample;
import com.ruoyi.system.mapper.ExtSysOrderMapper;
import com.ruoyi.system.mapper.SysOrderMapper;
import com.ruoyi.system.service.ISysOrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 订单列表Service业务层处理
 *
 * @author ruoyi
 * @date 2020-03-26
 */
@Service
public class SysOrderServiceImpl implements ISysOrderService {
    @Autowired
    private SysOrderMapper sysOrderMapper;

    @Autowired
    ConcurrentSequence concurrentSequence;
    @Autowired
    private ExtSysOrderMapper extSysOrderMapper;

    /**
     * 查询订单列表
     *
     * @param id 订单列表ID
     * @return 订单列表
     */
    @Override
    public SysOrder selectSysOrderById(Long id) {
        return sysOrderMapper.selectSysOrderById(id);
    }

    @Override
    public List<SysOrder> selectSysOrder(SysOrder extSysOrder) {
        SysOrderExample example = new SysOrderExample();
        example.createCriteria().andGoodsIdEqualTo(extSysOrder.getGoodsId()).andOpenIdEqualTo(extSysOrder.getOpenId());
        List<ExtSysOrder> list = extSysOrderMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(list)) {
            return Lists.newArrayList();
        }
        return list.stream().map(item -> {
            SysOrder sysOrder = new SysOrder();
            BeanUtils.copyProperties(item, sysOrder);
            return sysOrder;
        }).collect(Collectors.toList());
    }

    @Override
    public long countByExample(ExtSysOrder extSysOrder) {
        SysOrderExample example = new SysOrderExample();
        SysOrderExample.Criteria criteria = example.createCriteria();
        if (extSysOrder.getGoodsId() != null) {
            criteria.andGoodsIdEqualTo(extSysOrder.getGoodsId());
        }
        return extSysOrderMapper.countByExample(example);

    }

    /**
     * 查询订单列表列表
     *
     * @param sysOrder 订单列表
     * @return 订单列表
     */
    @Override
    public List<SysOrder> selectSysOrderList(SysOrder sysOrder) {
        return sysOrderMapper.selectSysOrderList(sysOrder);
    }

    /**
     * 新增订单列表
     *
     * @param sysOrder 订单列表
     * @return 结果
     */
    @Override
    public int insertSysOrder(SysOrder sysOrder) {
        sysOrder.setOrderId(concurrentSequence.nextId().toString());
        sysOrder.setCreateTime(DateUtils.getNowDate());
        return sysOrderMapper.insertSysOrder(sysOrder);
    }

    /**
     * 修改订单列表
     *
     * @param sysOrder 订单列表
     * @return 结果
     */
    @Override
    public int updateSysOrder(SysOrder sysOrder) {
        sysOrder.setUpdateTime(DateUtils.getNowDate());
        return sysOrderMapper.updateSysOrder(sysOrder);
    }

    @Override
    public int updateSysOrderByOrderId(SysOrder sysOrder) {
        sysOrder.setUpdateTime(DateUtils.getNowDate());
        return sysOrderMapper.updateSysOrderByOrderId(sysOrder);
    }


    /**
     * 删除订单列表对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysOrderByIds(String ids) {
        return sysOrderMapper.deleteSysOrderByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除订单列表信息
     *
     * @param id 订单列表ID
     * @return 结果
     */
    @Override
    public int deleteSysOrderById(Long id) {
        return sysOrderMapper.deleteSysOrderById(id);
    }
}
