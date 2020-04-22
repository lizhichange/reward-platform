package com.ruoyi.mp.controller;


import com.alibaba.fastjson.JSONObject;
import com.ruoyi.mp.param.NotifyLoginParam;
import com.ruoyi.mp.util.AjaxResult;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import com.ruoyi.reward.facade.enums.OrderStatusType;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.model.Money;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * @author sunflower
 */
@Controller
@RequestMapping("/notify")
@Slf4j
public class AppNotifyController extends BaseController {


    @ResponseBody
    @RequestMapping(value = "/notify", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public AjaxResult notify(@RequestBody JSONObject param) throws Exception {
        log.info("param:{}", param);
        Assert.notNull(param, "param must not be empty");
        NotifyLoginParam parse = JSONObject.parseObject(param.toJSONString(), NotifyLoginParam.class);
        Assert.hasText(parse.getMoney(), "parse.getMoney must not be empty");
        Money money = new Money(parse.getMoney());
        SysOrderDTO orderDTO = new SysOrderDTO();
        orderDTO.setMoney((int) money.getCent());
        List<SysOrderDTO> dtoList = sysOrderClient.selectSysOrderList(orderDTO);
        if (!CollectionUtils.isEmpty(dtoList)) {
            //查询的
            SysOrderDTO newOrder = new SysOrderDTO();
            newOrder.setOrderId(dtoList.get(0).getOrderId());
            newOrder.setPayTime(DateUtils.parseNewFormat(parse.getTime()));
            newOrder.setStatus(Integer.valueOf(OrderStatusType.Y_PAY.getCode()));
            log.info("newOrder:{}", newOrder);
            accountFacadeClient.take(newOrder);
        }
        return AjaxResult.success("success");
    }

    public static void main(String[] args) {
        String str = "{\"money\":\"3.00\",\"encrypt\":\"0\",\"sign\":\"0FED8573B36D070A5F516D5DD475B35B\",\"time\":\"2020-04-20 13:57:56\",\"type\":\"alipay\",\"title\":\"支付宝支付\",\"deviceid\":\"ffffffff-9333-31f6-ffff-ffffef05ac4a\",\"content\":\"成功收款3.00元。享免费提现等更多专属服务，点击查看\"}";
        NotifyLoginParam parse = JSONObject.parseObject(str, NotifyLoginParam.class);
        System.out.println(parse);
    }

}