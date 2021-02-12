package com.ruoyi.reward.service;

import com.ruoyi.reward.domain.VideoRelPrice;

import java.util.List;


/**
 * 发布价格Service接口
 * 
 * @author ruoyi
 * @date 2021-02-12
 */
public interface IVideoRelPriceService 
{
    /**
     * 查询发布价格
     * 
     * @param id 发布价格ID
     * @return 发布价格
     */
    public VideoRelPrice selectVideoRelPriceById(Long id);

    /**
     * 查询发布价格列表
     * 
     * @param videoRelPrice 发布价格
     * @return 发布价格集合
     */
    public List<VideoRelPrice> selectVideoRelPriceList(VideoRelPrice videoRelPrice);

    /**
     * 新增发布价格
     * 
     * @param videoRelPrice 发布价格
     * @return 结果
     */
    public int insertVideoRelPrice(VideoRelPrice videoRelPrice);

    /**
     * 修改发布价格
     * 
     * @param videoRelPrice 发布价格
     * @return 结果
     */
    public int updateVideoRelPrice(VideoRelPrice videoRelPrice);

    /**
     * 批量删除发布价格
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteVideoRelPriceByIds(String ids);

    /**
     * 删除发布价格信息
     * 
     * @param id 发布价格ID
     * @return 结果
     */
    public int deleteVideoRelPriceById(Long id);
}
