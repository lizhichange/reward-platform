package com.ruoyi.sms.convert;

import com.ruoyi.sms.domain.Shipin;
import com.ruoyi.sms.facade.dto.ShipinDTO;
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
