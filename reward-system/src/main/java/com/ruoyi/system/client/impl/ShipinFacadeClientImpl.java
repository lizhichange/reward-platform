package com.ruoyi.system.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.VideoFacade;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.system.client.ShipinFacadeClient;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class ShipinFacadeClientImpl implements ShipinFacadeClient {
    @Reference(version = "1.0.0", check = false)
    VideoFacade videoFacade;

    @Override
    public List<VideoDTO> selectShipinDTOList(VideoDTO item) {
        return videoFacade.selectShipinDTOList(item);
    }

}
