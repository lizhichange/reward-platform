package com.ruoyi.system.service;

import com.ruoyi.system.domain.Invitation;

import java.util.List;

/**
 * 邀请码管理Service接口
 *
 * @author ruoyi
 * @date 2020-03-26
 */
public interface InvitationService {
    /**
     * 查询邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 邀请码管理
     */
    public Invitation selectInvitationById(Long id);

    /**
     * 查询邀请码管理列表
     *
     * @param invitation 邀请码管理
     * @return 邀请码管理集合
     */
    public List<Invitation> selectInvitationList(Invitation invitation);

    /**
     * 新增邀请码管理
     *
     * @param invitation 邀请码管理
     * @return 结果
     */
    public int insertInvitation(Invitation invitation);

    /**
     * 修改邀请码管理
     *
     * @param invitation 邀请码管理
     * @return 结果
     */
    public int updateInvitation(Invitation invitation);

    /**
     * 批量删除邀请码管理
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteInvitationByIds(String ids);

    /**
     * 删除邀请码管理信息
     *
     * @param id 邀请码管理ID
     * @return 结果
     */
    public int deleteInvitationById(Long id);
}
