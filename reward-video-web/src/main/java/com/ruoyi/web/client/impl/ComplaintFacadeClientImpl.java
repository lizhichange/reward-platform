package com.ruoyi.web.client.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.ruoyi.reward.facade.api.ComplaintFacade;
import com.ruoyi.reward.facade.dto.ComplaintDTO;
import com.ruoyi.web.client.ComplaintFacadeClient;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author sunflower
 */
@Component
public class ComplaintFacadeClientImpl implements ComplaintFacadeClient {

    @Reference(version = "1.0.0", check = false)
    ComplaintFacade complaintFacade;

    @Override
    public ComplaintDTO selectTsById(Long id) {
        return complaintFacade.selectTsById(id);
    }

    @Override
    public List<ComplaintDTO> selectTsList(ComplaintDTO ts) {
        return complaintFacade.selectTsList(ts);
    }

    @Override
    public int insertTs(ComplaintDTO ts) {
        return complaintFacade.insertTs(ts);
    }

    @Override
    public int updateTs(ComplaintDTO ts) {
        return complaintFacade.updateTs(ts);
    }


    @Override
    public int count() {
        return complaintFacade.count();
    }


}
