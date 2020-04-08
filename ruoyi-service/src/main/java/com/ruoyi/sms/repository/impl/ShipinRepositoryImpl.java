package com.ruoyi.sms.repository.impl;

import com.ruoyi.sms.convert.ShipinConvert;
import com.ruoyi.sms.domain.Shipin;
import com.ruoyi.sms.domain.ShipinExample;
import com.ruoyi.sms.facade.dto.ShipinDTO;
import com.ruoyi.sms.mapper.ShipinMapper;
import com.ruoyi.sms.repository.ShipinRepository;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
    public List<ShipinDTO> queryPage(int start, int rows, String name, String orderByClause) {
        ShipinExample example = getShipinExample(name);
        example.setOffset(start);
        example.setLimit(rows);
        if (StringUtil.isNotBlank(orderByClause)) {
            example.setOrderByClause(orderByClause);
        }
        List<Shipin> list = shipinMapper.selectByExample(example);
        return list.stream().map(ShipinConvert::convert).collect(Collectors.toList());

    }

    @Override
    public long count(String name) {
        ShipinExample example = getShipinExample(name);
        return shipinMapper.countByExample(example);
    }

    private ShipinExample getShipinExample(String name) {
        ShipinExample example = new ShipinExample();
        ShipinExample.Criteria criteria = example.createCriteria();
        if (StringUtil.isNotBlank(name)) {
            criteria.andNameLike(name);
        }
        return example;
    }
}
