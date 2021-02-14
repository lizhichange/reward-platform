package com.ruoyi.system.mapper;


import com.ruoyi.system.domain.Account;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2020-04-06
 */
public interface ExtAccountMapper {
    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
     Account selectAccountById(Long id);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param account 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
     List<Account> selectAccountList(Account account);

    /**
     * 新增【请填写功能名称】
     *
     * @param account 【请填写功能名称】
     * @return 结果
     */
     int insertAccount(Account account);

    /**
     * 修改【请填写功能名称】
     *
     * @param account 【请填写功能名称】
     * @return 结果
     */
     int updateAccount(Account account);

     int updateAccountByAccountId(Account account);

    /**
     * 删除【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
     int deleteAccountById(Long id);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
     int deleteAccountByIds(String[] ids);

}
