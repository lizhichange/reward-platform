package com.ruoyi.system.client;

import com.ruoyi.reward.facade.dto.VideoDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface VideoFacadeClient {
    List<VideoDTO> selectShipinDTOList(VideoDTO item);

}
