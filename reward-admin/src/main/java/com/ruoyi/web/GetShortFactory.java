package com.ruoyi.web;

import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.model.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
@Slf4j
public class GetShortFactory {
    @Autowired
    RestTemplate restTemplate;

    public String getShortUrl(String url) {
        String key = "5ef5cc72b1b63c076966a527@e6f2365e4b7f60c44415d6db919097cb";
        String str = "http://suo.im/api.htm?format=json&url=" + url + "&key=" + key + "&expireDate=2020-10-31";
        String shortUrl = restTemplate.getForObject(str, String.class);
        log.info("shortUrl:{}", shortUrl);
        if (StringUtil.isNotBlank(shortUrl)) {
            MyResponse myResponse = new Gson().fromJson(shortUrl, MyResponse.class);
            if (myResponse != null) {
                return myResponse.getUrl();
            }
        }
        return "";
    }

    static class MyResponse extends ToString {

        /**
         * url : http://suo.im/abcdef
         * err :
         */

        private String url;
        private String err;

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }

        public String getErr() {
            return err;
        }

        public void setErr(String err) {
            this.err = err;
        }
    }
}
