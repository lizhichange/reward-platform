package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.reward.domain.SysShort;
import com.ruoyi.reward.mapper.SysShortMapper;
import com.ruoyi.reward.service.ISysShortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 链接管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-03-23
 */
@Service
public class SysShortServiceImpl implements ISysShortService
{
    @Autowired
    private SysShortMapper sysShortMapper;

    /**
     * 查询链接管理
     * 
     * @param id 链接管理ID
     * @return 链接管理
     */
    @Override
    public SysShort selectSysShortById(Long id)
    {
        return sysShortMapper.selectSysShortById(id);
    }

    /**
     * 查询链接管理列表
     * 
     * @param sysShort 链接管理
     * @return 链接管理
     */
    @Override
    public List<SysShort> selectSysShortList(SysShort sysShort)
    {
        return sysShortMapper.selectSysShortList(sysShort);
    }

    /**
     * 新增链接管理
     * 
     * @param sysShort 链接管理
     * @return 结果
     */
    @Override
    public int insertSysShort(SysShort sysShort)
    {
        sysShort.setCreateTime(DateUtils.getNowDate());
        return sysShortMapper.insertSysShort(sysShort);
    }

    /**
     * 修改链接管理
     * 
     * @param sysShort 链接管理
     * @return 结果
     */
    @Override
    public int updateSysShort(SysShort sysShort)
    {
        sysShort.setUpdateTime(DateUtils.getNowDate());
        return sysShortMapper.updateSysShort(sysShort);
    }

    /**
     * 删除链接管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysShortByIds(String ids)
    {
        return sysShortMapper.deleteSysShortByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除链接管理信息
     * 
     * @param id 链接管理ID
     * @return 结果
     */
    @Override
    public int deleteSysShortById(Long id)
    {
        return sysShortMapper.deleteSysShortById(id);
    }
}
