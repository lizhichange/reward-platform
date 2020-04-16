package com.ruoyi.reward.facade.api;


import com.ruoyi.reward.facade.dto.ShipinDTO;
import org.near.servicesupport.result.TPageResult;

import java.util.List;

/**
 * 公共片库Service接口
 *
 * @author ruoyi
 * @date 2020-03-17
 */
public interface IShipinFacade {
    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    ShipinDTO selectShipinDTOById(Long id);

    int updateClickPlus(Long id);

    /**
     * 查询公共片库列表
     *
     * @param item 公共片库
     * @return 公共片库集合
     */
    List<ShipinDTO> selectShipinDTOList(ShipinDTO item);

    int count(ShipinDTO item);

    /**
     * 新增公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    int insertShipinDTO(ShipinDTO item);

    /**
     * 修改公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    int updateShipinDTO(ShipinDTO item);

    TPageResult<ShipinDTO> queryPage(int start, int rows, ShipinDTO shipinDTO, String orderByClause);

    /**
     * 批量删除公共片库
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteShipinDTOByIds(String ids);

    /**
     * 删除公共片库信息
     *
     * @param id 公共片库ID
     * @return 结果
     */
    int deleteShipinDTOById(Long id);
}
