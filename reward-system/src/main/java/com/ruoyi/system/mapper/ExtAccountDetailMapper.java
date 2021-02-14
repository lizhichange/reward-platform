package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.AccountDetail;

import java.util.List;

/**
 * 账户明细Mapper接口
 *
 * @author ruoyi
 * @date 2020-04-13
 */
public interface ExtAccountDetailMapper {
    /**
     * 查询账户明细
     *
     * @param id 账户明细ID
     * @return 账户明细
     */
    AccountDetail selectAccountDetailById(Long id);

    /**
     * 查询账户明细列表
     *
     * @param accountDetail 账户明细
     * @return 账户明细集合
     */
    List<AccountDetail> selectAccountDetailList(AccountDetail accountDetail);

    /**
     * 新增账户明细
     *
     * @param accountDetail 账户明细
     * @return 结果
     */
    int insertAccountDetail(AccountDetail accountDetail);

    /**
     * 修改账户明细
     *
     * @param accountDetail 账户明细
     * @return 结果
     */
    int updateAccountDetail(AccountDetail accountDetail);

    /**
     * 删除账户明细
     *
     * @param id 账户明细ID
     * @return 结果
     */
    int deleteAccountDetailById(Long id);

    /**
     * 批量删除账户明细
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteAccountDetailByIds(String[] ids);
}
