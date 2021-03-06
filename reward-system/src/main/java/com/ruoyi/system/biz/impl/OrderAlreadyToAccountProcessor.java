package com.ruoyi.system.biz.impl;

import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.reward.facade.enums.AccountOptType;
import com.ruoyi.reward.facade.enums.AccountType;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import com.ruoyi.reward.facade.request.UserAccountOperatorRequest;
import com.ruoyi.system.biz.TakeAccountAmountManager;
import com.ruoyi.system.biz.processor.AbstractOrderStatusProcessor;
import com.ruoyi.system.client.VideoFacadeClient;
import com.ruoyi.system.domain.AccountDetail;
import com.ruoyi.system.domain.AccountDetailExample;
import com.ruoyi.system.mapper.AccountDetailMapper;
import com.ruoyi.system.service.SysConfigService;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.model.Money;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import static com.ruoyi.reward.facade.enums.AccountBizCode.ORDER_AUTHOR_REBATE;
import static com.ruoyi.reward.facade.enums.AccountBizCode.ORDER_REBATE;

/**
 * 订单已到账处理
 *
 * @author lizhi
 * @date 2018 -7-12
 */
@Component
@Slf4j
public class OrderAlreadyToAccountProcessor extends AbstractOrderStatusProcessor {

    private static final Logger LOGGER = LoggerFactory
            .getLogger(OrderAlreadyToAccountProcessor.class);

    @Autowired
    VideoFacadeClient videoFacadeClient;

    /**
     * The Take account amount manager.
     */
    @Autowired
    TakeAccountAmountManager takeAccountAmountManager;

    /**
     * The User account detail mapper.
     */
    @Autowired
    AccountDetailMapper accountDetailMapper;


    @Override
    protected void confuseTarget(SysOrderDTO target) {

    }

    @Override
    protected void stealTheItem(SysOrderDTO target) {

    }


    /**
     * 用户订单查询审核成功之后,转换业务订单状态已到账
     *
     * @param orderSn
     * @param amount
     * @param userId
     * @param remark
     * @param bizCode
     * @param userAccountType
     * @return
     */
    private long addMoneyToBalance(String orderSn, Long amount, String userId, String remark,
                                   String bizCode, String userAccountType) {

        UserAccountOperatorRequest accOptReq = new UserAccountOperatorRequest();
        accOptReq.setAmount(amount);
        accOptReq.setUserId(userId);
        // 账户资产来源关联业务流水号 订单号
        accOptReq.setSourceCode(orderSn);
        //订单返利
        accOptReq.setRemark(remark);
        accOptReq.setOptType(AccountOptType.INCOME.getCode());
        accOptReq.setBizCode(bizCode);
        accOptReq.setUserAccountType(userAccountType);
        if (xxx(orderSn, userId, bizCode)) {
            return amount;

        }
        takeAccountAmountManager.addBalance(accOptReq);
        return amount;
    }

    private boolean xxx(String orderSn, String userId, String bizCode) {
        //用户余额收入
        AccountDetailExample example = new AccountDetailExample();
        AccountDetailExample.Criteria criteria = example.createCriteria();
        criteria.andAccountIdEqualTo(userId);
        criteria.andBizCodeEqualTo(bizCode);
        criteria.andSourceCodeEqualTo(orderSn);
        criteria.andOptTypeEqualTo(AccountOptType.INCOME.getCode());
        List<AccountDetail> list = accountDetailMapper.selectByExample(example);
        return !CollectionUtils.isEmpty(list);
    }

    @Autowired
    SysConfigService configService;

    @Override
    public Long execute(SysOrderDTO orderInfo) {
        Long rebateAmount = get(orderInfo);
        String extensionUserId = orderInfo.getExtensionUserId();
        if (StringUtil.isNotBlank(extensionUserId)) {
            addMoneyToBalance(orderInfo.getOrderId(), rebateAmount, extensionUserId, "返利", ORDER_REBATE.getCode(),
                    AccountType.PROMOTION_MERCHANT.getCode());
        }
        log.info("execute.orderInfo:{}", orderInfo);
        Integer goodsId = orderInfo.getGoodsId();
        if (goodsId != null) {
            VideoDTO dto = new VideoDTO();
            dto.setId(goodsId);
            List<VideoDTO> dtoList = videoFacadeClient.selectVideoDTOList(dto);
            if (!CollectionUtils.isEmpty(dtoList)) {
                Optional<VideoDTO> first = dtoList.stream().findFirst();
                VideoDTO videoDTO = first.get();
                //佣金配置 百分比10
                Integer snapshot = 10;
                String configByKey = configService.selectConfigByKey("sys.author.rebate");
                if (StringUtil.isNotBlank(configByKey)) {
                    snapshot = Integer.parseInt(configByKey);
                }
                //支付金额
                Integer promotionAmount = orderInfo.getMoney();
                log.info("配置用户百分比:{},订单金额:{}", snapshot, promotionAmount);
                Long amount = (long) ((promotionAmount * snapshot) / 100);
                log.info("预计返利视频作者金额:{}", amount);
                addMoneyToBalance(orderInfo.getOrderId(), amount, videoDTO.getUserId(), "返利", ORDER_AUTHOR_REBATE.getCode(),
                        AccountType.PROMOTION_MERCHANT.getCode());
            }
        }
        return rebateAmount;
    }

    /**
     * The entry point of application.
     *
     * @param args the input arguments
     */
    public static void main(String[] args) {
        Double value = 0.3;
        Integer promotionAmount = 297;
        double v = (value * promotionAmount);
        System.out.println(v);
        Money money = new Money();
        BigDecimal divide = new BigDecimal(v).divide(new BigDecimal(100));
        money.setAmount(divide);
        System.out.println(money.toString());

    }

    /**
     * 已到账
     *
     * @return
     */
    @Override
    public OrderStatusType getType() {
        return OrderStatusType.Y_PAY;
    }

}
