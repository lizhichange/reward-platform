package com.ruoyi.reward.facade.api;


import com.ruoyi.reward.facade.dto.SysOrderDTO;

import java.util.List;

/**
 * 订单列表Service接口
 *
 * @author ruoyi
 * @date 2020-03-26
 */
public interface SysOrderFacade {
    /**
     * 查询订单列表
     *
     * @param id 订单列表ID
     * @return 订单列表
     */
    SysOrderDTO selectSysOrderById(Long id);

    SysOrderDTO selectSysOrderByOrderId(String orderId);

    /**
     * 查询订单列表列表
     *
     * @param sysOrder 订单列表
     * @return 订单列表集合
     */
    List<SysOrderDTO> selectSysOrderList(SysOrderDTO sysOrder);

    List<SysOrderDTO> selectSysOrder(SysOrderDTO extSysOrder);


    List<SysOrderDTO> selectSysOrderListExt(SysOrderDTO sysOrder);

    /**
     * 新增订单列表
     *
     * @param sysOrder 订单列表
     * @return 结果
     */
    int insertSysOrder(SysOrderDTO sysOrder);

    /**
     * 修改订单列表
     *
     * @param sysOrder 订单列表
     * @return 结果
     */
    int updateSysOrder(SysOrderDTO sysOrder);

    int updateSysOrderByOrderId(SysOrderDTO sysOrder);

    /**
     * 批量删除订单列表
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteSysOrderByIds(String ids);

    /**
     * 删除订单列表信息
     *
     * @param id 订单列表ID
     * @return 结果
     */
    int deleteSysOrderById(Long id);
}
