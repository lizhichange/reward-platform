package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.reward.domain.Complaint;
import com.ruoyi.reward.mapper.ExtComplaintMapper;
import com.ruoyi.reward.service.ComplaintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComplaintServiceImpl implements ComplaintService {
    @Autowired
    private ExtComplaintMapper extComplaintMapper;

    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    @Override
    public Complaint selectComplaintById(Long id) {
        return extComplaintMapper.selectComplaintById(id);
    }

    /**
     * 查询投诉列表列表
     *
     * @param complaint 投诉列表
     * @return 投诉列表
     */
    @Override
    public List<Complaint> selectComplaintList(Complaint complaint) {
        return extComplaintMapper.selectComplaintList(complaint);
    }

    /**
     * 新增投诉列表
     *
     * @param complaint 投诉列表
     * @return 结果
     */
    @Override
    public int insertComplaint(Complaint complaint) {
        complaint.setCreateTime(DateUtils.getNowDate());
        return extComplaintMapper.insertComplaint(complaint);
    }

    /**
     * 修改投诉列表
     *
     * @param complaint 投诉列表
     * @return 结果
     */
    @Override
    public int updateComplaint(Complaint complaint) {
        complaint.setUpdateTime(DateUtils.getNowDate());
        return extComplaintMapper.updateComplaint(complaint);
    }

    /**
     * 删除投诉列表对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteComplaintByIds(String ids) {
        return extComplaintMapper.deleteComplaintByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除投诉列表信息
     *
     * @param id 投诉列表ID
     * @return 结果
     */
    @Override
    public int deleteComplaintById(Long id) {
        return extComplaintMapper.deleteComplaintById(id);
    }
}
