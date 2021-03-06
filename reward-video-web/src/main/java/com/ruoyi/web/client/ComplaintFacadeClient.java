package com.ruoyi.web.client;


import com.ruoyi.reward.facade.dto.ComplaintDTO;

import java.util.List;

/**
 * 投诉列表Service接口
 *
 * @author ruoyi
 * @date 2020-03-16
 */
public interface ComplaintFacadeClient {
    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    ComplaintDTO selectComplaintById(Long id);

    /**
     * 查询投诉列表列表
     *
     * @param ts 投诉列表
     * @return 投诉列表集合
     */
    List<ComplaintDTO> selectComplaintList(ComplaintDTO ts);

    /**
     * 新增投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    int insertComplaint(ComplaintDTO ts);

    /**
     * 修改投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    int updateComplaint(ComplaintDTO ts);


    int count();

}