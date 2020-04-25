package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.web.client.ShipinFacadeClient;
import com.ruoyi.reward.facade.api.IShipinFacade;
import com.ruoyi.reward.facade.dto.ShipinDTO;
import org.near.servicesupport.result.TPageResult;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ShipinFacadeImpl implements ShipinFacadeClient {

    @Reference(version = "1.0.0", check = false)
    IShipinFacade shipinFacade;

    @Override
    public ShipinDTO selectShipinDTOById(Long id) {
        return shipinFacade.selectShipinDTOById(id);
    }

    @Override
    public int updateClickPlus(Long id) {
        return shipinFacade.updateClickPlus(id);
    }

    @Override
    public List<ShipinDTO> selectShipinDTOList(ShipinDTO item) {
        return shipinFacade.selectShipinDTOList(item);
    }

    @Override
    public int count(ShipinDTO item) {
        return shipinFacade.count(item);
    }

    @Override
    public int insertShipinDTO(ShipinDTO item) {
        return shipinFacade.insertShipinDTO(item);
    }

    @Override
    public int updateShipinDTO(ShipinDTO item) {
        return shipinFacade.updateShipinDTO(item);
    }

    @Override
    public TPageResult<ShipinDTO> queryPage(int start, int rows, ShipinDTO shipinDTO, String orderByClause) {
        return shipinFacade.queryPage(start, rows, shipinDTO, orderByClause);
    }


}
