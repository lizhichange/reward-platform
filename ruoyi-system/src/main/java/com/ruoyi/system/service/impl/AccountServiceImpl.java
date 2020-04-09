package com.ruoyi.system.service.impl;


import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.Account;
import com.ruoyi.system.mapper.IAccountMapper;
import com.ruoyi.system.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2020-04-06
 */
@Service
public class AccountServiceImpl implements IAccountService {
    @Autowired
    private IAccountMapper accountMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public Account selectAccountById(Long id) {
        return accountMapper.selectAccountById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param account 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Account> selectAccountList(Account account) {
        return accountMapper.selectAccountList(account);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param account 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertAccount(Account account) {
        return accountMapper.insertAccount(account);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param account 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateAccount(Account account) {
        return accountMapper.updateAccount(account);
    }

    /**
     * 删除【请填写功能名称】对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteAccountByIds(String ids) {
        return accountMapper.deleteAccountByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteAccountById(Long id) {
        return accountMapper.deleteAccountById(id);
    }

    @Override
    public int changeStatus(Account account) {
        return accountMapper.updateAccountByAccountId(account);
    }
}