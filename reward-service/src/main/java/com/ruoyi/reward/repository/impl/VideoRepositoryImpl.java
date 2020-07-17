package com.ruoyi.reward.repository.impl;


import com.ruoyi.reward.convert.VideoConvert;
import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.VideoExample;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.reward.mapper.VideoMapper;
import com.ruoyi.reward.repository.VideoRepository;
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
public class VideoRepositoryImpl implements VideoRepository {
    @Autowired
    VideoMapper videoMapper;

    /**
     * public int start4Mysql() {     return page > 1 ? (page - 1) * rows : 0; }
     *
     * @param start
     * @param rows
     * @return
     */

    @Override
    public List<VideoDTO> queryPage(int start, int rows, VideoDTO videoDTO, String orderByClause) {
        VideoExample example = getVideoExample(videoDTO);
        example.setOffset(start);
        example.setLimit(rows);
        if (StringUtil.isNotBlank(orderByClause)) {
            example.setOrderByClause(orderByClause);
        }
        List<Video> list = videoMapper.selectByExample(example);
        return list.stream().map(VideoConvert::convert).collect(Collectors.toList());

    }

    @Override
    public long count(VideoDTO videoDTO) {
        VideoExample example = getVideoExample(videoDTO);
        return videoMapper.countByExample(example);
    }

    private VideoExample getVideoExample(VideoDTO videoDTO) {
        VideoExample example = new VideoExample();
        VideoExample.Criteria criteria = example.createCriteria();
        if (StringUtil.isNotBlank(videoDTO.getName())) {
            criteria.andNameLike(videoDTO.getName());
        }
        if (StringUtil.isNotBlank(videoDTO.getStatus())) {
            criteria.andStatusEqualTo(videoDTO.getStatus());
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
