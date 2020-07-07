package com.ruoyi.system.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.VideoFacade;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.system.client.VideoFacadeClient;
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
    public List<VideoDTO> selectVideoDTOList(VideoDTO item) {
        return videoFacade.selectVideoDTOList(item);
    }

}
