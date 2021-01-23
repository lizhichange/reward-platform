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

/**
 * @author sunflower
 */
@RequestMapping("/rest/video")
@RestController
@Slf4j
public class VideoRestController {
    @Autowired
    VideoFacade videoFacade;

    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    @PostMapping("/selectVideoDTOById")
    VideoDTO selectVideoDTOById(@RequestParam("id") Long id) {
        return videoFacade.selectVideoDTOById(id);
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
    @PostMapping("/selectVideoDTOList")
    List<VideoDTO> selectVideoDTOList(@RequestBody VideoDTO item) {
        return videoFacade.selectVideoDTOList(item);
    }

    @PostMapping("/count")
    int count(@RequestBody VideoDTO item) {
        return videoFacade.count(item);

    }

    @PostMapping("/insertVideoDTO")
    int insertVideoDTO(@RequestBody VideoDTO item) {
        return videoFacade.insertVideoDTO(item);
    }

    /**
     * 修改公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    @PostMapping("/updateVideoDTO")
    int updateVideoDTO(@RequestBody VideoDTO item) {
        return videoFacade.updateVideoDTO(item);

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
    @PostMapping("/deleteVideoDTOByIds")
    int deleteVideoDTOByIds(@RequestParam("ids") String ids) {
        return videoFacade.deleteVideoDTOByIds(ids);
    }

    @PostMapping("/deleteVideoDTOById")
    int deleteVideoDTOById(@RequestParam("id") Long id) {
        return videoFacade.deleteVideoDTOById(id);

    }

    @PostMapping(value = "/uploadFile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String handleFileUpload(@RequestPart(value = "file") MultipartFile file) {
        return file.getName();
    }

}
