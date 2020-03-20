package com.ruoyi.sms.mapper;

import com.ruoyi.sms.domain.AccountDetail;
import com.ruoyi.sms.domain.AccountDetailExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AccountDetailMapper {
    long countByExample(AccountDetailExample example);

    int deleteByExample(AccountDetailExample example);

    int deleteByPrimaryKey(Long id);

    int insert(AccountDetail record);

    int insertSelective(AccountDetail record);

    List<AccountDetail> selectByExample(AccountDetailExample example);

    AccountDetail selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") AccountDetail record, @Param("example") AccountDetailExample example);

    int updateByExample(@Param("record") AccountDetail record, @Param("example") AccountDetailExample example);

    int updateByPrimaryKeySelective(AccountDetail record);

    int updateByPrimaryKey(AccountDetail record);
}