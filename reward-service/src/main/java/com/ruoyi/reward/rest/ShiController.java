package com.ruoyi.reward.rest;

import com.ruoyi.reward.facade.api.VideoFacade;
import com.ruoyi.reward.facade.dto.VideoDTO;
import lombok.extern.slf4j.Slf4j;
import org.near.servicesupport.result.TPageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RequestMapping("/rest/shi")
@RestController
@Slf4j
public class ShiController {
    @Autowired
    VideoFacade videoFacade;

    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    @PostMapping("/selectShipinDTOById")
    VideoDTO selectShipinDTOById(@RequestParam("id") Long id) {
        return videoFacade.selectShipinDTOById(id);
    }

    @PostMapping("/updateClickPlus")
    int updateClickPlus(@RequestParam("id") Long id) {
        return videoFacade.updateClickPlus(id);

    }

    /**
     * 查询公共片库列表
     *
     * @param item 公共片库
     * @return 公共片库集合
     */
    @PostMapping("/selectShipinDTOList")
    List<VideoDTO> selectShipinDTOList(@RequestBody VideoDTO item) {
        return videoFacade.selectShipinDTOList(item);
    }

    @PostMapping("/count")
    int count(@RequestBody VideoDTO item) {
        return videoFacade.count(item);

    }

    @PostMapping("/insertShipinDTO")
    int insertShipinDTO(@RequestBody VideoDTO item) {
        return videoFacade.insertShipinDTO(item);
    }

    /**
     * 修改公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    @PostMapping("/updateShipinDTO")
    int updateShipinDTO(@RequestBody VideoDTO item) {
        return videoFacade.updateShipinDTO(item);

    }

    @PostMapping("/queryPage")
    TPageResult<VideoDTO> queryPage(@RequestParam("start") int start,
                                    @RequestParam("rows") int rows,
                                    @RequestBody VideoDTO videoDTO,
                                    @RequestParam("orderByClause")
                                             String orderByClause) {
        return videoFacade.queryPage(start, rows, videoDTO, orderByClause);
    }

    /**
     * 批量删除公共片库
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @PostMapping("/deleteShipinDTOByIds")
    int deleteShipinDTOByIds(@RequestParam("ids") String ids) {
        return videoFacade.deleteShipinDTOByIds(ids);
    }

    @PostMapping("/deleteShipinDTOById")
    int deleteShipinDTOById(@RequestParam("id") Long id) {
        return videoFacade.deleteShipinDTOById(id);

    }

    @PostMapping(value = "/uploadFile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String handleFileUpload(@RequestPart(value = "file") MultipartFile file) {
        return file.getName();
    }

}
