package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.VideoFacade;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.web.client.VideoFacadeClient;
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
    public VideoDTO selectVideoDTOById(Long id) {
        return videoFacade.selectVideoDTOById(id);
    }

    @Override
    public int updateClickPlus(Long id) {
        return videoFacade.updateClickPlus(id);
    }

    @Override
    public List<VideoDTO> selectVideoDTOList(VideoDTO item) {
        return videoFacade.selectVideoDTOList(item);
    }

    @Override
    public int count(VideoDTO item) {
        return videoFacade.count(item);
    }

    @Override
    public int insertVideoDTO(VideoDTO item) {
        return videoFacade.insertVideoDTO(item);
    }

    @Override
    public int updateVideoDTO(VideoDTO item) {
        return videoFacade.updateVideoDTO(item);
    }

    @Override
    public TPageResult<VideoDTO> queryPage(int start, int rows, VideoDTO videoDTO, String orderByClause) {
        return videoFacade.queryPage(start, rows, videoDTO, orderByClause);
    }


}
