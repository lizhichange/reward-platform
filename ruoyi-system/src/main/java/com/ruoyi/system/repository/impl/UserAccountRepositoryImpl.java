/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.system.repository.impl;

import com.ruoyi.sms.facade.dto.AccountDTO;
import com.ruoyi.system.domain.Account;
import com.ruoyi.system.domain.AccountExample;
import com.ruoyi.system.mapper.AccountMapper;
import com.ruoyi.system.mapper.ExtUserAccountMapper;
import com.ruoyi.system.repository.UserAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author lizhi
 */
@Repository
public class UserAccountRepositoryImpl implements UserAccountRepository {
    @Autowired
    AccountMapper accountMapper;
    @Autowired
    ExtUserAccountMapper extUserAccountMapper;

    @Override
    public void insert(Account record, String operator) {
        Date now = new Date();
        record.setGmtCreate(now);
        record.setCreateBy(operator);
        record.setGmtModified(now);
        record.setModifiedBy(operator);
        accountMapper.insertSelective(record);
    }

    @Override
    public AccountDTO queryByUserId(String userId) {
        AccountExample example = new AccountExample();
        example.createCriteria().andAccountIdEqualTo(userId);
        List<Account> list = accountMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        return convert(list.get(0));
    }

    @Override
    public List<AccountDTO> queryAll() {
        List<Account> list = accountMapper.selectByExample(new AccountExample());
        return list.stream().map(this::convert).collect(Collectors.toList());
    }

    @Override
    public boolean modifyBalance(String userId, long balance, String operator) {
        return extUserAccountMapper.updateBalance(userId, balance, operator);
    }


    private AccountDTO convert(Account src) {
        if (src == null) {
            return null;
        }
        AccountDTO target = new AccountDTO();
        target.setAccountId(src.getAccountId());
        target.setBalance(src.getBalance());
        target.setState(src.getState());
        target.setGmtCreate(src.getGmtCreate());
        target.setCreateBy(src.getCreateBy());
        target.setGmtModified(src.getGmtModified());
        target.setModifiedBy(src.getModifiedBy());
        target.setAccountType(src.getAccountType());
        return target;
    }
}
