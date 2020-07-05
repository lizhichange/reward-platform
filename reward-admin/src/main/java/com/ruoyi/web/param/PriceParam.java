package com.ruoyi.web.param;

import lombok.Data;
import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */
@Data
public class PriceParam extends ToString {
    private String price;
    private String id;
}
