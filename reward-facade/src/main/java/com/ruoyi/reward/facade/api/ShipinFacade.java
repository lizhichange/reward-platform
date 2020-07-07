package com.ruoyi.reward.facade.api;


import com.ruoyi.reward.facade.dto.VideoDTO;
import org.near.servicesupport.result.TPageResult;

import java.util.List;

/**
 * 公共片库Service接口
 *
 * @author ruoyi
 * @date 2020-03-17
 */
public interface ShipinFacade {
    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    VideoDTO selectShipinDTOById(Long id);

    int updateClickPlus(Long id);

    /**
     * 查询公共片库列表
     *
     * @param item 公共片库
     * @return 公共片库集合
     */
    List<VideoDTO> selectShipinDTOList(VideoDTO item);

    int count(VideoDTO item);

    /**
     * 新增公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    int insertShipinDTO(VideoDTO item);

    /**
     * 修改公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    int updateShipinDTO(VideoDTO item);

    TPageResult<VideoDTO> queryPage(int start, int rows, VideoDTO videoDTO, String orderByClause);

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
