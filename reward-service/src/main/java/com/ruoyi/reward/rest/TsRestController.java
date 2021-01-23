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
public class TsRestController {
    @Autowired
    private ComplaintFacade complaintFacade;

    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    @PostMapping("/selectTsById")

    public ComplaintDTO selectTsById(@RequestParam("id") Long id) {
        return complaintFacade.selectTsById(id);
    }

    /**
     * 查询投诉列表列表
     *
     * @param ts 投诉列表
     * @return 投诉列表
     */
    @PostMapping("/selectTsList")

    public List<ComplaintDTO> selectTsList(@RequestBody ComplaintDTO ts) {
        return complaintFacade.selectTsList(ts);
    }

    /**
     * 新增投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    @PostMapping("/insertTs")

    public int insertTs(@RequestBody ComplaintDTO ts) {
        return complaintFacade.insertTs(ts);
    }

    /**
     * 修改投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    @PostMapping("/updateTs")

    public int updateTs(@RequestBody ComplaintDTO ts) {
        return complaintFacade.updateTs(ts);
    }

    /**
     * 删除投诉列表对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @PostMapping("/deleteTsByIds")
    public int deleteTsByIds(@RequestParam("ids") String ids) {
        return complaintFacade.deleteTsByIds(ids);
    }

    /**
     * 删除投诉列表信息
     *
     * @param id 投诉列表ID
     * @return 结果
     */
    @PostMapping("/deleteTsById")
    public int deleteTsById(@RequestParam("id") Long id) {
        return complaintFacade.deleteTsById(id);
    }
}
