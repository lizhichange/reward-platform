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
    Video selectShipinById(Long id);

    /**
     * 查询公共片库列表
     *
     * @param shipin 公共片库
     * @return 公共片库集合
     */
    List<Video> selectShipinList(Video shipin);

    /**
     * 新增公共片库
     *
     * @param shipin 公共片库
     * @return 结果
     */
    int insertShipin(Video shipin);

    /**
     * 修改公共片库
     *
     * @param shipin 公共片库
     * @return 结果
     */
    int updateShipin(Video shipin);

    /**
     * 删除公共片库
     *
     * @param id 公共片库ID
     * @return 结果
     */
    int deleteShipinById(Long id);

    int updateClickPlus(Long id);

    /**
     * 批量删除公共片库
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteShipinByIds(String[] ids);
}
