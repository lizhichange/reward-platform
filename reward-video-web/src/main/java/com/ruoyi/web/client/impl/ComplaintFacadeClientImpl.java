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
    public ComplaintDTO selectComplaintById(Long id) {
        return complaintFacade.selectComplaintById(id);
    }

    @Override
    public List<ComplaintDTO> selectComplaintList(ComplaintDTO ts) {
        return complaintFacade.selectComplaintList(ts);
    }

    @Override
    public int insertComplaint(ComplaintDTO ts) {
        return complaintFacade.insertComplaint(ts);
    }

    @Override
    public int updateComplaint(ComplaintDTO ts) {
        return complaintFacade.updateComplaint(ts);
    }


    @Override
    public int count() {
        return complaintFacade.count();
    }


}
