package com.ruoyi.reward.repository.impl;


import com.ruoyi.reward.convert.ShipinConvert;
import com.ruoyi.reward.domain.Shipin;
import com.ruoyi.reward.domain.ShipinExample;
import com.ruoyi.reward.facade.dto.ShipinDTO;
import com.ruoyi.reward.mapper.ShipinMapper;
import com.ruoyi.reward.repository.ShipinRepository;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author sunflower
 */
@Repository
public class ShipinRepositoryImpl implements ShipinRepository {
    @Autowired
    ShipinMapper shipinMapper;

    /**
     * public int start4Mysql() {     return page > 1 ? (page - 1) * rows : 0; }
     *
     * @param start
     * @param rows
     * @return
     */

    @Override
    public List<ShipinDTO> queryPage(int start, int rows, ShipinDTO shipinDTO, String orderByClause) {
        ShipinExample example = getShipinExample(shipinDTO);
        example.setOffset(start);
        example.setLimit(rows);
        if (StringUtil.isNotBlank(orderByClause)) {
            example.setOrderByClause(orderByClause);
        }
        List<Shipin> list = shipinMapper.selectByExample(example);
        return list.stream().map(ShipinConvert::convert).collect(Collectors.toList());

    }

    @Override
    public long count(ShipinDTO shipinDTO) {
        ShipinExample example = getShipinExample(shipinDTO);
        return shipinMapper.countByExample(example);
    }

    private ShipinExample getShipinExample(ShipinDTO shipinDTO) {
        ShipinExample example = new ShipinExample();
        ShipinExample.Criteria criteria = example.createCriteria();
        if (StringUtil.isNotBlank(shipinDTO.getName())) {
            criteria.andNameLike(shipinDTO.getName());
        }
        if (shipinDTO.getCategoryId() != null) {
            criteria.andCategoryIdEqualTo(shipinDTO.getCategoryId());
        }
        if (CollectionUtils.isEmpty(shipinDTO.getIds())) {
            criteria.andIdIn(shipinDTO.getIds());
        }
        return example;
    }
}
