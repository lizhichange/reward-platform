package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.Invitation;
import com.ruoyi.system.mapper.InvitationMapper;
import com.ruoyi.system.service.InvitationService;
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
public class InvitationServiceImpl implements InvitationService {
    @Autowired
    private InvitationMapper invitationMapper;

    /**
     * 查询邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 邀请码管理
     */
    @Override
    public Invitation selectInvitationById(Long id) {
        return invitationMapper.selectInvitationById(id);
    }

    /**
     * 查询邀请码管理列表
     *
     * @param invitation 邀请码管理
     * @return 邀请码管理
     */
    @Override
    public List<Invitation> selectInvitationList(Invitation invitation) {
        return invitationMapper.selectInvitationList(invitation);
    }

    /**
     * 新增邀请码管理
     *
     * @param invitation 邀请码管理
     * @return 结果
     */
    @Override
    public int insertInvitation(Invitation invitation) {
        invitation.setCreateTime(DateUtils.getNowDate());
        return invitationMapper.insertInvitation(invitation);
    }

    /**
     * 修改邀请码管理
     *
     * @param invitation 邀请码管理
     * @return 结果
     */
    @Override
    public int updateInvitation(Invitation invitation) {
        invitation.setUpdateTime(DateUtils.getNowDate());
        return invitationMapper.updateInvitation(invitation);
    }

    /**
     * 删除邀请码管理对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteInvitationByIds(String ids) {
        return invitationMapper.deleteInvitationByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除邀请码管理信息
     *
     * @param id 邀请码管理ID
     * @return 结果
     */
    @Override
    public int deleteInvitationById(Long id) {
        return invitationMapper.deleteInvitationById(id);
    }
}
