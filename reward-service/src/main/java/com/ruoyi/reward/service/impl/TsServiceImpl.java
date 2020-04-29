package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.reward.domain.Ts;
import com.ruoyi.reward.mapper.ExtTsMapper;
import com.ruoyi.reward.service.TsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TsServiceImpl implements TsService {
    @Autowired
    private ExtTsMapper extTsMapper;

    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    @Override
    public Ts selectTsById(Long id) {
        return extTsMapper.selectTsById(id);
    }

    /**
     * 查询投诉列表列表
     *
     * @param ts 投诉列表
     * @return 投诉列表
     */
    @Override
    public List<Ts> selectTsList(Ts ts) {
        return extTsMapper.selectTsList(ts);
    }

    /**
     * 新增投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    @Override
    public int insertTs(Ts ts) {
        ts.setCreateTime(DateUtils.getNowDate());
        return extTsMapper.insertTs(ts);
    }

    /**
     * 修改投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    @Override
    public int updateTs(Ts ts) {
        ts.setUpdateTime(DateUtils.getNowDate());
        return extTsMapper.updateTs(ts);
    }

    /**
     * 删除投诉列表对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTsByIds(String ids) {
        return extTsMapper.deleteTsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除投诉列表信息
     *
     * @param id 投诉列表ID
     * @return 结果
     */
    @Override
    public int deleteTsById(Long id) {
        return extTsMapper.deleteTsById(id);
    }
}
