package com.ruoyi.reward.service;

import com.ruoyi.reward.domain.Video;

import java.util.List;

/**
 * @author sunflower
 */
public interface VideoService {
    /**
     * 查询邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 邀请码管理
     */
    public Video selectVideoById(Long id);

    /**
     * 查询邀请码管理列表
     *
     * @param shipin 邀请码管理
     * @return 邀请码管理集合
     */
    public List<Video> selectVideoList(Video shipin);

    /**
     * 新增邀请码管理
     *
     * @param shipin 邀请码管理
     * @return 结果
     */
    public int insertVideo(Video shipin);

    /**
     * 修改邀请码管理
     *
     * @param shipin 邀请码管理
     * @return 结果
     */
    public int updateVideo(Video shipin);

    /**
     * 批量删除邀请码管理
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteVideoByIds(String ids);

    /**
     * 删除邀请码管理信息
     *
     * @param id 邀请码管理ID
     * @return 结果
     */
    public int deleteVideoById(Long id);
}
