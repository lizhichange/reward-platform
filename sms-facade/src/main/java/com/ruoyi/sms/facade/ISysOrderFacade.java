package com.ruoyi.sms.facade;


import com.ruoyi.sms.facade.dto.SysOrderDTO;

import java.util.List;

/**
 * 订单列表Service接口
 *
 * @author ruoyi
 * @date 2020-03-26
 */
public interface ISysOrderFacade {
    /**
     * 查询订单列表
     *
     * @param id 订单列表ID
     * @return 订单列表
     */
    public SysOrderDTO selectSysOrderById(Long id);

    /**
     * 查询订单列表列表
     *
     * @param sysOrder 订单列表
     * @return 订单列表集合
     */
    public List<SysOrderDTO> selectSysOrderList(SysOrderDTO sysOrder);

    /**
     * 新增订单列表
     *
     * @param sysOrder 订单列表
     * @return 结果
     */
    public int insertSysOrder(SysOrderDTO sysOrder);

    /**
     * 修改订单列表
     *
     * @param sysOrder 订单列表
     * @return 结果
     */
    public int updateSysOrder(SysOrderDTO sysOrder);
    int updateSysOrderByOrderId(SysOrderDTO sysOrder);

    /**
     * 批量删除订单列表
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysOrderByIds(String ids);

    /**
     * 删除订单列表信息
     *
     * @param id 订单列表ID
     * @return 结果
     */
    public int deleteSysOrderById(Long id);
}
