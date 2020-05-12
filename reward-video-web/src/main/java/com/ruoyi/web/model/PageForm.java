package com.ruoyi.web.model;

import lombok.Data;
import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */

public class PageForm extends ToString {

    protected int pageNum = 1;
    protected int pageSize = 20;

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
