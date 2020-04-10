package com.ruoyi.sms.repository.impl;

import com.ruoyi.sms.domain.WechatAuthDO;
import com.ruoyi.sms.domain.WechatAuthDOExample;
import com.ruoyi.sms.facade.dto.WechatAuthDto;
import com.ruoyi.sms.facade.enums.PrincipalTypeEnum;
import com.ruoyi.sms.mapper.WechatAuthDOMapper;
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
    private WechatAuthDOMapper wechatAuthDOMapper;

    @Override
    public void insert(WechatAuthDO record, String operator) {
        Date now = new Date();
        record.setGmtCreate(now);
        record.setCreateBy(operator);
        record.setGmtModified(now);
        record.setModifiedBy(operator);
        wechatAuthDOMapper.insertSelective(record);
    }

    @Override
    public boolean update(WechatAuthDO record, String operator) {
        record.setGmtModified(new Date());
        record.setModifiedBy(operator);
        return wechatAuthDOMapper.updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public boolean delete(String principalId, PrincipalTypeEnum principalType) {
        WechatAuthDOExample example = new WechatAuthDOExample();
        example.createCriteria().andPrincipalIdEqualTo(principalId)
                .andPrincipalTypeEqualTo(principalType.getCode());
        return wechatAuthDOMapper.deleteByExample(example) > 0;
    }

    @Override
    public WechatAuthDto queryByOpenId(String openId, PrincipalTypeEnum principalType) {
        WechatAuthDOExample example = new WechatAuthDOExample();
        example.createCriteria().andOpenIdEqualTo(openId)
                .andPrincipalTypeEqualTo(principalType.getCode());
        List<WechatAuthDO> list = wechatAuthDOMapper.selectByExample(example);
        return CollectionUtils.isEmpty(list) ? null : conv(list.get(0));
    }

    @Override
    public WechatAuthDto queryByPrincipalId(String principalId, PrincipalTypeEnum principalType) {
        WechatAuthDOExample example = new WechatAuthDOExample();
        example.createCriteria().andPrincipalIdEqualTo(principalId)
                .andPrincipalTypeEqualTo(principalType.getCode());
        List<WechatAuthDO> list = wechatAuthDOMapper.selectByExample(example);
        return CollectionUtils.isEmpty(list) ? null : conv(list.get(0));
    }

    public static WechatAuthDto conv(WechatAuthDO record) {
        if (record == null) {
            return null;
        }
        WechatAuthDto dto = new WechatAuthDto();
        dto.setId(record.getId());
        dto.setOpenId(record.getOpenId());
        dto.setPrincipalId(record.getPrincipalId());
        PrincipalTypeEnum principalType = EnumUtil.queryByCode(record.getPrincipalType(),
                PrincipalTypeEnum.class);
        assert principalType != null;
        dto.setPrincipalType(principalType);
        dto.setAppId(record.getAppid());
        dto.setUnionid(record.getUnionid());
        dto.setSubscribe(record.getSubscribe());
        dto.setCreateBy(record.getCreateBy());
        dto.setGmtCreate(record.getGmtCreate());
        dto.setModifiedBy(record.getModifiedBy());
        dto.setGmtModified(record.getGmtModified());
        return dto;
    }
}
