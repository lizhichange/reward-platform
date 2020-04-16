/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.reward.repository;


import com.ruoyi.reward.domain.TWechatAuth;

import com.ruoyi.reward.facade.dto.TWechatAuthDTO;
import com.ruoyi.reward.facade.enums.PrincipalTypeEnum;

/**
 * @author Willard.Hu on 2017/10/31.
 */
public interface WechatAuthRepository {

    void insert(TWechatAuth record, String operator);

    boolean update(TWechatAuth record, String operator);

    boolean delete(String principalId, PrincipalTypeEnum principalType);

    TWechatAuthDTO queryByOpenId(String openId, PrincipalTypeEnum principalType);

    TWechatAuthDTO queryByPrincipalId(String principalId, PrincipalTypeEnum principalType);
}
