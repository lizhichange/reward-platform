package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.TsFacade;
import com.ruoyi.reward.facade.dto.TsDTO;
import com.ruoyi.web.client.TsFacadeClient;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class TsFacadeClientImpl implements TsFacadeClient {

    @Reference(version = "1.0.0", check = false)
    TsFacade tsFacade;

    @Override
    public TsDTO selectTsById(Long id) {
        return tsFacade.selectTsById(id);
    }

    @Override
    public List<TsDTO> selectTsList(TsDTO ts) {
        return tsFacade.selectTsList(ts);
    }

    @Override
    public int insertTs(TsDTO ts) {
        return tsFacade.insertTs(ts);
    }

    @Override
    public int updateTs(TsDTO ts) {
        return tsFacade.updateTs(ts);
    }


    @Override
    public int count() {
        return tsFacade.count();
    }


}
