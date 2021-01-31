package com.ruoyi.web;

import lombok.Data;
import org.near.toolkit.model.ToString;

@Data
public class PriceParam extends ToString {
    private String price;
    private String id;

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
