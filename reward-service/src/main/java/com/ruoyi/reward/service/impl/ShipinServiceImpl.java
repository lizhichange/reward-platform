package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.mapper.ExtVideoMapper;
import com.ruoyi.reward.service.ShipinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author sunflower
 */
@Service
public class ShipinServiceImpl implements ShipinService {
    @Autowired
    private ExtVideoMapper extVideoMapper;

    /**
     * 查询邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 邀请码管理
     */
    @Override
    public Video selectShipinById(Long id) {
        return extVideoMapper.selectShipinById(id);
    }

    /**
     * 查询邀请码管理列表
     *
     * @param shipin 邀请码管理
     * @return 邀请码管理
     */
    @Override
    public List<Video> selectShipinList(Video shipin) {
        return extVideoMapper.selectShipinList(shipin);
    }

    /**
     * 新增邀请码管理
     *
     * @param shipin 邀请码管理
     * @return 结果
     */
    @Override
    public int insertShipin(Video shipin) {
        shipin.setCreateTime(DateUtils.getNowDate());
        return extVideoMapper.insertShipin(shipin);
    }

    /**
     * 修改邀请码管理
     *
     * @param shipin 邀请码管理
     * @return 结果
     */
    @Override
    public int updateShipin(Video shipin) {
        return extVideoMapper.updateShipin(shipin);
    }

    /**
     * 删除邀请码管理对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteShipinByIds(String ids) {
        return extVideoMapper.deleteShipinByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除邀请码管理信息
     *
     * @param id 邀请码管理ID
     * @return 结果
     */
    @Override
    public int deleteShipinById(Long id) {
        return extVideoMapper.deleteShipinById(id);
    }
}