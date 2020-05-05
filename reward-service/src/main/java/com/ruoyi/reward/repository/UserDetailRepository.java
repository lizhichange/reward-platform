/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.reward.repository;

import com.ruoyi.reward.domain.TUserDetail;
import com.ruoyi.reward.facade.dto.UserDTO;

import java.util.List;


/**
 * @author Willard Hu on 2017/11/1.
 */
public interface UserDetailRepository {

    void insert(TUserDetail record, String operator);

    boolean update(TUserDetail record, String operator);

    UserDTO queryByPK(String userId);

    UserDTO queryByUserName(String userName);

    List<UserDTO> queryByUserIds(List<String> userIds);
}
