package com.ruoyi.web.feign;

import com.ruoyi.reward.facade.dto.ShipinDTO;
import org.near.servicesupport.result.TPageResult;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(value = "reward-service")
public interface ShiFacadeFeign {
    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    @PostMapping("/selectShipinDTOById")
    ShipinDTO selectShipinDTOById(Long id);

    @PostMapping("/updateClickPlus")
    int updateClickPlus(Long id);

    /**
     * 查询公共片库列表
     *
     * @param item 公共片库
     * @return 公共片库集合
     */
    @PostMapping("/selectShipinDTOList")
    List<ShipinDTO> selectShipinDTOList(ShipinDTO item);

    @PostMapping("/count")
    int count(ShipinDTO item);

    @PostMapping("/insertShipinDTO")
    int insertShipinDTO(ShipinDTO item);

    /**
     * 修改公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    @PostMapping("/updateShipinDTO")
    int updateShipinDTO(ShipinDTO item);

    @PostMapping("/queryPage")
    TPageResult<ShipinDTO> queryPage(@RequestParam("start") int start,
                                     @RequestParam("rows") int rows,


                                     @RequestBody final ShipinDTO shipinDTO,
                                     @RequestParam("orderByClause")
                                             String orderByClause);

    /**
     * 批量删除公共片库
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @PostMapping("/deleteShipinDTOByIds")
    int deleteShipinDTOByIds(String ids);

    @PostMapping("/deleteShipinDTOById")
    int deleteShipinDTOById(Long id);

}
