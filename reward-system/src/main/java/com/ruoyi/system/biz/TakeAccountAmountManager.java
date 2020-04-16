package com.ruoyi.system.biz;


import com.ruoyi.sms.facade.dto.AccountDTO;
import com.ruoyi.sms.facade.request.UserAccountCreateRequest;
import com.ruoyi.sms.facade.request.UserAccountOperatorRequest;

/**
 * 关联用户账户余额管理
 *
 * @author lizhi
 * @date 2018 -7-12
 */
public interface TakeAccountAmountManager {

    /**
     * Add balance user account dto.
     *
     * @param request the request
     * @return the user account dto
     */
    AccountDTO addBalance(UserAccountOperatorRequest request)  ;

    /**
     * Minus balance user account dto.
     *
     * @param request the request
     * @return the user account dto
     */
    AccountDTO minusBalance(UserAccountOperatorRequest request)  ;

    /**
     * Create.创建用户账户信息
     *
     * @param request the request
     */
    void create(UserAccountCreateRequest request);

}
