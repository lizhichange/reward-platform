package com.ruoyi.reward.repository.impl;


import com.ruoyi.reward.convert.ShipinConvert;
import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.ShipinExample;
import com.ruoyi.reward.facade.dto.VideoDTO;
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
    public List<VideoDTO> queryPage(int start, int rows, VideoDTO videoDTO, String orderByClause) {
        ShipinExample example = getShipinExample(videoDTO);
        example.setOffset(start);
        example.setLimit(rows);
        if (StringUtil.isNotBlank(orderByClause)) {
            example.setOrderByClause(orderByClause);
        }
        List<Video> list = shipinMapper.selectByExample(example);
        return list.stream().map(ShipinConvert::convert).collect(Collectors.toList());

    }

    @Override
    public long count(VideoDTO videoDTO) {
        ShipinExample example = getShipinExample(videoDTO);
        return shipinMapper.countByExample(example);
    }

    private ShipinExample getShipinExample(VideoDTO videoDTO) {
        ShipinExample example = new ShipinExample();
        ShipinExample.Criteria criteria = example.createCriteria();
        if (StringUtil.isNotBlank(videoDTO.getName())) {
            criteria.andNameLike(videoDTO.getName());
        }
        if (videoDTO.getCategoryId() != null) {
            criteria.andCategoryIdEqualTo(videoDTO.getCategoryId());
        }
        if (!CollectionUtils.isEmpty(videoDTO.getIds())) {
            criteria.andIdIn(videoDTO.getIds());
        }
        return example;
    }
}
