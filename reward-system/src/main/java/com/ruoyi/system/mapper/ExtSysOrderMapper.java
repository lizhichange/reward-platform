package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.ExtSysOrder;
import com.ruoyi.system.domain.ExtSysOrderExample;
import com.ruoyi.system.domain.ExtSysOrderTimeCount;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExtSysOrderMapper {
    long countByExample(ExtSysOrderExample example);

    int deleteByExample(ExtSysOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExtSysOrder record);


    int insertSelective(ExtSysOrder record);

    List<ExtSysOrder> selectByExampleWithBLOBs(ExtSysOrderExample example);

    List<ExtSysOrder> selectByExample(ExtSysOrderExample example);

    ExtSysOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExtSysOrder record, @Param("example") ExtSysOrderExample example);

    int updateByExampleWithBLOBs(@Param("record") ExtSysOrder record, @Param("example") ExtSysOrderExample example);


    List<ExtSysOrderTimeCount> selectGroupByTime(
            @Param("startTime") String startTime,
            @Param("endTime") String endTime,
            @Param("extensionUserId") String extensionUserId,
            @Param("status") Integer status);

    int countStatus(@Param("startTime") String startTime,
                     @Param("endTime") String endTime,
                     @Param("extensionUserId") String extensionUserId,
                     @Param("status") Integer status);


    int countMoney(@Param("startTime") String startTime,
                     @Param("endTime") String endTime,
                     @Param("extensionUserId") String extensionUserId,
                     @Param("status") Integer status);


    int updateByExample(@Param("record") ExtSysOrder record, @Param("example") ExtSysOrderExample example);

    int updateByPrimaryKeySelective(ExtSysOrder record);

    int updateByPrimaryKeyWithBLOBs(ExtSysOrder record);

    int updateByPrimaryKey(ExtSysOrder record);
}