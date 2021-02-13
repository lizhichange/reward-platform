package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.VideoRelPriceFacade;
import com.ruoyi.reward.facade.dto.VideoRelPriceDTO;
import com.ruoyi.web.client.VideoRelPriceFacadeClient;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class VideoRelPriceFacadeClientImpl implements VideoRelPriceFacadeClient {
    @Reference(version = "1.0.0", check = false)
    VideoRelPriceFacade videoRelPriceFacade;

    @Override
    public List<VideoRelPriceDTO> selectVideoDTOList(VideoRelPriceDTO item) {
        return videoRelPriceFacade.selectVideoDTOList(item);
    }
}
