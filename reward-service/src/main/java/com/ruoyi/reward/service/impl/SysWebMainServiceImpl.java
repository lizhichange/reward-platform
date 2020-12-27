package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.reward.domain.SysWebMain;
import com.ruoyi.reward.mapper.SysWebMainMapper;
import com.ruoyi.reward.service.SysWebMainService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

;

/**
 * 域名管理Service业务层处理
 *
 * @author ruoyi
 * @date 2020-03-23
 */
@Service
@Slf4j
public class SysWebMainServiceImpl implements SysWebMainService {
    @Autowired
    private SysWebMainMapper sysWebMainMapper;

    /**
     * 查询域名管理
     *
     * @param id 域名管理ID
     * @return 域名管理
     */
    @Override
    public SysWebMain selectSysWebMainById(Long id) {
        return sysWebMainMapper.selectSysWebMainById(id);
    }

    /**
     * 查询域名管理列表
     *
     * @param sysWebMain 域名管理
     * @return 域名管理
     */
    @Override
    public List<SysWebMain> selectSysWebMainList(SysWebMain sysWebMain) {
        log.info("sysWebMain:{}",sysWebMain);
        return sysWebMainMapper.selectSysWebMainList(sysWebMain);
    }

    /**
     * 新增域名管理
     *
     * @param sysWebMain 域名管理
     * @return 结果
     */
    @Override
    public int insertSysWebMain(SysWebMain sysWebMain) {
        sysWebMain.setCreateTime(DateUtils.getNowDate());
        log.info("sysWebMain:{}",sysWebMain);

        return sysWebMainMapper.insertSysWebMain(sysWebMain);
    }

    /**
     * 修改域名管理
     *
     * @param sysWebMain 域名管理
     * @return 结果
     */
    @Override
    public int updateSysWebMain(SysWebMain sysWebMain) {
        sysWebMain.setUpdateTime(DateUtils.getNowDate());
        log.info("sysWebMain:{}",sysWebMain);

        return sysWebMainMapper.updateSysWebMain(sysWebMain);
    }

    /**
     * 删除域名管理对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysWebMainByIds(String ids) {
        return sysWebMainMapper.deleteSysWebMainByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除域名管理信息
     *
     * @param id 域名管理ID
     * @return 结果
     */
    @Override
    public int deleteSysWebMainById(Long id) {
        return sysWebMainMapper.deleteSysWebMainById(id);
    }
}
