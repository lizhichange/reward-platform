package com.ruoyi.web.feign;

import com.ruoyi.reward.facade.dto.VideoDTO;
import feign.codec.Encoder;
import feign.form.spring.SpringFormEncoder;
import org.near.servicesupport.result.TPageResult;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@FeignClient(value = "reward-service", path = "/rest/shi"

        , configuration = ShipinFacadeFeign.MultipartSupportConfig.class
)
public interface ShipinFacadeFeign {
    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    @PostMapping("/selectShipinDTOById")
    VideoDTO selectShipinDTOById(@RequestParam("id") Long id);

    @PostMapping("/updateClickPlus")
    int updateClickPlus(@RequestParam("id") Long id);

    /**
     * 查询公共片库列表
     *
     * @param item 公共片库
     * @return 公共片库集合
     */
    @PostMapping("/selectShipinDTOList")
    List<VideoDTO> selectShipinDTOList(@RequestBody VideoDTO item);

    @PostMapping("/count")
    int count(@RequestBody VideoDTO item);

    @PostMapping("/insertShipinDTO")
    int insertShipinDTO(@RequestBody VideoDTO item);

    /**
     * 修改公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    @PostMapping("/updateShipinDTO")
    int updateShipinDTO(@RequestBody VideoDTO item);

    @PostMapping("/queryPage")
    TPageResult<VideoDTO> queryPage(@RequestParam("start") int start,
                                    @RequestParam("rows") int rows,
                                    @RequestBody final VideoDTO videoDTO,
                                    @RequestParam("orderByClause")
                                             String orderByClause);

    /**
     * 批量删除公共片库
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @PostMapping("/deleteShipinDTOByIds")
    int deleteShipinDTOByIds(@RequestParam("ids") String ids);

    @PostMapping("/deleteShipinDTOById")
    int deleteShipinDTOById(@RequestParam("id") Long id);

    @PostMapping(value = "/uploadFile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    String handleFileUpload(@RequestPart(value = "file") MultipartFile file);

    @Configuration
    class MultipartSupportConfig {
        @Bean
        public Encoder feignFormEncoder() {
            return new SpringFormEncoder();
        }
    }

}
