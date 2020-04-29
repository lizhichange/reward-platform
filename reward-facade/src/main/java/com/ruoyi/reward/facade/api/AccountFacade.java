package com.ruoyi.reward.facade.api;

import com.ruoyi.reward.facade.dto.SysOrderDTO;

/**
 * @author sunflower
 */
public interface AccountFacade {
    /**
     * @param dto
     */

    void take(SysOrderDTO dto) throws Exception;
}