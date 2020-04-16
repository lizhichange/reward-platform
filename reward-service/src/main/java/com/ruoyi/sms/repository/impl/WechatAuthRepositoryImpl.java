package com.ruoyi.sms.repository.impl;

import com.ruoyi.sms.domain.TWechatAuth;
import com.ruoyi.sms.domain.TWechatAuthExample;
import com.ruoyi.sms.facade.dto.TWechatAuthDTO;
import com.ruoyi.sms.facade.enums.PrincipalTypeEnum;
import com.ruoyi.sms.mapper.TWechatAuthMapper;
import com.ruoyi.sms.repository.WechatAuthRepository;
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
    public boolean delete(String principalId, PrincipalTypeEnum principalType) {
        TWechatAuthExample example = new TWechatAuthExample();
        example.createCriteria().andUserIdEqualTo(principalId)
                .andUserTypeEqualTo(principalType.getCode());
        return wechatAuthMapper.deleteByExample(example) > 0;
    }

    @Override
    public TWechatAuthDTO queryByOpenId(String openId, PrincipalTypeEnum principalType) {
        TWechatAuthExample example = new TWechatAuthExample();
        example.createCriteria().andOpenIdEqualTo(openId)
                .andUserTypeEqualTo(principalType.getCode());
        List<TWechatAuth> list = wechatAuthMapper.selectByExample(example);
        return CollectionUtils.isEmpty(list) ? null : conv(list.get(0));
    }

    @Override
    public TWechatAuthDTO queryByPrincipalId(String principalId, PrincipalTypeEnum principalType) {
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
        PrincipalTypeEnum principalType = EnumUtil.queryByCode(record.getUserType(),
                PrincipalTypeEnum.class);
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
