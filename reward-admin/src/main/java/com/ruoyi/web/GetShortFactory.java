package com.ruoyi.web;

import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.model.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

/**
 * @author sunflower
 */
@Component
@Slf4j
public class GetShortFactory {
    @Autowired
    RestTemplate restTemplate;

    public String getShortUrl(String url) {
        String key = "5ef5cc72b1b63c076966a527@e6f2365e4b7f60c44415d6db919097cb";
        String str = "http://suo.im/api.htm?format=json&url=" + url + "&key=" + key + "&expireDate=2020-12-31";
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

    public String getShortUrlForMark(String url) {
        RestTemplate client = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String str = "https://api.xiaomark.com/v1/link/create";
        String key = "d4efdd8311bff5f4456dd8ea14765168";
        HttpMethod method = HttpMethod.POST;
        //将请求头部和参数合成一个请求
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("apikey", key);
        params.add("origin_url", url);
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);
        //执行HTTP请求，将返回的结构使用ResultVO类格式化
        ResponseEntity<String> response = client.exchange(str, method, requestEntity, String.class);
        String body = response.getBody();
        log.info("body:{}", body);
        if (StringUtil.isNotBlank(body)) {
            MyMark myMark = new Gson().fromJson(body, MyMark.class);
            if (myMark != null && myMark.getData() != null && myMark.getData().getLink() != null) {
                return myMark.getData().getLink().getUrl();
            }
        }
        return "";
    }

    static class MyMark extends ToString {

        /**
         * code : 0
         * data : {"group":{"name":"分组1","sid":"w7ho5te8"},"link":{"name":"短链接HOHzsG","origin_url":"https://xiaomark.com/","url":"https://sourl.cn/HOHzsG"},"n_links_today":13}
         * message : 请求成功
         */

        private int code;
        private DataBean data;
        private String message;

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }

        public DataBean getData() {
            return data;
        }

        public void setData(DataBean data) {
            this.data = data;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public static class DataBean {
            /**
             * group : {"name":"分组1","sid":"w7ho5te8"}
             * link : {"name":"短链接HOHzsG","origin_url":"https://xiaomark.com/","url":"https://sourl.cn/HOHzsG"}
             * n_links_today : 13
             */

            private GroupBean group;
            private LinkBean link;
            private int n_links_today;

            public GroupBean getGroup() {
                return group;
            }

            public void setGroup(GroupBean group) {
                this.group = group;
            }

            public LinkBean getLink() {
                return link;
            }

            public void setLink(LinkBean link) {
                this.link = link;
            }

            public int getN_links_today() {
                return n_links_today;
            }

            public void setN_links_today(int n_links_today) {
                this.n_links_today = n_links_today;
            }

            public static class GroupBean {
                /**
                 * name : 分组1
                 * sid : w7ho5te8
                 */

                private String name;
                private String sid;

                public String getName() {
                    return name;
                }

                public void setName(String name) {
                    this.name = name;
                }

                public String getSid() {
                    return sid;
                }

                public void setSid(String sid) {
                    this.sid = sid;
                }
            }

            public static class LinkBean {
                /**
                 * name : 短链接HOHzsG
                 * origin_url : https://xiaomark.com/
                 * url : https://sourl.cn/HOHzsG
                 */

                private String name;
                private String origin_url;
                private String url;

                public String getName() {
                    return name;
                }

                public void setName(String name) {
                    this.name = name;
                }

                public String getOrigin_url() {
                    return origin_url;
                }

                public void setOrigin_url(String origin_url) {
                    this.origin_url = origin_url;
                }

                public String getUrl() {
                    return url;
                }

                public void setUrl(String url) {
                    this.url = url;
                }
            }
        }
    }

    static class MyResponse extends ToString {

        private static final long serialVersionUID = 3882315401921271659L;
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
