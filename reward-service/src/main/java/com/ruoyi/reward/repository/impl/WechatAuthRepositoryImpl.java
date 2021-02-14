package com.ruoyi.reward.repository.impl;

import com.ruoyi.reward.domain.TWechatAuth;
import com.ruoyi.reward.domain.TWechatAuthExample;
import com.ruoyi.reward.facade.dto.TWechatAuthDTO;
import com.ruoyi.reward.facade.enums.PrincipalType;
import com.ruoyi.reward.mapper.TWechatAuthMapper;
import com.ruoyi.reward.repository.WechatAuthRepository;
import org.near.toolkit.common.EnumUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;


/**
 * @author Willard Hu on 2017/10/31.
 */
@Repository
public class WechatAuthRepositoryImpl implements WechatAuthRepository {
    @Autowired
    private TWechatAuthMapper wechatAuthMapper;

    @Override
    public void insert(TWechatAuth record, String operator) {
        Date now = new Date();
        record.setGmtCreate(now);
        record.setCreateBy(operator);
        record.setGmtModified(now);
        record.setModifiedBy(operator);
        wechatAuthMapper.insertSelective(record);
    }

    @Override
    public boolean update(TWechatAuth record, String operator) {
        record.setGmtModified(new Date());
        record.setModifiedBy(operator);
        return wechatAuthMapper.updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public boolean delete(String principalId, PrincipalType principalType) {
        TWechatAuthExample example = new TWechatAuthExample();
        example.createCriteria().andUserIdEqualTo(principalId)
                .andUserTypeEqualTo(principalType.getCode());
        return wechatAuthMapper.deleteByExample(example) > 0;
    }

    @Override
    public TWechatAuthDTO queryByOpenId(String openId, PrincipalType principalType) {
        TWechatAuthExample example = new TWechatAuthExample();
        example.createCriteria().andOpenIdEqualTo(openId)
                .andUserTypeEqualTo(principalType.getCode());
        List<TWechatAuth> list = wechatAuthMapper.selectByExample(example);
        return CollectionUtils.isEmpty(list) ? null : conv(list.get(0));
    }

    @Override
    public TWechatAuthDTO queryByPrincipalId(String principalId, PrincipalType principalType) {
        TWechatAuthExample example = new TWechatAuthExample();
        example.createCriteria().andUserIdEqualTo(principalId)
                .andUserTypeEqualTo(principalType.getCode());
        List<TWechatAuth> list = wechatAuthMapper.selectByExample(example);
        return CollectionUtils.isEmpty(list) ? null : conv(list.get(0));
    }

    public static TWechatAuthDTO conv(TWechatAuth record) {
        if (record == null) {
            return null;
        }
        TWechatAuthDTO dto = new TWechatAuthDTO();
        dto.setId(record.getId());
        dto.setOpenId(record.getOpenId());
        dto.setUserId(record.getUserId());
        PrincipalType principalType = EnumUtil.queryByCode(record.getUserType(),
                PrincipalType.class);
        assert principalType != null;
        dto.setUserType(principalType);
        dto.setAppid(record.getAppid());
        dto.setUnionid(record.getUnionid());
        dto.setSubscribe(record.getSubscribe());
        dto.setCreateBy(record.getCreateBy());
        dto.setGmtCreate(record.getGmtCreate());
        dto.setModifiedBy(record.getModifiedBy());
        dto.setGmtModified(record.getGmtModified());
        return dto;
    }
}
