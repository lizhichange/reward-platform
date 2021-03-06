package com.ruoyi.reward.facade.api;


import com.ruoyi.reward.facade.dto.SysShortDTO;

import java.util.List;

/**
 * 链接管理Service接口
 *
 * @author ruoyi
 * @date 2020-03-23
 */
public interface SysShortFacade {
    /**
     * 查询链接管理
     *
     * @param id 链接管理ID
     * @return 链接管理
     */
    public SysShortDTO selectSysShortById(Long id);

    /**
     * 查询链接管理列表
     *
     * @param dto 链接管理
     * @return 链接管理集合
     */
    public List<SysShortDTO> selectSysShortList(SysShortDTO dto);

    /**
     * 新增链接管理
     *
     * @param dto 链接管理
     * @return 结果
     */
    public int insertSysShort(SysShortDTO dto);


}
