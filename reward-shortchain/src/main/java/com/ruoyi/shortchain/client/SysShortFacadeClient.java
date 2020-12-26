package com.ruoyi.shortchain.client;


import com.ruoyi.reward.facade.dto.SysShortDTO;

import java.util.List;

/**
 * @author wahaha
 */
public interface SysShortFacadeClient {
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
