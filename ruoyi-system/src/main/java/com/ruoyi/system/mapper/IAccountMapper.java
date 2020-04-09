package com.ruoyi.system.mapper;


import com.ruoyi.system.domain.Account;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2020-04-06
 */
public interface IAccountMapper {
    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public Account selectAccountById(Long id);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param account 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Account> selectAccountList(Account account);

    /**
     * 新增【请填写功能名称】
     *
     * @param account 【请填写功能名称】
     * @return 结果
     */
    public int insertAccount(Account account);

    /**
     * 修改【请填写功能名称】
     *
     * @param account 【请填写功能名称】
     * @return 结果
     */
    public int updateAccount(Account account);
    public int updateAccountByAccountId(Account account);

    /**
     * 删除【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteAccountById(Long id);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteAccountByIds(String[] ids);

}
