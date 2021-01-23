package com.ruoyi.web.feign;

import com.ruoyi.reward.facade.dto.ComplaintDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


/**
 * @author sunflower
 */
@FeignClient(value = "reward-service", path = "/rest/complaint")
public interface ComplaintFeign {

    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    @PostMapping("/selectTsById")
    ComplaintDTO selectTsById(@RequestParam("id") Long id);

    /**
     * 查询投诉列表列表
     *
     * @param complaint 投诉列表
     * @return 投诉列表
     */
    @PostMapping("/selectTsList")
    List<ComplaintDTO> selectTsList(@RequestBody ComplaintDTO complaint);

    /**
     * 新增投诉列表
     *
     * @param complaint 投诉列表
     * @return 结果
     */
    @PostMapping("/insertTs")
    int insertTs(@RequestBody ComplaintDTO complaint);

    /**
     * 修改投诉列表
     *
     * @param complaint 投诉列表
     * @return 结果
     */
    @PostMapping("/updateTs")
    int updateTs(@RequestBody ComplaintDTO complaint);


    /**
     * 删除投诉列表对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @PostMapping("/deleteTsByIds")
    int deleteTsByIds(@RequestParam("ids") String ids);

    /**
     * 删除投诉列表信息
     *
     * @param id 投诉列表ID
     * @return 结果
     */
    @PostMapping("/deleteTsById")
    int deleteTsById(@RequestParam("id") Long id);

}
