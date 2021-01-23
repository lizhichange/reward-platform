package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.mapper.ExtVideoMapper;
import com.ruoyi.reward.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author sunflower
 */
@Service
public class VideoServiceImpl implements VideoService {
    @Autowired
    private ExtVideoMapper extVideoMapper;

    /**
     * 查询邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 邀请码管理
     */
    @Override
    public Video selectVideoById(Long id) {
        return extVideoMapper.selectVideoById(id);
    }

    /**
     * 查询邀请码管理列表
     *
     * @param video 邀请码管理
     * @return 邀请码管理
     */
    @Override
    public List<Video> selectVideoList(Video video) {
        return extVideoMapper.selectVideoList(video);
    }

    /**
     * 新增邀请码管理
     *
     * @param video 邀请码管理
     * @return 结果
     */
    @Override
    public int insertVideo(Video video) {
        video.setCreateTime(DateUtils.getNowDate());
        return extVideoMapper.insertVideo(video);
    }

    /**
     * 修改邀请码管理
     *
     * @param video 邀请码管理
     * @return 结果
     */
    @Override
    public int updateVideo(Video video) {
        return extVideoMapper.updateVideo(video);
    }

    /**
     * 删除邀请码管理对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteVideoByIds(String ids) {
        return extVideoMapper.deleteVideoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除邀请码管理信息
     *
     * @param id 邀请码管理ID
     * @return 结果
     */
    @Override
    public int deleteVideoById(Long id) {
        return extVideoMapper.deleteVideoById(id);
    }
}