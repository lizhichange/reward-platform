package com.ruoyi.sms.facade.api;


import com.ruoyi.sms.facade.dto.TsDTO;

import java.util.List;

/**
 * 投诉列表Service接口
 *
 * @author ruoyi
 * @date 2020-03-16
 */
public interface ITsService {
    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
      TsDTO selectTsById(Long id);

    /**
     * 查询投诉列表列表
     *
     * @param ts 投诉列表
     * @return 投诉列表集合
     */
      List<TsDTO> selectTsList(TsDTO ts);

    /**
     * 新增投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
      int insertTs(TsDTO ts);

    /**
     * 修改投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
      int updateTs(TsDTO ts);

    /**
     * 批量删除投诉列表
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
      int deleteTsByIds(String ids);

      int count();

    /**
     * 删除投诉列表信息
     *
     * @param id 投诉列表ID
     * @return 结果
     */
      int deleteTsById(Long id);
    }
