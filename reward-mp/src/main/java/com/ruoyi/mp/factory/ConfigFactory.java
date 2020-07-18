package com.ruoyi.mp.factory;


import cn.hutool.core.io.IoUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.google.common.collect.Maps;
import com.ruoyi.mp.client.SysWechatConfigClient;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.reward.facade.api.WxMpShortUrlFacade;
import com.ruoyi.reward.facade.dto.SysWechatConfigDTO;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author wahaha
 */
@Component
@Slf4j
public class ConfigFactory {


    @Autowired
    ConfigurableEnvironment env;

    @Getter
    List<SysWechatConfigDTO> configDTOList;
    @Autowired
    SysWechatConfigClient sysWechatConfigClient;

    @Autowired
    MpAuthConfig mpAuthConfig;


    @PostConstruct
    @Scheduled(cron = "0 0/50 * * * ?")
    void init() {
        try {
            String profile = env.getActiveProfiles()[0];
            SysWechatConfigDTO item = new SysWechatConfigDTO();
            item.setEnvType(profile);
            item.setState("0");
            String configCode = mpAuthConfig.getConfigCode();
            List<SysWechatConfigDTO> list = sysWechatConfigClient.selectSysWechatConfigList(item);
            if (!CollectionUtils.isEmpty(list)) {
                configDTOList = list.stream().filter(it -> it.getConfigCode().equals(configCode)).collect(Collectors.toList());
            }
            log.info("configDTOList:{}", configDTOList);
        } catch (Exception e) {
            log.info(e.getMessage(), e);
        }
    }

    @Resource
    HttpClient httpClient;
    @Autowired
    WxMpShortUrlFacade wxMpShortUrlFacade;


    public String check(String url) {
        Map<String, String> res = Maps.newHashMap();
        try {
            String shortUrl = wxMpShortUrlFacade.shortUrl(url);
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
            log.error(e.getMessage(), e);
            res.put("code", "99");
            res.put("msg", e.getMessage());
        }
        return JSONUtil.toJsonStr(res);
    }

    private JSONObject html(String html) {
        try {
            Document doc = Jsoup.parse(html);
            Elements elements = doc.select("body > script");
            for (Element element : elements) {
                String src = element.attr("src");
                if (StringUtils.isBlank(src)) {
                    String jsData = element.html();
                    String json = StringUtils.substringAfter(jsData, "=");
                    JSONObject jsonObject = JSONUtil.parseObj(json);
                    return jsonObject;
                }
            }
        } catch (Exception e) {
            log.error("解析微信拦截提示信息出错：", e);
        }
        return new JSONObject();
    }

}
