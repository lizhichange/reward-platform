package com.ruoyi.reward.mapper;

import com.ruoyi.reward.domain.VideoRelPrice;

import java.util.List;
import java.util.Map;


/**
 * 发布价格Mapper接口
 *
 * @author ruoyi
 * @date 2021-02-12
 */
public interface VideoRelPriceMapper {
    /**
     * 查询发布价格
     *
     * @param id 发布价格ID
     * @return 发布价格
     */
    VideoRelPrice selectVideoRelPriceById(Long id);

    /**
     * 查询发布价格列表
     *
     * @param videoRelPrice 发布价格
     * @return 发布价格集合
     */
    List<VideoRelPrice> selectVideoRelPriceList(VideoRelPrice videoRelPrice);

    /**
     * 新增发布价格
     *
     * @param videoRelPrice 发布价格
     * @return 结果
     */
    int insertVideoRelPrice(VideoRelPrice videoRelPrice);

    /**
     * 修改发布价格
     *
     * @param videoRelPrice 发布价格
     * @return 结果
     */
    int updateVideoRelPrice(VideoRelPrice videoRelPrice);

    /**
     * 删除发布价格
     *
     * @param id 发布价格ID
     * @return 结果
     */
    int deleteVideoRelPriceById(Long id);

    int deleteVideoRelPriceByUserId(String userId);

    int deleteVideoRelPriceByIds(String[] ids);

    int batchInsert(List<VideoRelPrice> list);

    int batchUpdate(Map<String, Object> map);

}
