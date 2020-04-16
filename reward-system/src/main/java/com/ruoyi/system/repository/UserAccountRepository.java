/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.system.repository;

import com.ruoyi.sms.facade.dto.AccountDTO;
import com.ruoyi.system.domain.Account;

import java.util.List;


/**
 * @author lizhi
 */
public interface UserAccountRepository {

    void insert(Account record, String operator);

    AccountDTO queryByUserId(String accountId);

    List<AccountDTO> queryAll();

    boolean modifyBalance(String accountId, long balance, String operator);

}
