package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Yqm;

import java.util.List;

/**
 * 邀请码管理Mapper接口
 *
 * @author ruoyi
 * @date 2020-03-26
 */
public interface YqmMapper {
    /**
     * 查询邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 邀请码管理
     */
    public Yqm selectYqmById(Long id);

    /**
     * 查询邀请码管理列表
     *
     * @param invitation 邀请码管理
     * @return 邀请码管理集合
     */
    public List<Yqm> selectYqmList(Yqm invitation);

    /**
     * 新增邀请码管理
     *
     * @param invitation 邀请码管理
     * @return 结果
     */
    public int insertYqm(Yqm invitation);

    /**
     * 修改邀请码管理
     *
     * @param invitation 邀请码管理
     * @return 结果
     */
    public int updateYqm(Yqm invitation);

    /**
     * 删除邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 结果
     */
    public int deleteYqmById(Long id);

    /**
     * 批量删除邀请码管理
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteYqmByIds(String[] ids);
}
