package com.ruoyi.mp.facade;

import cn.hutool.core.io.IoUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.collect.Maps;
import com.ruoyi.mp.client.SysWebMainFacadeClient;
import com.ruoyi.reward.facade.api.WxMpShortUrlFacade;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
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
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author sunflower
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
@Slf4j
public class WxMpShortUrlFacadeImpl implements WxMpShortUrlFacade {
    @Autowired
    WxMpService wxMpService;

    @Override
    public String shortUrl(String longUrl) {
        try {
            return wxMpService.shortUrl(longUrl);
        } catch (WxErrorException e) {
            e.printStackTrace();
            return "";
        }
    }

    @Autowired
    HttpClient httpClient;
    @Autowired
    SysWebMainFacadeClient sysWebMainFacadeClient;

    @Override
    public String checkUrl(String url) {
        Map<String, String> res = Maps.newHashMap();
        try {
            String shortUrl = shortUrl(url);
            log.info("shortUrl:{}", shortUrl);
            HttpContext httpContext = new BasicHttpContext();
            HttpResponse response = httpClient.execute(new HttpGet(shortUrl), httpContext);
            HttpHost targetHost = (HttpHost) httpContext.getAttribute("http.target_host");
            String hostName = targetHost.toString();
            log.info("url:{},hostName:{}", url, hostName);
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

    @Override
    public String checkWebMain(String url) {
        Map<String, String> res = Maps.newHashMap();
        try {
            SysWebMainDTO sysWebMain = new SysWebMainDTO();
            sysWebMain.setMainUrl(url);
            List<SysWebMainDTO> list = sysWebMainFacadeClient.selectSysWebMainList(sysWebMain);
            log.info("check.list:{}", list);
            if (CollectionUtils.isEmpty(list)) {
                return JSONUtil.toJsonStr(res);
            }

            SysWebMainDTO mainDTO = list.get(0);
            String shortUrl;

            if (StringUtils.isBlank(mainDTO.getShortUrl())) {
                log.info("update---------->start");
                shortUrl = shortUrl(url);
                SysWebMainDTO newMain = new SysWebMainDTO();
                // TODO: 2021/2/1 不更新短连接
                newMain.setUpdateTime(new Date());
                newMain.setId(mainDTO.getId());
                sysWebMainFacadeClient.updateSysWebMain(newMain);
            } else {
                log.info("no---------->start");
                shortUrl = mainDTO.getShortUrl();
            }

            log.info("shortUrl:{}", shortUrl);
            HttpContext httpContext = new BasicHttpContext();
            HttpResponse response = httpClient.execute(new HttpGet(shortUrl), httpContext);
            HttpHost targetHost = (HttpHost) httpContext.getAttribute("http.target_host");
            String hostName = targetHost.toString();
            log.info("url:{},hostName:{}", url, hostName);
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
                    return JSONUtil.parseObj(json);
                }
            }
        } catch (Exception e) {
            log.error("解析微信拦截提示信息出错：", e);
        }
        return new JSONObject();
    }

}
