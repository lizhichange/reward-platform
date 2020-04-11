/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.sms.repository;


import com.ruoyi.sms.domain.TWechatAuth;

import com.ruoyi.sms.facade.dto.TWechatAuthDTO;
import com.ruoyi.sms.facade.enums.PrincipalTypeEnum;

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
