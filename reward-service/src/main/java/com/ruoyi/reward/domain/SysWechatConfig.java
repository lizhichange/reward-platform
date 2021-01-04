package com.ruoyi.reward.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 公众号配置信息对象 sys_wechat_config
 *
 * @author ruoyi
 * @date 2020-03-24
 */
public class SysWechatConfig extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 微信配置标识
     */
    @Excel(name = "微信配置标识")
    private String configCode;

    /**
     * 环境类型
     */
    @Excel(name = "环境类型")
    private String envType;

    /**
     * 微信appid
     */
    @Excel(name = "微信appid")
    private String appId;

    /**
     * 微信 appsecret
     */
    @Excel(name = "微信 appsecret")
    private String appsecret;

    /**
     * 商户id
     */
    @Excel(name = "商户id")
    private String mchId;

    /**
     * 签名key
     */
    @Excel(name = "签名key")
    private String signKey;

    /**
     * 证书地址
     */
    @Excel(name = "证书地址")
    private String certFile;

    /**
     * token令牌
     */
    @Excel(name = "token令牌")
    private String token;

    /**
     * 消息加解密密钥
     */
    @Excel(name = "消息加解密密钥")
    private String encodingAesKey;

    /**
     * 创建日期
     */
    @Excel(name = "创建日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gmtCreate;

    /**
     * 更新日期
     */
    @Excel(name = "更新日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gmtModified;
    private String state;


    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setConfigCode(String configCode) {
        this.configCode = configCode;
    }

    public String getConfigCode() {
        return configCode;
    }

    public void setEnvType(String envType) {
        this.envType = envType;
    }

    public String getEnvType() {
        return envType;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppsecret(String appsecret) {
        this.appsecret = appsecret;
    }

    public String getAppsecret() {
        return appsecret;
    }

    public void setMchId(String mchId) {
        this.mchId = mchId;
    }

    public String getMchId() {
        return mchId;
    }

    public void setSignKey(String signKey) {
        this.signKey = signKey;
    }

    public String getSignKey() {
        return signKey;
    }

    public void setCertFile(String certFile) {
        this.certFile = certFile;
    }

    public String getCertFile() {
        return certFile;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }

    public void setEncodingAesKey(String encodingAesKey) {
        this.encodingAesKey = encodingAesKey;
    }

    public String getEncodingAesKey() {
        return encodingAesKey;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public Date getGmtModified() {
        return gmtModified;
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
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
