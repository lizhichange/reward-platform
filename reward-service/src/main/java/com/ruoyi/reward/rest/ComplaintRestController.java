package com.ruoyi.reward.rest;

import com.ruoyi.reward.facade.api.ComplaintFacade;
import com.ruoyi.reward.facade.dto.ComplaintDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author sunflower
 */
@RequestMapping("/rest/ts")
@RestController
@Slf4j
public class ComplaintRestController {
    @Autowired
    private ComplaintFacade complaintFacade;

    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    @PostMapping("/selectComplaintById")

    public ComplaintDTO selectComplaintById(@RequestParam("id") Long id) {
        return complaintFacade.selectComplaintById(id);
    }

    /**
     * 查询投诉列表列表
     *
     * @param ts 投诉列表
     * @return 投诉列表
     */
    @PostMapping("/selectComplaintList")

    public List<ComplaintDTO> selectComplaintList(@RequestBody ComplaintDTO ts) {
        return complaintFacade.selectComplaintList(ts);
    }

    /**
     * 新增投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    @PostMapping("/insertComplaint")

    public int insertComplaint(@RequestBody ComplaintDTO ts) {
        return complaintFacade.insertComplaint(ts);
    }

    /**
     * 修改投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    @PostMapping("/updateComplaint")

    public int updateComplaint(@RequestBody ComplaintDTO ts) {
        return complaintFacade.updateComplaint(ts);
    }

    /**
     * 删除投诉列表对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @PostMapping("/deleteComplaintByIds")
    public int deleteComplaintByIds(@RequestParam("ids") String ids) {
        return complaintFacade.deleteComplaintByIds(ids);
    }

    /**
     * 删除投诉列表信息
     *
     * @param id 投诉列表ID
     * @return 结果
     */
    @PostMapping("/deleteComplaintById")
    public int deleteComplaintById(@RequestParam("id") Long id) {
        return complaintFacade.deleteComplaintById(id);
    }
}
