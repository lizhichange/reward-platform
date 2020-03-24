package com.ruoyi.system.domain;

import lombok.Data;
import lombok.ToString;

import java.util.Date;


/**
 * @author wahaha
 */
@Data
@ToString

public class WeChatConfig {
    private Long id;

    private String configCode;


    private String envType;

    private String appId;

    private String appSecret;

    private String mchId;

    private String signKey;

    private String certFile;

    private String token;


    private String encodingAesKey;

    private Date gmtCreate;

    private Date gmtModified;

}
