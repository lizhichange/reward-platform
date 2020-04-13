package com.ruoyi.sms.facade.dto;

import com.ruoyi.sms.facade.enums.OrderPayType;
import com.ruoyi.sms.facade.enums.OrderStatusType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.model.Money;
import org.near.toolkit.model.ToString;

import java.util.Date;

/**
 * 订单列表对象 sys_order
 *
 * @author ruoyi
 * @date 2020-03-26
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SysOrderDTO extends ToString {
    private static final long serialVersionUID = 1L;

    /**
     * null
     */
    private Integer id;

    /**
     * 订单ID
     */
    private String orderId;

    /**
     * 实际金额
     */
    private Integer money;


    private String moneyStr;
    /**
     * 原价
     */
    private Integer price;

    private Date updateTime;

    private String priceStr;

    /**
     * 支付方式
     */
    private Integer type;

    private String typeStr;

    /**
     * 流水号
     */
    private String payNo;

    /**
     * 自定义参数
     */
    private String param;

    /**
     * 付款时间
     */
    private Date payTime;

    /**
     * 金额的备注
     */
    private String payTag;

    /**
     * 订单状态
     */
    private Integer status;


    private String statusStr;
    /**
     * 商品信息
     */
    private Integer goodsId;

    /**
     * 商品快照
     */
    private String goodsSnapshot;

    /**
     * 用户的openId
     */
    private String openId;

    /**
     * 推广人的id
     */
    private String extensionUserId;

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
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

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getPrice() {
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

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getPayTime() {
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

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsSnapshot(String goodsSnapshot) {
        this.goodsSnapshot = goodsSnapshot;
    }

    public String getGoodsSnapshot() {
        return goodsSnapshot;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getOpenId() {
        return openId;
    }

    public void setExtensionUserId(String extensionUserId) {
        this.extensionUserId = extensionUserId;
    }

    public String getExtensionUserId() {
        return extensionUserId;
    }


    public String getMoneyStr() {

        Money m = new Money();
        m.setCent(this.money == null ? 0 : this.money);
        return moneyStr = m.toString();

    }

    public void setMoneyStr(String moneyStr) {
        this.moneyStr = moneyStr;
    }

    public String getTypeStr() {
        if (this.type != null) {
            typeStr = EnumUtil.queryByCode(this.type.toString(), OrderPayType.class).getDesc();
        }
        return typeStr;
    }

    public void setTypeStr(String typeStr) {
        this.typeStr = typeStr;
    }

    public String getStatusStr() {
        if (this.status != null) {
            statusStr = EnumUtil.queryByCode(this.status.toString(), OrderStatusType.class).getDesc();
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    public String getPriceStr() {
        Money m = new Money();
        m.setCent(this.price == null ? 0 : this.price);
        return priceStr = m.toString();
    }

    public void setPriceStr(String priceStr) {
        this.priceStr = priceStr;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }


    private Integer limit;

    private Integer offset;


    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }
}
