package com.ruoyi.reward.mapper;

import com.ruoyi.reward.domain.Video;

import java.util.List;

/**
 * 公共片库Mapper接口
 *
 * @author ruoyi
 * @date 2020-03-17
 */
public interface ExtVideoMapper {
    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    Video selectVideoById(Long id);

    /**
     * 查询公共片库列表
     *
     * @return 公共片库集合
     */
    List<Video> selectVideoList(Video shipin);

    /**
     * 新增公共片库
     *
     * @param shipin 公共片库
     * @return 结果
     */
    int insertVideo(Video shipin);

    /**
     * 修改公共片库
     *
     * @param shipin 公共片库
     * @return 结果
     */
    int updateVideo(Video shipin);

    /**
     * 删除公共片库
     *
     * @param id 公共片库ID
     * @return 结果
     */
    int deleteVideoById(Long id);

    int updateClickPlus(Long id);

    /**
     * 批量删除公共片库
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteVideoByIds(String[] ids);
}
