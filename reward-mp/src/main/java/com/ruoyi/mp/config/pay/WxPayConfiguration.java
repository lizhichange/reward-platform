package com.ruoyi.mp.config.pay;

import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.service.WxPayService;
import com.github.binarywang.wxpay.service.impl.WxPayServiceImpl;
import com.ruoyi.mp.factory.ConfigFactory;
import com.ruoyi.reward.facade.dto.SysWechatConfigDTO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Scheduled;

/**
 * @author Binary Wang
 */
@Configuration
@AllArgsConstructor
@Slf4j
public class WxPayConfiguration {


    @Autowired
    ConfigFactory configFactory;

    @Bean
    @Scheduled(cron = "0 0/30 * * * ?")
    public WxPayService wxPayService() {
        log.info("wxPayService..Scheduled..init");
        WxPayService wxPayService = new WxPayServiceImpl();
        try {
            WxPayProperties properties = new WxPayProperties();
            SysWechatConfigDTO weChatConfig = configFactory.getConfigDTOList().get(0);
            properties.setAppId(weChatConfig.getAppId());
            properties.setMchId(weChatConfig.getMchId());
            properties.setKeyPath(weChatConfig.getCertFile());
            properties.setMchKey(weChatConfig.getSignKey());
            WxPayConfig payConfig = new WxPayConfig();
            payConfig.setAppId(StringUtils.trimToNull(properties.getAppId()));
            payConfig.setMchId(StringUtils.trimToNull(properties.getMchId()));
            payConfig.setKeyPath(StringUtils.trimToNull(properties.getKeyPath()));
            payConfig.setMchKey(StringUtils.trimToNull(properties.getMchKey()));
            // 可以指定是否使用沙箱环境
            payConfig.setUseSandboxEnv(false);
            wxPayService.setConfig(payConfig);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }

        return wxPayService;
    }

}
