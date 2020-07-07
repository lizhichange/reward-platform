package com.ruoyi.reward.mapper;

import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.ShipinExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShipinMapper {
    long countByExample(ShipinExample example);

    int deleteByExample(ShipinExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Video record);

    int insertSelective(Video record);

    List<Video> selectByExample(ShipinExample example);

    Video selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Video record, @Param("example") ShipinExample example);

    int updateByExample(@Param("record") Video record, @Param("example") ShipinExample example);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);
}