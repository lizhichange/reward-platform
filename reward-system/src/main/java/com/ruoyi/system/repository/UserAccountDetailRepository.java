/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.system.repository;


import com.ruoyi.reward.facade.dto.AccountDetailDTO;
import com.ruoyi.system.domain.AccountDetail;
import com.ruoyi.system.domain.AccountDetailExample;

import java.util.List;


/**
 * @author lizhi
 */
public interface UserAccountDetailRepository {

    void insert(AccountDetail record);

    List<AccountDetailDTO> query(AccountDetailExample example);

    long count(AccountDetailExample example);
}
