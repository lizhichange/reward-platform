/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.ruoyi.reward.facade;


import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.collect.Lists;
import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.VideoExample;
import com.ruoyi.reward.facade.api.DemoFacade;
import com.ruoyi.reward.mapper.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;


/**
 * Default {@link DemoFacade}
 *
 * @author <a href="mailto:mercyblitz@gmail.com">Mercy</a>
 * @see DemoFacade
 * @since 1.0.0
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class DefaultDemoFacadeImpl implements DemoFacade {

    @Override
    public String sayHello(String name) {
        return "Hello, " + name + " (from Spring Boot)";
    }

    @Override
    public List<String> abs() {


        return Lists.newArrayList(1).stream().map(Object::toString).collect(Collectors.toList());
    }

    @Autowired
    VideoMapper
            videoMapper;

    @Override
    public void testOne() {
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