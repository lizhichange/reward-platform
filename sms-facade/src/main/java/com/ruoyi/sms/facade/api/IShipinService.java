package com.ruoyi.sms.facade.api;


import com.ruoyi.sms.facade.dto.ShipinDTO;

import java.util.List;

/**
 * 公共片库Service接口
 *
 * @author ruoyi
 * @date 2020-03-17
 */
public interface IShipinService {
    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    public ShipinDTO selectShipinDTOById(Long id);

    /**
     * 查询公共片库列表
     *
     * @param item 公共片库
     * @return 公共片库集合
     */
    public List<ShipinDTO> selectShipinDTOList(ShipinDTO item);

    /**
     * 新增公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    public int insertShipinDTO(ShipinDTO item);

    /**
     * 修改公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    public int updateShipinDTO(ShipinDTO item);

    /**
     * 批量删除公共片库
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteShipinDTOByIds(String ids);

    /**
     * 删除公共片库信息
     *
     * @param id 公共片库ID
     * @return 结果
     */
    public int deleteShipinDTOById(Long id);
    }
