package com.ruoyi.reward.mapper;

import com.ruoyi.reward.domain.Complaint;

import java.util.List;

/**
 * 投诉列表Mapper接口
 *
 * @author ruoyi
 * @date 2020-03-16
 */
public interface ExtComplaintMapper {
    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    Complaint selectComplaintById(Long id);

    /**
     * 查询投诉列表列表
     *
     * @param complaint 投诉列表
     * @return 投诉列表集合
     */
    public List<Complaint> selectComplaintList(Complaint complaint);

    /**
     * 新增投诉列表
     *
     * @param complaint 投诉列表
     * @return 结果
     */
    public int insertComplaint(Complaint complaint);

    /**
     * 修改投诉列表
     *
     * @param complaint 投诉列表
     * @return 结果
     */
    public int updateComplaint(Complaint complaint);

    /**
     * 删除投诉列表
     *
     * @param id 投诉列表ID
     * @return 结果
     */
    public int deleteComplaintById(Long id);

    /**
     * 批量删除投诉列表
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteComplaintByIds(String[] ids);
}
