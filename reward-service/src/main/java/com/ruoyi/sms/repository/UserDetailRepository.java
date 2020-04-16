/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.sms.repository;

import com.ruoyi.sms.domain.TUserDetail;
import com.ruoyi.sms.facade.dto.UserDto;

import java.util.List;




/**
 * @author Willard Hu on 2017/11/1.
 */
public interface UserDetailRepository {

    void insert(TUserDetail record, String operator);

    boolean update(TUserDetail record, String operator);

    UserDto queryByPK(String userId);

    List<UserDto> queryByUserIds(List<String> userIds);
}
