package com.ruoyi.reward.mapper;

import com.ruoyi.reward.domain.TWechatAuth;
import com.ruoyi.reward.domain.TWechatAuthExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TWechatAuthMapper {
    long countByExample(TWechatAuthExample example);

    int deleteByExample(TWechatAuthExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TWechatAuth record);

    int insertSelective(TWechatAuth record);

    List<TWechatAuth> selectByExample(TWechatAuthExample example);

    TWechatAuth selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TWechatAuth record, @Param("example") TWechatAuthExample example);

    int updateByExample(@Param("record") TWechatAuth record, @Param("example") TWechatAuthExample example);

    int updateByPrimaryKeySelective(TWechatAuth record);

    int updateByPrimaryKey(TWechatAuth record);
}