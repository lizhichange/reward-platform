package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

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
    private String userId;

    private List<String> userIdList;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public List<String> getUserIdList() {
        return userIdList;
    }

    public void setUserIdList(List<String> userIdList) {
        this.userIdList = userIdList;
    }

    public String getYqm() {
        return yqm;
    }

    public void setYqm(String yqm) {
        this.yqm = yqm;
    }

    public String getShijian() {
        return shijian;
    }

    public void setShijian(String shijian) {
        this.shijian = shijian;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getZt() {
        return zt;
    }

    public void setZt(String zt) {
        this.zt = zt;
    }

    public String getZtDesc() {
        return ztDesc;
    }

    public void setZtDesc(String ztDesc) {
        this.ztDesc = ztDesc;
    }
}
