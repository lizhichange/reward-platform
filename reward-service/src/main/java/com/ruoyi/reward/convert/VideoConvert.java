package com.ruoyi.reward.convert;

import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.facade.dto.VideoDTO;
import org.springframework.beans.BeanUtils;

/**
 * @author sunflower
 */
public class VideoConvert {

    public static VideoDTO convert(Video shipin) {
        if (shipin == null) {
            return null;
        }
        VideoDTO dto = new VideoDTO();
        BeanUtils.copyProperties(shipin, dto);
        return dto;
    }


}
