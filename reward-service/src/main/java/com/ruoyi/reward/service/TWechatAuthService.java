package com.ruoyi.reward.service;


import com.ruoyi.reward.domain.TWechatAuth;

import java.util.List;


/**
 * 小程序授权信息Service接口
 *
 * @author ruoyi
 * @date 2020-05-04
 */
public interface TWechatAuthService {
    /**
     * 查询小程序授权信息
     *
     * @param id 小程序授权信息ID
     * @return 小程序授权信息
     */
    TWechatAuth selectTWechatAuthById(Long id);

    /**
     * 查询小程序授权信息列表
     *
     * @param tWechatAuth 小程序授权信息
     * @return 小程序授权信息集合
     */
    List<TWechatAuth> selectTWechatAuthList(TWechatAuth tWechatAuth);

    /**
     * 新增小程序授权信息
     *
     * @param tWechatAuth 小程序授权信息
     * @return 结果
     */
    int insertTWechatAuth(TWechatAuth tWechatAuth);

    /**
     * 修改小程序授权信息
     *
     * @param tWechatAuth 小程序授权信息
     * @return 结果
     */
    int updateTWechatAuth(TWechatAuth tWechatAuth);

    /**
     * 批量删除小程序授权信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteTWechatAuthByIds(String ids);

    /**
     * 删除小程序授权信息信息
     *
     * @param id 小程序授权信息ID
     * @return 结果
     */
    int deleteTWechatAuthById(Long id);
}
