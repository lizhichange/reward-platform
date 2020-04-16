package com.ruoyi.reward.mapper;

import com.ruoyi.reward.domain.Shipin;
import com.ruoyi.reward.domain.ShipinExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ShipinMapper {
    long countByExample(ShipinExample example);

    int deleteByExample(ShipinExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Shipin record);

    int insertSelective(Shipin record);

    List<Shipin> selectByExample(ShipinExample example);

    Shipin selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Shipin record, @Param("example") ShipinExample example);

    int updateByExample(@Param("record") Shipin record, @Param("example") ShipinExample example);

    int updateByPrimaryKeySelective(Shipin record);

    int updateByPrimaryKey(Shipin record);
}