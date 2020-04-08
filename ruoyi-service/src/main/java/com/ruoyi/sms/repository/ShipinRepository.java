package com.ruoyi.sms.repository;

import com.ruoyi.sms.facade.dto.ShipinDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface ShipinRepository {

    List<ShipinDTO> queryPage(int start, int rows, String name, String orderByClause);

    long count(String name);


}
