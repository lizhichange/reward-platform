package com.ruoyi.reward.convert;

import com.ruoyi.reward.domain.Shipin;
import com.ruoyi.reward.facade.dto.ShipinDTO;
import org.springframework.beans.BeanUtils;

/**
 * @author sunflower
 */
public class ShipinConvert {

    public static ShipinDTO convert(Shipin shipin) {
        if (shipin == null) {
            return null;
        }
        ShipinDTO dto = new ShipinDTO();
        BeanUtils.copyProperties(shipin, dto);
        return dto;
    }


}
