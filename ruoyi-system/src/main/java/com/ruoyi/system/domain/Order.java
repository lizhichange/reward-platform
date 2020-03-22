package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单对象 order
 *
 * @author ruoyi
 * @date 2020-03-22
 */
public class Order extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * $column.columnComment
     */
    private Long id;

    /**
     * 订单ID
     */
    @Excel(name = "订单ID")
    private String orderId;

    /**
     * 实际金额
     */
    @Excel(name = "实际金额")
    private Integer money;

    /**
     * 原价
     */
    @Excel(name = "原价")
    private Double price;

    /**
     * 支付方式
     */
    @Excel(name = "支付方式")
    private Integer type;

    /**
     * 流水号
     */
    @Excel(name = "流水号")
    private String payNo;

    /**
     * 自定义参数
     */
    @Excel(name = "自定义参数")
    private String param;

    /**
     * 付款时间
     */
    @Excel(name = "付款时间")
    private Long payTime;

    /**
     * 金额的备注
     */
    @Excel(name = "金额的备注")
    private String payTag;

    /**
     * 订单状态
     */
    @Excel(name = "订单状态")
    private Integer status;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Integer getMoney() {
        return money;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getPrice() {
        return price;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public void setPayNo(String payNo) {
        this.payNo = payNo;
    }

    public String getPayNo() {
        return payNo;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public String getParam() {
        return param;
    }

    public void setPayTime(Long payTime) {
        this.payTime = payTime;
    }

    public Long getPayTime() {
        return payTime;
    }

    public void setPayTag(String payTag) {
        this.payTag = payTag;
    }

    public String getPayTag() {
        return payTag;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("orderId", getOrderId())
                .append("money", getMoney())
                .append("price", getPrice())
                .append("type", getType())
                .append("payNo", getPayNo())
                .append("param", getParam())
                .append("payTime", getPayTime())
                .append("payTag", getPayTag())
                .append("status", getStatus())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
