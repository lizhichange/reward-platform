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
        for (Video video : list) {
            for (int i = 0; i < 100; i++) {
                Video newShi = new Video();
                newShi.setMoney(video.getMoney());
                newShi.setSj(video.getSj());
                newShi.setCs(video.getCs());
                newShi.setUrl(video.getUrl());
                newShi.setUserId(video.getUserId());
                newShi.setName(video.getName());
                newShi.setVideoUrl(video.getVideoUrl());
                newShi.setDuration(video.getDuration());
                newShi.setLx(video.getLx());
                newShi.setStatus(video.getStatus());
                newShi.setLogo(video.getLogo());
                newShi.setIsLei(video.getIsLei());
                newShi.setIsAllow(video.getIsAllow());
                newShi.setClick(video.getClick());
                newShi.setIsPreview(video.getIsPreview());
                newShi.setShortUrl(video.getShortUrl());
                newShi.setCategoryId(video.getCategoryId());
                newShi.setCreateTime(new Date());
                videoMapper.insertSelective(newShi);
            }
        }

    }
}