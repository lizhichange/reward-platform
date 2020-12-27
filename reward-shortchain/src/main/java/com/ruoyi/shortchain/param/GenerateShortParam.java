package com.ruoyi.shortchain.param;

import lombok.Data;
import org.near.toolkit.model.ToString;

@Data
public class GenerateShortParam extends ToString {

    private String apikey;
    private String url;

    public String getApikey() {
        return apikey;
    }

    public void setApikey(String apikey) {
        this.apikey = apikey;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
