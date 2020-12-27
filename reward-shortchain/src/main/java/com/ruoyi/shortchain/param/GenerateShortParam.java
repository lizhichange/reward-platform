package com.ruoyi.shortchain.param;

import lombok.Data;

@Data
public class GenerateShortParam {

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
