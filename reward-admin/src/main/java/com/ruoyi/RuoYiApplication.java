package com.ruoyi;

import com.ruoyi.reward.domain.Shipin;
import com.ruoyi.reward.domain.ShipinExample;
import com.ruoyi.reward.mapper.ShipinMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.scheduling.annotation.EnableScheduling;

import javax.annotation.PostConstruct;
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
public class RuoYiApplication {
    public static void main(String[] args) {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
    }

    @Autowired
    ShipinMapper shipinMapper;

    @PostConstruct
    void testOne() {
        List<Shipin> list = shipinMapper.selectByExample(new ShipinExample());
        for (Shipin shipin : list) {
            for (int i = 0; i < 100; i++) {
                Shipin newShi = new Shipin();
                newShi.setMoney(shipin.getMoney());
                newShi.setSj(shipin.getSj());
                newShi.setCs(shipin.getCs());
                newShi.setUrl(shipin.getUrl());
                newShi.setUserid(shipin.getUserid());
                newShi.setName(shipin.getName());
                newShi.setZykey(shipin.getZykey());
                newShi.setShijian(shipin.getShijian());
                newShi.setLx(shipin.getLx());
                newShi.setZt(shipin.getZt());
                newShi.setLogo(shipin.getLogo());
                newShi.setIsLei(shipin.getIsLei());
                newShi.setIsAllow(shipin.getIsAllow());
                newShi.setClick(shipin.getClick());
                newShi.setIsPreview(shipin.getIsPreview());
                newShi.setShorturl(shipin.getShorturl());
                newShi.setCategoryId(shipin.getCategoryId());
                newShi.setCreateTime(new Date());
                shipinMapper.insertSelective(newShi);
            }
        }

    }
}