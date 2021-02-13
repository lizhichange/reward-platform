package com.ruoyi.reward.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.ruoyi.reward.convert.VideoConvert;
import com.ruoyi.reward.domain.VideoRelPrice;
import com.ruoyi.reward.facade.api.VideoRelPriceFacade;
import com.ruoyi.reward.facade.dto.VideoRelPriceDTO;
import com.ruoyi.reward.mapper.VideoRelPriceMapper;
import com.ruoyi.reward.service.VideoRelPriceService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author sunflower
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class VideoRelPriceFacadeImpl implements VideoRelPriceFacade {
    @Autowired
    VideoRelPriceMapper videoRelPriceMapper;
    @Autowired
    VideoRelPriceService videoRelPriceService;

    @Override
    public List<VideoRelPriceDTO> selectVideoDTOList(VideoRelPriceDTO item) {
        VideoRelPrice price = new VideoRelPrice();
        BeanUtils.copyProperties(item, price);
        List<VideoRelPrice> list = videoRelPriceService.selectVideoRelPriceList(price);
        return list.stream().map(VideoConvert::convert).collect(Collectors.toList());
    }
}