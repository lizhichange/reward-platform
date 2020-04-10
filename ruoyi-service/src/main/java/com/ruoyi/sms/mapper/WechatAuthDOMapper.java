package com.ruoyi.sms.mapper;


import com.ruoyi.sms.domain.WechatAuthDO;
import com.ruoyi.sms.domain.WechatAuthDOExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;




public interface WechatAuthDOMapper {
    long countByExample(WechatAuthDOExample example);

    int deleteByExample(WechatAuthDOExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(WechatAuthDO record);

    int insertSelective(WechatAuthDO record);

    List<WechatAuthDO> selectByExample(WechatAuthDOExample example);

    WechatAuthDO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") WechatAuthDO record, @Param("example") WechatAuthDOExample example);

    int updateByExample(@Param("record") WechatAuthDO record, @Param("example") WechatAuthDOExample example);

    int updateByPrimaryKeySelective(WechatAuthDO record);

    int updateByPrimaryKey(WechatAuthDO record);
}