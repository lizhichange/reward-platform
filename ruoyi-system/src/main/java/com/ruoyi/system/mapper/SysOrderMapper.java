package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysOrder;

import java.util.List;

/**
 * 订单列表Mapper接口
 * 
 * @author ruoyi
 * @date 2020-03-26
 */
public interface SysOrderMapper 
{
    /**
     * 查询订单列表
     * 
     * @param id 订单列表ID
     * @return 订单列表
     */
    public SysOrder selectSysOrderById(Long id);

    /**
     * 查询订单列表列表
     * 
     * @param sysOrder 订单列表
     * @return 订单列表集合
     */
    public List<SysOrder> selectSysOrderList(SysOrder sysOrder);

    /**
     * 新增订单列表
     * 
     * @param sysOrder 订单列表
     * @return 结果
     */
    public int insertSysOrder(SysOrder sysOrder);

    /**
     * 修改订单列表
     * 
     * @param sysOrder 订单列表
     * @return 结果
     */
    public int updateSysOrder(SysOrder sysOrder);

    public int updateSysOrderByOrderId(SysOrder sysOrder);

    /**
     * 删除订单列表
     * 
     * @param id 订单列表ID
     * @return 结果
     */
    public int deleteSysOrderById(Long id);

    /**
     * 批量删除订单列表
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysOrderByIds(String[] ids);
}
