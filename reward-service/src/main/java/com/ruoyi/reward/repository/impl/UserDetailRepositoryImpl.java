/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.reward.repository.impl;

import com.ruoyi.reward.domain.TUserDetail;
import com.ruoyi.reward.domain.TUserDetailExample;
import com.ruoyi.reward.facade.dto.UserDTO;
import com.ruoyi.reward.mapper.TUserDetailMapper;
import com.ruoyi.reward.repository.UserDetailRepository;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;


/**
 *
 */
@Repository
public class UserDetailRepositoryImpl implements UserDetailRepository {

    @Autowired
    TUserDetailMapper tUserDetailMapper;

    @Override
    public void insert(TUserDetail record, String operator) {
        Date now = new Date();
        // emoji 处理
        record.setNickname(Base64.encodeBase64String(record.getNickname().getBytes()));
        record.setGmtCreate(now);
        record.setCreateBy(operator);
        record.setGmtModified(now);
        record.setModifiedBy(operator);
        tUserDetailMapper.insertSelective(record);
    }

    @Override
    public boolean update(TUserDetail record, String operator) {
        record.setGmtModified(new Date());
        record.setModifiedBy(operator);
        return tUserDetailMapper.updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public UserDTO queryByPK(String userId) {
        TUserDetailExample example = new TUserDetailExample();
        example.createCriteria().andUserIdEqualTo(userId);
        List<TUserDetail> list = tUserDetailMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        return conv(list.get(0));
    }

    @Override
    public UserDTO queryByUserName(String userName) {
        TUserDetailExample example = new TUserDetailExample();
        example.createCriteria().andUserNameEqualTo(userName);
        List<TUserDetail> list = tUserDetailMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        return conv(list.get(0));

    }

    @Override
    public List<UserDTO> queryByUserIds(List<String> userIds) {
        TUserDetailExample example = new TUserDetailExample();
        example.createCriteria().andUserIdIn(userIds);
        return conv(tUserDetailMapper.selectByExample(example));
    }

    private UserDTO conv(TUserDetail src) {
        if (src == null) {
            return null;
        }
        // emoji 处理
        UserDTO target = new UserDTO();
        target.setUserId(src.getUserId());
        target.setId(src.getId());
        target.setNickname(new String(Base64.decodeBase64(src.getNickname())));
        target.setName(src.getName());
        target.setGender(src.getGender());
        target.setIdCard(src.getIdCard());
        target.setMobileNo(src.getMobileNo());
        target.setBirthday(src.getBirthday());
        target.setCreateBy(src.getCreateBy());
        target.setGmtCreate(src.getGmtCreate());
        target.setModifiedBy(src.getModifiedBy());
        target.setAvatarUrl(src.getAvatarUrl());
        target.setGmtModified(src.getGmtModified());
        target.setUserName(src.getUserName());
        target.setPassword(src.getPassword());
        return target;
    }

    private List<UserDTO> conv(List<TUserDetail> list) {
        if (CollectionUtils.isEmpty(list)) {
            return Collections.emptyList();
        }
        return list.stream().map(this::conv).collect(Collectors.toList());
    }
}
