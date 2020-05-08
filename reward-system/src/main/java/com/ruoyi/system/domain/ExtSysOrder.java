package com.ruoyi.system.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class ExtSysOrder implements Serializable {
    /**
     * sys_order.id
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private Integer id;

    /**
     * sys_order.order_id
     * 订单ID
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private String orderId;

    /**
     * sys_order.money
     * 实际金额，单位分
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private Integer money;

    /**
     * sys_order.price
     * 原价，单位分
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private Integer price;

    /**
     * sys_order.type
     * 支付方式
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private Integer type;

    /**
     * sys_order.pay_no
     * 流水号
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private String payNo;

    /**
     * sys_order.param
     * 自定义参数
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private String param;

    /**
     * sys_order.pay_time
     * 付款时间
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private Date payTime;

    /**
     * sys_order.pay_tag
     * 金额的备注
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private String payTag;

    /**
     * sys_order.status
     * 订单状态
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private Integer status;

    /**
     * sys_order.create_time
     * 创建时间
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private Date createTime;

    /**
     * sys_order.update_time
     * 更新时间
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private Date updateTime;

    /**
     * sys_order.goods_id
     * 商品信息
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private Integer goodsId;

    /**
     * sys_order.open_id
     * 用户的openId
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private String openId;

    /**
     * sys_order.extension_user_id
     * 推广人的id
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private String extensionUserId;

    /**
     * sys_order.user_id
     * 用户id
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private String userId;

    /**
     * sys_order.goods_snapshot
     * 商品快照
     *
     * @mbg.generated 2020-05-08 17:59:03
     */
    private String goodsSnapshot;

    private static final long serialVersionUID = 1L;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", orderId=").append(orderId);
        sb.append(", money=").append(money);
        sb.append(", price=").append(price);
        sb.append(", type=").append(type);
        sb.append(", payNo=").append(payNo);
        sb.append(", param=").append(param);
        sb.append(", payTime=").append(payTime);
        sb.append(", payTag=").append(payTag);
        sb.append(", status=").append(status);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", goodsId=").append(goodsId);
        sb.append(", openId=").append(openId);
        sb.append(", extensionUserId=").append(extensionUserId);
        sb.append(", userId=").append(userId);
        sb.append(", goodsSnapshot=").append(goodsSnapshot);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}