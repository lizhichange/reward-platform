package com.ruoyi.mp.config;

import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.data.Stat;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.ArrayList;

@Component
@Slf4j
public class CuratorClientUtils {

    public static final String ROOT_LOCKS = "/PUNCH/CORE/LOCKS";

    public static final String PUNCH_TOKEN_LOCKS = "/PUNCH/TOKEN/LOCKS";
    private CuratorFramework curatorFramework;

    @Value("${dubbo.registry.address}")
    private String registryAddress;

    public CuratorFramework getCuratorFramework() {
        return curatorFramework;
    }

    @PostConstruct
    void init() {
        if (curatorFramework == null) {
            curatorFramework = CuratorFrameworkFactory.newClient(registryAddress,
                    5000, 5000, new ExponentialBackoffRetry(1000, 5));
            curatorFramework.start();
            try {
                ArrayList<String> list = Lists.newArrayList(ROOT_LOCKS, PUNCH_TOKEN_LOCKS);
                for (String item : list) {
                    Stat stat = curatorFramework.checkExists().forPath(item);
                    if (stat == null) {
                        /**
                         * 新增,递归创建,CreateMode.PERSISTENT 创建持久化节点（默认），
                         */
                        String path = curatorFramework.create().creatingParentsIfNeeded()
                                .withMode(CreateMode.PERSISTENT).forPath(item, "123".getBytes());
                        if (StringUtil.isNotBlank(path)) {
                            log.info("path:{}", path);
                        }
                    }
                }
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
        }
    }

    public String getRegistryAddress() {
        return registryAddress;
    }

    public void setRegistryAddress(String registryAddress) {
        this.registryAddress = registryAddress;
    }
}
