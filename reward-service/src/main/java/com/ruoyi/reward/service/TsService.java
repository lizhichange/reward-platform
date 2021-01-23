package com.ruoyi.reward.service;

import com.ruoyi.reward.domain.Complaint;

import java.util.List;

public interface TsService {
    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    public Complaint selectTsById(Long id);

    /**
     * 查询投诉列表列表
     *
     * @param complaint 投诉列表
     * @return 投诉列表集合
     */
    public List<Complaint> selectTsList(Complaint complaint);

    /**
     * 新增投诉列表
     *
     * @param complaint 投诉列表
     * @return 结果
     */
    public int insertTs(Complaint complaint);

    /**
     * 修改投诉列表
     *
     * @param complaint 投诉列表
     * @return 结果
     */
    public int updateTs(Complaint complaint);

    /**
     * 批量删除投诉列表
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTsByIds(String ids);

    /**
     * 删除投诉列表信息
     *
     * @param id 投诉列表ID
     * @return 结果
     */
    public int deleteTsById(Long id);
}