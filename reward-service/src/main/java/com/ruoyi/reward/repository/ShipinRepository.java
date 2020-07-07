package com.ruoyi.reward.repository;

import com.ruoyi.reward.facade.dto.VideoDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface ShipinRepository {

    List<VideoDTO> queryPage(int start, int rows, VideoDTO videoDTO, String orderByClause);

    long count(VideoDTO videoDTO);


}
