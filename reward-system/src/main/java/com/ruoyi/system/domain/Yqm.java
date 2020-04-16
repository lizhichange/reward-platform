package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.List;

/**
 * 邀请码管理对象 yqm
 *
 * @author ruoyi
 * @date 2020-03-26
 */
public class Yqm extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 代理id
     */
    @Excel(name = "代理id")
    private String userid;

    private List<String> useridList;

    /**
     * 邀请码
     */
    @Excel(name = "邀请码")
    private String yqm;

    /**
     * 时间
     */
    @Excel(name = "时间")
    private String shijian;

    /**
     * 使用者
     */
    @Excel(name = "使用者")
    private String name;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private String zt;

    private String ztDesc;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUserid() {
        return userid;
    }

    public void setYqm(String yqm) {
        this.yqm = yqm;
    }

    public String getYqm() {
        return yqm;
    }

    public void setShijian(String shijian) {
        this.shijian = shijian;
    }

    public String getShijian() {
        return shijian;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setZt(String zt) {
        this.zt = zt;
    }

    public String getZt() {
        return zt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userid", getUserid())
                .append("yqm", getYqm())
                .append("shijian", getShijian())
                .append("name", getName())
                .append("zt", getZt())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }

    public String getZtDesc() {
        return ztDesc;
    }

    public void setZtDesc(String ztDesc) {
        this.ztDesc = ztDesc;
    }

    public List<String> getUseridList() {
        return useridList;
    }

    public void setUseridList(List<String> useridList) {
        this.useridList = useridList;
    }
}
