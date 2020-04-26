package com.ruoyi.reward.rest;

import com.ruoyi.reward.facade.api.IShipinFacade;
import com.ruoyi.reward.facade.dto.ShipinDTO;
import lombok.extern.slf4j.Slf4j;
import org.near.servicesupport.result.TPageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/rest/shi")
@RestController
@Slf4j
public class ShiController {
    @Autowired
    IShipinFacade shipinFacade;

    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    @PostMapping("/selectShipinDTOById")
    ShipinDTO selectShipinDTOById(Long id) {
        return shipinFacade.selectShipinDTOById(id);
    }

    @PostMapping("/updateClickPlus")
    int updateClickPlus(Long id) {
        return shipinFacade.updateClickPlus(id);

    }

    /**
     * 查询公共片库列表
     *
     * @param item 公共片库
     * @return 公共片库集合
     */
    @PostMapping("/selectShipinDTOList")
    List<ShipinDTO> selectShipinDTOList(ShipinDTO item) {
        return shipinFacade.selectShipinDTOList(item);
    }

    @PostMapping("/count")
    int count(ShipinDTO item) {
        return shipinFacade.count(item);

    }

    @PostMapping("/insertShipinDTO")
    int insertShipinDTO(ShipinDTO item) {
        return shipinFacade.insertShipinDTO(item);
    }

    /**
     * 修改公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    @PostMapping("/updateShipinDTO")
    int updateShipinDTO(ShipinDTO item) {
        return shipinFacade.updateShipinDTO(item);

    }

    @PostMapping("/queryPage")
    TPageResult<ShipinDTO> queryPage(int start, int rows, ShipinDTO shipinDTO, String orderByClause) {
        return shipinFacade.queryPage(start, rows, shipinDTO, orderByClause);
    }

    /**
     * 批量删除公共片库
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @PostMapping("/deleteShipinDTOByIds")
    int deleteShipinDTOByIds(String ids) {
        return shipinFacade.deleteShipinDTOByIds(ids);
    }

    @PostMapping("/deleteShipinDTOById")
    int deleteShipinDTOById(Long id) {
        return shipinFacade.deleteShipinDTOById(id);

    }

}
