package com.ruoyi.reward.mapper;

import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.reward.domain.EnterpriseInfo;
import com.ruoyi.reward.domain.EnterpriseInfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@DataSource(DataSourceType.SLAVE)
public interface EnterpriseInfoMapper {
    long countByExample(EnterpriseInfoExample example);

    int deleteByExample(EnterpriseInfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EnterpriseInfo record);

    int insertSelective(EnterpriseInfo record);

    List<EnterpriseInfo> selectByExample(EnterpriseInfoExample example);

    EnterpriseInfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EnterpriseInfo record, @Param("example") EnterpriseInfoExample example);

    int updateByExample(@Param("record") EnterpriseInfo record, @Param("example") EnterpriseInfoExample example);

    int updateByPrimaryKeySelective(EnterpriseInfo record);

    int updateByPrimaryKey(EnterpriseInfo record);
}