package com.ruoyi.sms.mapper;

import com.ruoyi.sms.domain.TUserDetail;
import com.ruoyi.sms.domain.TUserDetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TUserDetailMapper {
    long countByExample(TUserDetailExample example);

    int deleteByExample(TUserDetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TUserDetail record);

    int insertSelective(TUserDetail record);

    List<TUserDetail> selectByExample(TUserDetailExample example);

    TUserDetail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TUserDetail record, @Param("example") TUserDetailExample example);

    int updateByExample(@Param("record") TUserDetail record, @Param("example") TUserDetailExample example);

    int updateByPrimaryKeySelective(TUserDetail record);

    int updateByPrimaryKey(TUserDetail record);
}