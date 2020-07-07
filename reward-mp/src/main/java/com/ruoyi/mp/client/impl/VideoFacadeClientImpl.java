package com.ruoyi.mp.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.mp.client.VideoFacadeClient;
import com.ruoyi.reward.facade.api.VideoFacade;
import com.ruoyi.reward.facade.dto.VideoDTO;
import org.near.servicesupport.result.TPageResult;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class VideoFacadeClientImpl implements VideoFacadeClient {

    @Reference(version = "1.0.0", check = false)
    VideoFacade videoFacade;

    @Override
    public VideoDTO selectShipinDTOById(Long id) {
        return videoFacade.selectShipinDTOById(id);
    }

    @Override
    public int updateClickPlus(Long id) {
        return videoFacade.updateClickPlus(id);
    }

    @Override
    public List<VideoDTO> selectShipinDTOList(VideoDTO item) {
        return videoFacade.selectShipinDTOList(item);
    }

    @Override
    public int count(VideoDTO item) {
        return videoFacade.count(item);
    }

    @Override
    public int insertShipinDTO(VideoDTO item) {
        return videoFacade.insertShipinDTO(item);
    }

    @Override
    public int updateShipinDTO(VideoDTO item) {
        return videoFacade.updateShipinDTO(item);
    }

    @Override
    public TPageResult<VideoDTO> queryPage(int start, int rows, VideoDTO videoDTO, String orderByClause) {
        return videoFacade.queryPage(start, rows, videoDTO, orderByClause);
    }


}
