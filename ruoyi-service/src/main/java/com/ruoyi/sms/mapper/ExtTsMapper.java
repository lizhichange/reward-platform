package com.ruoyi.sms.mapper;

import com.ruoyi.sms.domain.Ts;

import java.util.List;

/**
 * 投诉列表Mapper接口
 *
 * @author ruoyi
 * @date 2020-03-16
 */
public interface ExtTsMapper {
    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    public Ts selectTsById(Long id);

    /**
     * 查询投诉列表列表
     *
     * @param ts 投诉列表
     * @return 投诉列表集合
     */
    public List<Ts> selectTsList(Ts ts);

    /**
     * 新增投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    public int insertTs(Ts ts);

    /**
     * 修改投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    public int updateTs(Ts ts);

    /**
     * 删除投诉列表
     *
     * @param id 投诉列表ID
     * @return 结果
     */
    public int deleteTsById(Long id);

    /**
     * 批量删除投诉列表
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTsByIds(String[] ids);
}
