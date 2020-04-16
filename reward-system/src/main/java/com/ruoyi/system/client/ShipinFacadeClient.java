package com.ruoyi.system.client;

import com.ruoyi.sms.facade.dto.ShipinDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface ShipinFacadeClient {
    List<ShipinDTO> selectShipinDTOList(ShipinDTO item);

}
