package com.ruoyi.reward.service;

import com.ruoyi.reward.domain.SysShort;

import java.util.List;

/**
 * 链接管理Service接口
 *
 * @author ruoyi
 * @date 2020-03-23
 */
public interface SysShortService {
    /**
     * 查询链接管理
     *
     * @param id 链接管理ID
     * @return 链接管理
     */
    public SysShort selectSysShortById(Long id);

    /**
     * 查询链接管理列表
     *
     * @param sysShort 链接管理
     * @return 链接管理集合
     */
    public List<SysShort> selectSysShortList(SysShort sysShort);

    /**
     * 新增链接管理
     *
     * @param sysShort 链接管理
     * @return 结果
     */
    public int insertSysShort(SysShort sysShort);

    /**
     * 修改链接管理
     *
     * @param sysShort 链接管理
     * @return 结果
     */
    public int updateSysShort(SysShort sysShort);

    /**
     * 批量删除链接管理
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysShortByIds(String ids);

    /**
     * 删除链接管理信息
     *
     * @param id 链接管理ID
     * @return 结果
     */
    public int deleteSysShortById(Long id);
}
