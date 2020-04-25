package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.ITsFacade;
import com.ruoyi.reward.facade.dto.TsDTO;
import com.ruoyi.web.client.ITsFacadeClient;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class ITsFacadeClientImpl implements ITsFacadeClient {

    @Reference(version = "1.0.0", check = false)
    ITsFacade iTsFacade;

    @Override
    public TsDTO selectTsById(Long id) {
        return iTsFacade.selectTsById(id);
    }

    @Override
    public List<TsDTO> selectTsList(TsDTO ts) {
        return iTsFacade.selectTsList(ts);
    }

    @Override
    public int insertTs(TsDTO ts) {
        return iTsFacade.insertTs(ts);
    }

    @Override
    public int updateTs(TsDTO ts) {
        return iTsFacade.updateTs(ts);
    }


    @Override
    public int count() {
        return iTsFacade.count();
    }


}
