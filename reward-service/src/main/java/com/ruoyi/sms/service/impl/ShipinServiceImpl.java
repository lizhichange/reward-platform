package com.ruoyi.sms.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.sms.domain.Shipin;
import com.ruoyi.sms.mapper.ExtShipinMapper;
import com.ruoyi.sms.service.IShipinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author sunflower
 */
@Service
public class ShipinServiceImpl implements IShipinService {
    @Autowired
    private ExtShipinMapper extShipinMapper;

    /**
     * 查询邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 邀请码管理
     */
    @Override
    public Shipin selectShipinById(Long id) {
        return extShipinMapper.selectShipinById(id);
    }

    /**
     * 查询邀请码管理列表
     *
     * @param shipin 邀请码管理
     * @return 邀请码管理
     */
    @Override
    public List<Shipin> selectShipinList(Shipin shipin) {
        return extShipinMapper.selectShipinList(shipin);
    }

    /**
     * 新增邀请码管理
     *
     * @param shipin 邀请码管理
     * @return 结果
     */
    @Override
    public int insertShipin(Shipin shipin) {
        shipin.setCreateTime(DateUtils.getNowDate());
        return extShipinMapper.insertShipin(shipin);
    }

    /**
     * 修改邀请码管理
     *
     * @param shipin 邀请码管理
     * @return 结果
     */
    @Override
    public int updateShipin(Shipin shipin) {
        return extShipinMapper.updateShipin(shipin);
    }

    /**
     * 删除邀请码管理对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteShipinByIds(String ids) {
        return extShipinMapper.deleteShipinByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除邀请码管理信息
     *
     * @param id 邀请码管理ID
     * @return 结果
     */
    @Override
    public int deleteShipinById(Long id) {
        return extShipinMapper.deleteShipinById(id);
    }
}