package com.ruoyi.reward.mapper;

import com.ruoyi.reward.domain.Ts;
import com.ruoyi.reward.domain.TsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TsMapper {
    long countByExample(TsExample example);

    int deleteByExample(TsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Ts record);

    int insertSelective(Ts record);

    List<Ts> selectByExample(TsExample example);

    Ts selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Ts record, @Param("example") TsExample example);

    int updateByExample(@Param("record") Ts record, @Param("example") TsExample example);

    int updateByPrimaryKeySelective(Ts record);

    int updateByPrimaryKey(Ts record);
}