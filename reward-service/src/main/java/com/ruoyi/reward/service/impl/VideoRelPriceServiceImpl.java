package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.reward.domain.VideoRelPrice;
import com.ruoyi.reward.mapper.VideoRelPriceMapper;
import com.ruoyi.reward.service.VideoRelPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 发布价格Service业务层处理
 *
 * @author ruoyi
 * @date 2021-02-12
 */
@Service
public class VideoRelPriceServiceImpl implements VideoRelPriceService {
    @Autowired
    private VideoRelPriceMapper videoRelPriceMapper;

    /**
     * 查询发布价格
     *
     * @param id 发布价格ID
     * @return 发布价格
     */
    @Override
    public VideoRelPrice selectVideoRelPriceById(Long id) {
        return videoRelPriceMapper.selectVideoRelPriceById(id);
    }

    /**
     * 查询发布价格列表
     *
     * @param videoRelPrice 发布价格
     * @return 发布价格
     */
    @Override
    public List<VideoRelPrice> selectVideoRelPriceList(VideoRelPrice videoRelPrice) {
        return videoRelPriceMapper.selectVideoRelPriceList(videoRelPrice);
    }

    /**
     * 新增发布价格
     *
     * @param videoRelPrice 发布价格
     * @return 结果
     */
    @Override
    public int insertVideoRelPrice(VideoRelPrice videoRelPrice) {
        videoRelPrice.setCreateTime(DateUtils.getNowDate());
        return videoRelPriceMapper.insertVideoRelPrice(videoRelPrice);
    }

    /**
     * 修改发布价格
     *
     * @param videoRelPrice 发布价格
     * @return 结果
     */
    @Override
    public int updateVideoRelPrice(VideoRelPrice videoRelPrice) {
        videoRelPrice.setUpdateTime(DateUtils.getNowDate());
        return videoRelPriceMapper.updateVideoRelPrice(videoRelPrice);
    }

    /**
     * 删除发布价格对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteVideoRelPriceByIds(String ids) {
        return videoRelPriceMapper.deleteVideoRelPriceByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除发布价格信息
     *
     * @param id 发布价格ID
     * @return 结果
     */
    @Override
    public int deleteVideoRelPriceById(Long id) {
        return videoRelPriceMapper.deleteVideoRelPriceById(id);
    }
}
