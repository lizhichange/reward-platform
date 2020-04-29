package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.reward.domain.SysWechatConfig;
import com.ruoyi.reward.mapper.SysWechatConfigMapper;
import com.ruoyi.reward.service.ISysWechatConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 公众号配置信息Service业务层处理
 *
 * @author ruoyi
 * @date 2020-03-24
 */
@Service
public class SysWechatConfigServiceImpl implements ISysWechatConfigService {
    @Autowired
    private SysWechatConfigMapper sysWechatConfigMapper;

    /**
     * 查询公众号配置信息
     *
     * @param id 公众号配置信息ID
     * @return 公众号配置信息
     */
    @Override
    public SysWechatConfig selectSysWechatConfigById(Long id) {
        return sysWechatConfigMapper.selectSysWechatConfigById(id);
    }

    /**
     * 查询公众号配置信息列表
     *
     * @param sysWechatConfig 公众号配置信息
     * @return 公众号配置信息
     */
    @Override
    public List<SysWechatConfig> selectSysWechatConfigList(SysWechatConfig sysWechatConfig) {
        return sysWechatConfigMapper.selectSysWechatConfigList(sysWechatConfig);
    }

    /**
     * 新增公众号配置信息
     *
     * @param sysWechatConfig 公众号配置信息
     * @return 结果
     */
    @Override
    public int insertSysWechatConfig(SysWechatConfig sysWechatConfig) {
        sysWechatConfig.setCreateTime(DateUtils.getNowDate());
        return sysWechatConfigMapper.insertSysWechatConfig(sysWechatConfig);
    }

    /**
     * 修改公众号配置信息
     *
     * @param sysWechatConfig 公众号配置信息
     * @return 结果
     */
    @Override
    public int updateSysWechatConfig(SysWechatConfig sysWechatConfig) {
        sysWechatConfig.setUpdateTime(DateUtils.getNowDate());
        return sysWechatConfigMapper.updateSysWechatConfig(sysWechatConfig);
    }

    /**
     * 删除公众号配置信息对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysWechatConfigByIds(String ids) {
        return sysWechatConfigMapper.deleteSysWechatConfigByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除公众号配置信息信息
     *
     * @param id 公众号配置信息ID
     * @return 结果
     */
    @Override
    public int deleteSysWechatConfigById(Long id) {
        return sysWechatConfigMapper.deleteSysWechatConfigById(id);
    }
}
