package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysWebMain;

import java.util.List;

/**
 * 域名管理Service接口
 * 
 * @author ruoyi
 * @date 2020-03-23
 */
public interface ISysWebMainService 
{
    /**
     * 查询域名管理
     * 
     * @param id 域名管理ID
     * @return 域名管理
     */
    public SysWebMain selectSysWebMainById(Long id);

    /**
     * 查询域名管理列表
     * 
     * @param sysWebMain 域名管理
     * @return 域名管理集合
     */
    public List<SysWebMain> selectSysWebMainList(SysWebMain sysWebMain);

    /**
     * 新增域名管理
     * 
     * @param sysWebMain 域名管理
     * @return 结果
     */
    public int insertSysWebMain(SysWebMain sysWebMain);

    /**
     * 修改域名管理
     * 
     * @param sysWebMain 域名管理
     * @return 结果
     */
    public int updateSysWebMain(SysWebMain sysWebMain);

    /**
     * 批量删除域名管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysWebMainByIds(String ids);

    /**
     * 删除域名管理信息
     * 
     * @param id 域名管理ID
     * @return 结果
     */
    public int deleteSysWebMainById(Long id);
}
