package com.ruoyi.web.param;

import lombok.Data;
import org.near.toolkit.model.ToString;

@Data
public class BatchPriceParam extends ToString {
    private String price;
    private String id;
}
