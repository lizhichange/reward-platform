package com.ruoyi.reward.repository;

import com.ruoyi.reward.facade.dto.ShipinDTO;

import java.util.List;

/**
 * @author sunflower
 */
public interface ShipinRepository {

    List<ShipinDTO> queryPage(int start, int rows, ShipinDTO shipinDTO , String orderByClause);

    long count(ShipinDTO shipinDTO);


}
