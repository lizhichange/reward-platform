package com.ruoyi.reward.facade.dto;


import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.util.Date;

/**
 * 公众号配置信息对象 sys_wechat_config
 *
 * @author ruoyi
 * @date 2020-03-24
 */
@Data
public class SysWechatConfigDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 微信配置标识
     */
    private String configCode;

    /**
     * 环境类型
     */
    private String envType;

    /**
     * 微信appid
     */
    private String appId;

    /**
     * 微信 appsecret
     */
    private String appsecret;

    /**
     * 商户id
     */
    private String mchId;

    /**
     * 签名key
     */
    private String signKey;

    /**
     * 证书地址
     */
    private String certFile;

    /**
     * token令牌
     */
    private String token;

    /**
     * 消息加解密密钥
     */
    private String encodingAesKey;

    /**
     * 创建日期
     */
    private Date gmtCreate;

    /**
     * 更新日期
     */
    private Date gmtModified;
    private String state;

    public void setId(Long id) {
        this.id = id;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("configCode", getConfigCode())
                .append("envType", getEnvType())
                .append("appId", getAppId())
                .append("appsecret", getAppsecret())
                .append("mchId", getMchId())
                .append("signKey", getSignKey())
                .append("certFile", getCertFile())
                .append("token", getToken())
                .append("encodingAesKey", getEncodingAesKey())
                .append("gmtCreate", getGmtCreate())
                .append("gmtModified", getGmtModified())
                .toString();
    }
}
