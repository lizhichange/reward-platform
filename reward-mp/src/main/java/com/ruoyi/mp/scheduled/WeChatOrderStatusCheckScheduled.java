package com.ruoyi.mp.scheduled;

import com.alibaba.fastjson.JSONObject;
import com.github.binarywang.wxpay.bean.request.WxPayOrderQueryRequest;
import com.github.binarywang.wxpay.bean.result.WxPayOrderQueryResult;
import com.github.binarywang.wxpay.service.WxPayService;
import com.ruoyi.mp.client.AccountFacadeClient;
import com.ruoyi.mp.client.SysOrderFacadeClient;
import com.ruoyi.mp.client.SysWebMainFacadeClient;
import com.ruoyi.mp.config.MpAuthConfig;
import com.ruoyi.reward.facade.api.WxMpShortUrlFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import lombok.Data;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.model.BaseEnum;
import org.near.toolkit.model.ToString;
import org.springframework.beans.factory.annotation.Autowired;
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
    final
    WxPayService wxPayService;
    final
    MpAuthConfig mpAuthConfig;


    final
    AccountFacadeClient accountFacadeClient;
    final
    SysOrderFacadeClient sysOrderFacadeClient;

    public WeChatOrderStatusCheckScheduled(WxPayService wxPayService, MpAuthConfig mpAuthConfig, AccountFacadeClient accountFacadeClient, SysOrderFacadeClient sysOrderFacadeClient) {
        this.wxPayService = wxPayService;
        this.mpAuthConfig = mpAuthConfig;
        this.accountFacadeClient = accountFacadeClient;
        this.sysOrderFacadeClient = sysOrderFacadeClient;
    }

//    @Scheduled(cron = "0 0/3 * * * ?")
    public void execute() {
        if (!mpAuthConfig.isMockWeChatOrderQuery()) {
            SysOrderDTO item = new SysOrderDTO();
            item.setLimit(ROWS);
            item.setStatus(Integer.valueOf(OrderStatusType.PAY_ING.getCode()));
            List<SysOrderDTO> list = sysOrderFacadeClient.selectSysOrderListExt(item);
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
            accountFacadeClient.take(newOrder);
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
                    accountFacadeClient.take(newOrder);
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

    @Autowired
    SysWebMainFacadeClient sysWebMainFacadeClient;
    @Autowired
    WxMpShortUrlFacade wxMpShortUrlFacade;

    //    @Scheduled(cron = "0 0/3 * * * ?")
    public void sync() {
        log.info("微信域名检测,sync:{}", DateUtils.formatNewFormat(new Date()));
        SysWebMainDTO sysWebMainDTO = new SysWebMainDTO();
        sysWebMainDTO.setMainStatus(WebMainStatus.OK.getCode());
        List<SysWebMainDTO> list = sysWebMainFacadeClient.selectSysWebMainList(sysWebMainDTO);
        if (!CollectionUtils.isEmpty(list)) {
            for (SysWebMainDTO item : list) {
                String check = wxMpShortUrlFacade.checkWebMain(item.getMainUrl());
                CheckResponse parse = JSONObject.parseObject(check, CheckResponse.class);
                if (parse != null && "01".equals(parse.getCode())) {
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
