/*
 * Copyright (c) 2017.  Willard Hu. All rights reserved.
 */

package com.ruoyi.system.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author lizhi
 */
public interface ExtUserAccountMapper {

    boolean updateBalance(@Param("accountId") String accountId,
                          @Param("balance") long balance,
                          @Param("operator") String operator);


    long querySum(@Param("accountId") String accountId,
                  @Param("bizCodes") List<String> bizCodes,
                  @Param("optType") String optType);

}
