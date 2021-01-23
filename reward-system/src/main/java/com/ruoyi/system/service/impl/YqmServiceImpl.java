package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.Yqm;
import com.ruoyi.system.mapper.YqmMapper;
import com.ruoyi.system.service.IYqmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 邀请码管理Service业务层处理
 *
 * @author ruoyi
 * @date 2020-03-26
 */
@Service
public class YqmServiceImpl implements IYqmService {
    @Autowired
    private YqmMapper yqmMapper;

    /**
     * 查询邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 邀请码管理
     */
    @Override
    public Yqm selectYqmById(Long id) {
        return yqmMapper.selectYqmById(id);
    }

    /**
     * 查询邀请码管理列表
     *
     * @param invitation 邀请码管理
     * @return 邀请码管理
     */
    @Override
    public List<Yqm> selectYqmList(Yqm invitation) {
        return yqmMapper.selectYqmList(invitation);
    }

    /**
     * 新增邀请码管理
     *
     * @param invitation 邀请码管理
     * @return 结果
     */
    @Override
    public int insertYqm(Yqm invitation) {
        invitation.setCreateTime(DateUtils.getNowDate());
        return yqmMapper.insertYqm(invitation);
    }

    /**
     * 修改邀请码管理
     *
     * @param invitation 邀请码管理
     * @return 结果
     */
    @Override
    public int updateYqm(Yqm invitation) {
        invitation.setUpdateTime(DateUtils.getNowDate());
        return yqmMapper.updateYqm(invitation);
    }

    /**
     * 删除邀请码管理对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteYqmByIds(String ids) {
        return yqmMapper.deleteYqmByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除邀请码管理信息
     *
     * @param id 邀请码管理ID
     * @return 结果
     */
    @Override
    public int deleteYqmById(Long id) {
        return yqmMapper.deleteYqmById(id);
    }
}
