package com.ruoyi.sms.mapper;

import com.ruoyi.sms.domain.Yqm;
import com.ruoyi.sms.domain.YqmExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface YqmMapper {
    long countByExample(YqmExample example);

    int deleteByExample(YqmExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Yqm record);

    int insertSelective(Yqm record);

    List<Yqm> selectByExample(YqmExample example);

    Yqm selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Yqm record, @Param("example") YqmExample example);

    int updateByExample(@Param("record") Yqm record, @Param("example") YqmExample example);

    int updateByPrimaryKeySelective(Yqm record);

    int updateByPrimaryKey(Yqm record);
}