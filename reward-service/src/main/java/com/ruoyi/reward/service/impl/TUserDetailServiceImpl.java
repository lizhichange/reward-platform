package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.reward.domain.TUserDetail;
import com.ruoyi.reward.mapper.ExtTUserDetailMapper;
import com.ruoyi.reward.service.ITUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 平台用户Service业务层处理
 *
 * @author ruoyi
 * @date 2020-04-11
 */
@Service
public class TUserDetailServiceImpl implements ITUserDetailService {
    @Autowired
    private ExtTUserDetailMapper tUserDetailMapper;

    /**
     * 查询平台用户
     *
     * @param id 平台用户ID
     * @return 平台用户
     */
    @Override
    public TUserDetail selectTUserDetailById(Long id) {
        return tUserDetailMapper.selectTUserDetailById(id);
    }

    /**
     * 查询平台用户列表
     *
     * @param tUserDetail 平台用户
     * @return 平台用户
     */
    @Override
    public List<TUserDetail> selectTUserDetailList(TUserDetail tUserDetail) {
        return tUserDetailMapper.selectTUserDetailList(tUserDetail);
    }

    /**
     * 新增平台用户
     *
     * @param tUserDetail 平台用户
     * @return 结果
     */
    @Override
    public int insertTUserDetail(TUserDetail tUserDetail) {
        return tUserDetailMapper.insertTUserDetail(tUserDetail);
    }

    /**
     * 修改平台用户
     *
     * @param tUserDetail 平台用户
     * @return 结果
     */
    @Override
    public int updateTUserDetail(TUserDetail tUserDetail) {
        return tUserDetailMapper.updateTUserDetail(tUserDetail);
    }

    /**
     * 删除平台用户对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTUserDetailByIds(String ids) {
        return tUserDetailMapper.deleteTUserDetailByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除平台用户信息
     *
     * @param id 平台用户ID
     * @return 结果
     */
    @Override
    public int deleteTUserDetailById(Long id) {
        return tUserDetailMapper.deleteTUserDetailById(id);
    }
}
