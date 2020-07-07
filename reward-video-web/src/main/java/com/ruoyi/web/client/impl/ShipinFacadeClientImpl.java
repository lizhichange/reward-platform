package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.web.client.ShipinFacadeClient;
import com.ruoyi.reward.facade.api.ShipinFacade;
import org.near.servicesupport.result.TPageResult;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class ShipinFacadeClientImpl implements ShipinFacadeClient {

    @Reference(version = "1.0.0", check = false)
    ShipinFacade shipinFacade;

    @Override
    public VideoDTO selectShipinDTOById(Long id) {
        return shipinFacade.selectShipinDTOById(id);
    }

    @Override
    public int updateClickPlus(Long id) {
        return shipinFacade.updateClickPlus(id);
    }

    @Override
    public List<VideoDTO> selectShipinDTOList(VideoDTO item) {
        return shipinFacade.selectShipinDTOList(item);
    }

    @Override
    public int count(VideoDTO item) {
        return shipinFacade.count(item);
    }

    @Override
    public int insertShipinDTO(VideoDTO item) {
        return shipinFacade.insertShipinDTO(item);
    }

    @Override
    public int updateShipinDTO(VideoDTO item) {
        return shipinFacade.updateShipinDTO(item);
    }

    @Override
    public TPageResult<VideoDTO> queryPage(int start, int rows, VideoDTO videoDTO, String orderByClause) {
        return shipinFacade.queryPage(start, rows, videoDTO, orderByClause);
    }


}
