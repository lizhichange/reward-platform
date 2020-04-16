package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.ext.ExtSysOrder;
import com.ruoyi.system.domain.ext.SysOrderExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExtSysOrderMapper {
    long countByExample(SysOrderExample example);

    int deleteByExample(SysOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExtSysOrder record);

    int insertSelective(ExtSysOrder record);

    List<ExtSysOrder> selectByExampleWithBLOBs(SysOrderExample example);

    List<ExtSysOrder> selectByExample(SysOrderExample example);

    ExtSysOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExtSysOrder record, @Param("example") SysOrderExample example);

    int updateByExampleWithBLOBs(@Param("record") ExtSysOrder record, @Param("example") SysOrderExample example);

    int updateByExample(@Param("record") ExtSysOrder record, @Param("example") SysOrderExample example);

    int updateByPrimaryKeySelective(ExtSysOrder record);

    int updateByPrimaryKeyWithBLOBs(ExtSysOrder record);

    int updateByPrimaryKey(ExtSysOrder record);
}