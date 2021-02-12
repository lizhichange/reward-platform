package com.ruoyi.shortchain.service;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.TimedCache;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * <b>TODO . </b>
 *
 * @author yangyl11
 * @version 1.0.0
 * @date 2020/7/16
 * @since JDK 1.8
 */
@Component
public class CheckUrlService {

    public static final String SHORT_URL = "https://api.weixin.qq.com/cgi-bin/shorturl?access_token={}";

    public static final String TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={}&secret={}";

    TimedCache<String, String> cache = CacheUtil.newTimedCache(3600_000);

    @Value("${wx.appid}")
    private String appid;

    @Value("${wx.secret}")
    private String secret;

    @Resource
    private RestTemplate restTemplate;

    @Resource
    private HttpClient httpClient;

    public String check(String url) {

        Map<String, String> res = new HashMap<>(10);
        try {
            String shortUrl = long2short(url);

            HttpContext httpContext = new BasicHttpContext();
            HttpResponse response = httpClient.execute(new HttpGet(shortUrl), httpContext);
            HttpHost targetHost = (HttpHost) httpContext.getAttribute("http.target_host");
            String hostName = targetHost.toString();

            if (StringUtils.startsWithIgnoreCase(url, hostName)) {
                res.put("code", "00");
                res.put("msg", "访问正常");
            } else {
                String html = IoUtil.read(response.getEntity().getContent(), "UTF-8");
                JSONObject json = html(html);
                String title = (String) json.getOrDefault("title", "访问被拦截");
                String desc = (String) json.getOrDefault("desc", "");

                res.put("code", "01");
                res.put("msg", title);
                res.put("desc", desc);
            }

        } catch (Exception e) {

            res.put("code", "99");
            res.put("msg", e.getMessage());
        }
        return JSONUtil.toJsonStr(res);
    }

    private String token(String appid, String secret) {

        String token = cache.get(appid, false);
        if (StringUtils.isBlank(token)) {

            String url = StrUtil.format(TOKEN_URL, appid, secret);
            String object = restTemplate.getForObject(url, String.class);

            JSONObject jsonObject = JSONUtil.parseObj(object);

            String access_token = jsonObject.getStr("access_token");
            if (StringUtils.isNotBlank(access_token)) {
                token = access_token;
                cache.put(appid, token);
            } else {
                String errmsg = jsonObject.getStr("errmsg");
                throw new IllegalArgumentException("获取access_token出错：" + errmsg);
            }
        }

        return token;
    }

    private String long2short(String longUrl) throws Exception {

        String shortUrl = cache.get(longUrl);
        if (StringUtils.isBlank(shortUrl)) {

            String token = token(appid, secret);

            String url = StrUtil.format(SHORT_URL, token);
            Map<String, String> param = new HashMap<>(10);
            param.put("action", "long2short");
            param.put("long_url", longUrl);
            String object = restTemplate.postForObject(url, param, String.class);
            JSONObject jsonObject = JSONUtil.parseObj(object);

            String errcode = jsonObject.getStr("errcode");

            if (StringUtils.equals("0", errcode)) {

                shortUrl = jsonObject.getStr("short_url");
                cache.put(longUrl, shortUrl);
            } else {
                String errmsg = jsonObject.getStr("errmsg");
                throw new IllegalArgumentException("长链接转短链接出错：" + errmsg);
            }
        }
        return shortUrl;

    }

    private JSONObject html(String html) {

        try {
            Document doc = Jsoup.parse(html);
            Elements elements = doc.select("body > script");
            for (Element element : elements) {
                String src = element.attr("src");
                if (StringUtils.isBlank(src)) {

                    String jsdata = element.html();
                    String json = StringUtils.substringAfter(jsdata, "=");
                    JSONObject jsonObject = JSONUtil.parseObj(json);
                    return jsonObject;
                }
            }
        } catch (Exception e) {

        }

        return new JSONObject();
    }
}
