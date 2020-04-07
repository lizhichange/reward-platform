package com.ruoyi.sms.repository;

import com.ruoyi.sms.facade.dto.ShipinDTO;

import java.util.List;

public interface ShipinRepository {

    List<ShipinDTO> queryPage(int start, int rows, String name);

    long count( String name);


}
