package com.ruoyi.mp.scheduled;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.binarywang.wxpay.bean.request.WxPayOrderQueryRequest;
import com.github.binarywang.wxpay.bean.result.WxPayOrderQueryResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.reward.facade.api.IAccountFacade;
import com.ruoyi.reward.facade.api.ISysOrderFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.model.BaseEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * @author sunflower
 */
@Component
@Slf4j
public class WeChatOrderStatusCheckScheduled {


    private static final int ROWS = 100;
    @Autowired
    WxPayService wxPayService;
    @Autowired
    MpAuthConfig mpAuthConfig;
    @Reference(version = "1.0.0", check = false)
    ISysOrderFacade sysOrderFacade;
    @Reference(version = "1.0.0", check = false)
    IAccountFacade accountFacade;

    @Scheduled(cron = "0/60 * * * * ?")
    public void execute() {
        if (!mpAuthConfig.isMockWeChatOrderQuery()) {
            SysOrderDTO item = new SysOrderDTO();
            item.setLimit(ROWS);
            item.setStatus(Integer.valueOf(OrderStatusType.PAY_ING.getCode()));
            List<SysOrderDTO> list = sysOrderFacade.selectSysOrderListExt(item);
            if (!CollectionUtils.isEmpty(list)) {
                for (SysOrderDTO dto : list) {
                    try {
                        syncPayState(dto);
                    } catch (Exception e) {
                        log.error(e.getMessage(), e);
                    }
                }
            }
        }
    }


    private void syncPayState(SysOrderDTO order) throws Exception {
        if (!mpAuthConfig.isMockWeChatOrderSuccess()) {
            SysOrderDTO newOrder = new SysOrderDTO();
            newOrder.setPayTime(new Date());
            newOrder.setOrderId(order.getOrderId());
            newOrder.setStatus(Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
            accountFacade.take(newOrder);
            return;
        }

        WxPayOrderQueryRequest request = new WxPayOrderQueryRequest();
        request.setOutTradeNo(order.getOrderId());
        WxPayOrderQueryResult result = wxPayService.queryOrder(request);
        log.info("result:{}", result);
        if (result != null && "SUCCESS".equals(result.getReturnCode())) {
            if (StringUtil.isNotBlank(result.getTradeState())) {
                TradeState tradeState = EnumUtil.queryByCode(result.getTradeState(), TradeState.class);
                if (tradeState == TradeState.SUCCESS) {
                    SysOrderDTO newOrder = new SysOrderDTO();
                    newOrder.setPayTime(new Date());
                    newOrder.setOrderId(order.getOrderId());
                    //微信支付订单号
                    newOrder.setPayNo(result.getTransactionId());
                    newOrder.setStatus(Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
                    accountFacade.take(newOrder);
                }
            }
        }
    }

    /**
     * SUCCESS—支付成功
     * <p>
     * REFUND—转入退款
     * <p>
     * NOTPAY—未支付
     * <p>
     * CLOSED—已关闭
     * <p>
     * REVOKED—已撤销（付款码支付）
     * <p>
     * USERPAYING--用户支付中（付款码支付）
     * <p>
     * PAYERROR--支付失败(其他原因，如银行返回失败)
     */
    @Getter
    enum TradeState implements BaseEnum {
        /**
         * 用户提现
         */
        SUCCESS("SUCCESS", "支付成功"),
        /**
         * 转入退款
         */

        REFUND("REFUND", "转入退款"),

        /**
         * 未支付
         */

        NOTPAY("NOTPAY", "未支付"),

        /**
         * 已关闭
         */

        CLOSED("CLOSED", "已关闭"),


        REVOKED("REVOKED", "已撤销（付款码支付）"),


        /**
         * 用户支付中（付款码支付）
         */

        USERPAYING("USERPAYING", "用户支付中（付款码支付）"),

        /**
         * 已关闭
         */
        PAYERROR("PAYERROR", "支付失败(其他原因，如银行返回失败)"),

        ;

        String code;
        String desc;

        TradeState(String code, String desc) {
            this.code = code;
            this.desc = desc;
        }
    }
}
