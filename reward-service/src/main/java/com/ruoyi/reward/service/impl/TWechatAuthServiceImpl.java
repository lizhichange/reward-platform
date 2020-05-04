package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.reward.domain.TWechatAuth;
import com.ruoyi.reward.mapper.ExtTWechatAuthMapper;

import com.ruoyi.reward.service.TWechatAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author sunflower
 */
@Service
public class TWechatAuthServiceImpl implements TWechatAuthService {
    @Autowired
    private ExtTWechatAuthMapper tWechatAuthMapper;

    /**
     * 查询小程序授权信息
     *
     * @param id 小程序授权信息ID
     * @return 小程序授权信息
     */
    @Override
    public TWechatAuth selectTWechatAuthById(Long id) {
        return tWechatAuthMapper.selectTWechatAuthById(id);
    }

    /**
     * 查询小程序授权信息列表
     *
     * @param tWechatAuth 小程序授权信息
     * @return 小程序授权信息
     */
    @Override
    public List<TWechatAuth> selectTWechatAuthList(TWechatAuth tWechatAuth) {
        return tWechatAuthMapper.selectTWechatAuthList(tWechatAuth);
    }

    /**
     * 新增小程序授权信息
     *
     * @param tWechatAuth 小程序授权信息
     * @return 结果
     */
    @Override
    public int insertTWechatAuth(TWechatAuth tWechatAuth) {
        return tWechatAuthMapper.insertTWechatAuth(tWechatAuth);
    }

    /**
     * 修改小程序授权信息
     *
     * @param tWechatAuth 小程序授权信息
     * @return 结果
     */
    @Override
    public int updateTWechatAuth(TWechatAuth tWechatAuth) {
        return tWechatAuthMapper.updateTWechatAuth(tWechatAuth);
    }

    /**
     * 删除小程序授权信息对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTWechatAuthByIds(String ids) {
        return tWechatAuthMapper.deleteTWechatAuthByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除小程序授权信息信息
     *
     * @param id 小程序授权信息ID
     * @return 结果
     */
    @Override
    public int deleteTWechatAuthById(Long id) {
        return tWechatAuthMapper.deleteTWechatAuthById(id);
    }
}