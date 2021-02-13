package com.ruoyi.reward.convert;

import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.VideoRelPrice;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.reward.facade.dto.VideoRelPriceDTO;
import org.springframework.beans.BeanUtils;

/**
 * @author sunflower
 */
public class VideoConvert {

    public static VideoDTO convert(Video video) {
        if (video == null) {
            return null;
        }
        VideoDTO dto = new VideoDTO();
        BeanUtils.copyProperties(video, dto);
        return dto;
    }

    public static VideoRelPriceDTO convert(VideoRelPrice video) {
        if (video == null) {
            return null;
        }
        VideoRelPriceDTO dto = new VideoRelPriceDTO();
        BeanUtils.copyProperties(video, dto);
        return dto;
    }


}
