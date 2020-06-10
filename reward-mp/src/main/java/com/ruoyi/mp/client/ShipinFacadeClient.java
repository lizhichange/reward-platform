package com.ruoyi.mp.client;

import com.ruoyi.reward.facade.dto.ShipinDTO;
import org.near.servicesupport.result.TPageResult;

import java.util.List;

public interface ShipinFacadeClient {
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

}
