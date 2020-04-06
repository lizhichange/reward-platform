package com.ruoyi.system.mapper;


import com.ruoyi.system.domain.AccountDetail;
import com.ruoyi.system.domain.AccountDetailExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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