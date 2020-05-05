package com.ruoyi.web.model;

import lombok.Data;
import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */
@Data
public class PageForm extends ToString {

    protected int pageNum = 1;
    protected int pageSize = 20;
}
