package com.ruoyi.reward.rest;

import com.ruoyi.reward.facade.api.TsFacade;
import com.ruoyi.reward.facade.dto.TsDTO;
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
    private TsFacade tsFacade;

    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    @PostMapping("/selectTsById")

    public TsDTO selectTsById(@RequestParam("id") Long id) {
        return tsFacade.selectTsById(id);
    }

    /**
     * 查询投诉列表列表
     *
     * @param ts 投诉列表
     * @return 投诉列表
     */
    @PostMapping("/selectTsList")

    public List<TsDTO> selectTsList(@RequestBody TsDTO ts) {
        return tsFacade.selectTsList(ts);
    }

    /**
     * 新增投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    @PostMapping("/insertTs")

    public int insertTs(@RequestBody TsDTO ts) {
        return tsFacade.insertTs(ts);
    }

    /**
     * 修改投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    @PostMapping("/updateTs")

    public int updateTs(@RequestBody TsDTO ts) {
        return tsFacade.updateTs(ts);
    }

    /**
     * 删除投诉列表对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @PostMapping("/deleteTsByIds")
    public int deleteTsByIds(@RequestParam("ids") String ids) {
        return tsFacade.deleteTsByIds(ids);
    }

    /**
     * 删除投诉列表信息
     *
     * @param id 投诉列表ID
     * @return 结果
     */
    @PostMapping("/deleteTsById")
    public int deleteTsById(@RequestParam("id") Long id) {
        return tsFacade.deleteTsById(id);
    }
}
