/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.system.repository.impl;


import com.ruoyi.sms.facade.dto.AccountDetailDTO;
import com.ruoyi.system.domain.AccountDetail;
import com.ruoyi.system.domain.AccountDetailExample;
import com.ruoyi.system.mapper.AccountDetailMapper;
import com.ruoyi.system.repository.UserAccountDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author lizhi
 */
@Repository
public class UserAccountDetailRepositoryImpl implements UserAccountDetailRepository {


    @Autowired
    private AccountDetailMapper accountDetailMapper;

    @Override
    public void insert(AccountDetail record) {
        Date now = new Date();
        record.setGmtCreate(now);
        record.setGmtModified(now);
        accountDetailMapper.insertSelective(record);
    }

    @Override
    public List<AccountDetailDTO> query(AccountDetailExample example) {
        return conv(accountDetailMapper.selectByExample(example));
    }

    @Override
    public long count(AccountDetailExample example) {
        return accountDetailMapper.countByExample(example);
    }

    private AccountDetailDTO conv(AccountDetail src) {
        if (src == null) {
            return null;
        }
        AccountDetailDTO target = new AccountDetailDTO();
        target.setId(src.getId());
        target.setAccountId(src.getAccountId());
        target.setAmount(src.getAmount());
        target.setOptType(src.getOptType());
        target.setRemark(src.getRemark());
        target.setOutTradeNo(src.getOutTradeNo());
        target.setBizCode(src.getBizCode());
        target.setSourceCode(src.getSourceCode());
        target.setGmtCreate(src.getGmtCreate());
        target.setGmtModified(src.getGmtModified());
        return target;
    }

    private List<AccountDetailDTO> conv(List<AccountDetail> list) {
        if (CollectionUtils.isEmpty(list)) {
            return Collections.emptyList();
        }
        return list.stream().map(this::conv).collect(Collectors.toList());
    }
}
