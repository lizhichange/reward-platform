package com.ruoyi;

import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.VideoExample;
import com.ruoyi.reward.mapper.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.Date;
import java.util.List;

/**
 * 启动程序
 *
 * @author ruoyi
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@EnableScheduling
@EnableEurekaClient
@EnableDiscoveryClient
@RefreshScope
public class RuoYiApplication {
    public static void main(String[] args) {
        SpringApplication.run(RuoYiApplication.class, args);
    }

    @Autowired
    VideoMapper videoMapper;

    void testOne() {
        List<Video> list = videoMapper.selectByExample(new VideoExample());
        for (Video shipin : list) {
            for (int i = 0; i < 100; i++) {
                Video newShi = new Video();
                newShi.setMoney(shipin.getMoney());
                newShi.setSj(shipin.getSj());
                newShi.setCs(shipin.getCs());
                newShi.setUrl(shipin.getUrl());
                newShi.setUserId(shipin.getUserId());
                newShi.setName(shipin.getName());
                newShi.setZykey(shipin.getZykey());
                newShi.setDuration(shipin.getDuration());
                newShi.setLx(shipin.getLx());
                newShi.setZt(shipin.getZt());
                newShi.setLogo(shipin.getLogo());
                newShi.setIsLei(shipin.getIsLei());
                newShi.setIsAllow(shipin.getIsAllow());
                newShi.setClick(shipin.getClick());
                newShi.setIsPreview(shipin.getIsPreview());
                newShi.setShortUrl(shipin.getShortUrl());
                newShi.setCategoryId(shipin.getCategoryId());
                newShi.setCreateTime(new Date());
                videoMapper.insertSelective(newShi);
            }
        }

    }
}