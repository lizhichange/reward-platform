package com.ruoyi.reward.facade.api;

import com.ruoyi.reward.facade.dto.AccountDTO;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.request.UserAccountOperatorRequest;

/**
 * @author sunflower
 */
public interface AccountFacade {
    /**
     * @param dto
     */

    void take(SysOrderDTO dto) throws Exception;

    AccountDTO minusBalance(UserAccountOperatorRequest request);

}