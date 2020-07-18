package com.ruoyi.mp.factory;


import com.alibaba.fastjson.JSONObject;
import com.ruoyi.mp.client.SysWebMainFacadeClient;
import com.ruoyi.mp.client.SysWechatConfigClient;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.reward.facade.api.WxMpShortUrlFacade;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import com.ruoyi.reward.facade.dto.SysWechatConfigDTO;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import lombok.Data;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.model.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import javax.annotation.PostConstruct;
import java.util.List;
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

    @Autowired
    SysWebMainFacadeClient sysWebMainFacadeClient;
    @Autowired
    WxMpShortUrlFacade wxMpShortUrlFacade;

//    @Scheduled(cron = "1 1 * * * ?")
    void sync() {
        SysWebMainDTO sysWebMainDTO = new SysWebMainDTO();
        sysWebMainDTO.setMainStatus(WebMainStatus.OK.getCode());
        List<SysWebMainDTO> list = sysWebMainFacadeClient.selectSysWebMainList(sysWebMainDTO);
        if (!CollectionUtils.isEmpty(list)) {
            for (SysWebMainDTO item : list) {
                String check = wxMpShortUrlFacade.check(item.getMainUrl());
                CheckResponse parse = JSONObject.parseObject(check, CheckResponse.class);
                if (parse != null && "01".equals(parse.getCode())) {
                    //{"msg":"已停止访问该网页","code":"01","desc":"据用户投诉及腾讯安全网址安全中心检测，该网页包含不安全内容。为维护绿色上网环境，已停止访问。"}
                    // TODO: 2020/7/18
                    SysWebMainDTO mainDTO = new SysWebMainDTO();
                    mainDTO.setId(item.getId());
                    mainDTO.setMainStatus(WebMainStatus.DISABLE.getCode());
                    sysWebMainFacadeClient.updateSysWebMain(mainDTO);
                }
            }

        }
    }

    @Data
    public static class CheckResponse extends ToString {

        private static final long serialVersionUID = -9112489328957184263L;
        /**
         * msg : 已停止访问该网页
         * code : 01
         * desc : 据用户投诉及腾讯安全网址安全中心检测，该网页包含不安全内容。为维护绿色上网环境，已停止访问。
         */

        private String msg;
        private String code;
        private String desc;

        public String getMsg() {
            return msg;
        }

        public void setMsg(String msg) {
            this.msg = msg;
        }

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }

        public String getDesc() {
            return desc;
        }

        public void setDesc(String desc) {
            this.desc = desc;
        }
    }
}
