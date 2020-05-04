package com.ruoyi.reward.mapper;

import com.ruoyi.reward.domain.TWechatAuth;

import java.util.List;

/**
 * @author sunflower
 */
public interface ExtTWechatAuthMapper {
    /**
     * 查询小程序授权信息
     *
     * @param id 小程序授权信息ID
     * @return 小程序授权信息
     */
    public TWechatAuth selectTWechatAuthById(Long id);

    /**
     * 查询小程序授权信息列表
     *
     * @param tWechatAuth 小程序授权信息
     * @return 小程序授权信息集合
     */
    public List<TWechatAuth> selectTWechatAuthList(TWechatAuth tWechatAuth);

    /**
     * 新增小程序授权信息
     *
     * @param tWechatAuth 小程序授权信息
     * @return 结果
     */
    public int insertTWechatAuth(TWechatAuth tWechatAuth);

    /**
     * 修改小程序授权信息
     *
     * @param tWechatAuth 小程序授权信息
     * @return 结果
     */
    public int updateTWechatAuth(TWechatAuth tWechatAuth);

    /**
     * 删除小程序授权信息
     *
     * @param id 小程序授权信息ID
     * @return 结果
     */
    public int deleteTWechatAuthById(Long id);

    /**
     * 批量删除小程序授权信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTWechatAuthByIds(String[] ids);
}