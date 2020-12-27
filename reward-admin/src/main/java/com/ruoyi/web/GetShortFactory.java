package com.ruoyi.web;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.model.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

/**
 * @author sunflower
 */
@Component
@Slf4j
public class GetShortFactory {
    @Autowired
    private RestTemplate restTemplate;

    public String getShortUrlForMark(String url) {
        RestTemplate client = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String str = "http://hailunjianzhi.cn/short/generate";
        String key = "d4efdd8311bff5f4456dd8ea14765168";
        //将请求头部和参数合成一个请求
        MyMarkReq params = new MyMarkReq();
        params.setApikey(key);
        params.setUrl(url);
        HttpEntity<String> request = new HttpEntity<>(JSONObject.toJSONString(params), headers);

        //执行HTTP请求，将返回的结构使用ResultVO类格式化
        ResponseEntity<String> response = client.postForEntity(str, request, String.class);
        String body = response.getBody();
        log.info("body:{}", body);
        if (StringUtil.isNotBlank(body)) {
            MyMark myMark = new Gson().fromJson(body, MyMark.class);
            if (myMark != null && myMark.getData() != null) {
                return myMark.getData().toString();
            }
        }
        return "";
    }

    @Data
    static class MyMarkReq extends ToString {
        private String apikey;
        private String url;
    }

    @Data
    static class MyMark extends ToString {

        /**
         * code : 0
         * data : {"group":{"name":"分组1","sid":"w7ho5te8"},"link":{"name":"短链接HOHzsG","origin_url":"https://xiaomark.com/","url":"https://sourl.cn/HOHzsG"},"n_links_today":13}
         * message : 请求成功
         */
        private int code;
        private String msg;
        private Object data;
    }

}