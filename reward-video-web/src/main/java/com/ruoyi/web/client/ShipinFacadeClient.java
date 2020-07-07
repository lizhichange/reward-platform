package com.ruoyi.web.client;

import com.ruoyi.reward.facade.dto.VideoDTO;
import org.near.servicesupport.result.TPageResult;

import java.util.List;

public interface ShipinFacadeClient {
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

}
