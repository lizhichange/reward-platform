package com.ruoyi.web.controller.statistics;

import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.framework.shiro.service.SysPasswordService;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.reward.domain.Trade;
import com.ruoyi.reward.facade.api.AccountFacade;
import com.ruoyi.reward.facade.enums.AccountBizCode;
import com.ruoyi.reward.facade.enums.AccountOptType;
import com.ruoyi.reward.facade.enums.PayeeTypeEnum;
import com.ruoyi.reward.facade.enums.TradeStateEnum;
import com.ruoyi.reward.facade.request.UserAccountOperatorRequest;
import com.ruoyi.reward.service.ITradeService;
import com.ruoyi.system.domain.Account;
import com.ruoyi.system.service.IAccountService;
import com.ruoyi.system.service.ISysUserService;
import org.near.toolkit.model.Money;
import org.near.toolkit.model.SelectOptionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 打赏记录
 *
 * @author ruoyi
 */
@Controller
@RequestMapping("/statistics/withdrawal")
public class WithdrawalRecordController extends BaseController {

    private final String prefix = "statistics/withdrawal";
    @Autowired
    ITradeService tradeService;
    @Autowired
    IAccountService accountService;
    @Autowired
    ISysUserService userService;

    @Autowired
    private SysPasswordService passwordService;

    @GetMapping("/applyWithdrawal")
    public String applyWithdrawal(ModelMap modelMap) {
        long balance = getBalance(ShiroUtils.getLoginName());
        Money money = new Money();
        money.setCent(balance);
        //转换元
        String amount = money.toString();
        modelMap.put("balance", amount);
        List<SelectOptionVO> types = Lists.newArrayList();
        for (PayeeTypeEnum value : PayeeTypeEnum.values()) {
            SelectOptionVO option = new SelectOptionVO();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            types.add(option);
        }
        modelMap.addAttribute("types", types);

        return prefix + "/applyWithdrawal";
    }

    private long getBalance(String accountId) {
        Account account = new Account();
        account.setAccountId(accountId);
        List<Account> accounts = accountService.selectAccountList(account);
        long balance = 0;
        if (!CollectionUtils.isEmpty(accounts)) {
            balance = accounts.get(0).getBalance();
        }
        return balance;
    }


    @GetMapping("/withdrawalRecord")
    public String withdrawalRecord(ModelMap modelMap) {
        List<SelectOptionVO> states = Lists.newArrayList();
        for (TradeStateEnum value : TradeStateEnum.values()) {
            SelectOptionVO option = new SelectOptionVO();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            states.add(option);
        }
        modelMap.addAttribute("states", states);

        return prefix + "/withdrawalRecord";
    }

    /**
     * 查询申请提现
     */
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Trade trade) {
        logger.info("trade:{}", trade);
        startPage();
        trade.setCreateBy(ShiroUtils.getLoginName());
        List<Trade> list = tradeService.selectTradeList(trade);
        return getDataTable(list);
    }

    @Autowired
    AccountFacade accountFacade;

    @Log(title = "申请提现", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Trade trade, String password) {
        //check  用户提交申请的是元的单位

        Money money = new Money(trade.getAmount());
        //账户余额
        long balance = getBalance(ShiroUtils.getLoginName());
        if (balance < money.getCent()) {
            return AjaxResult.error("余额不足");
        }
        trade.setState(TradeStateEnum.N_PAY.getCode());
        boolean matches = passwordService.matches(ShiroUtils.getSysUser(), password);
        if (!matches) {
            return AjaxResult.error("用户密码错误");
        }
        //转换分
        trade.setAmount(money.getCent());
        trade.setPayer("system");
        trade.setPayerType("system");
        trade.setPayType("system");
        trade.setCreateBy(ShiroUtils.getLoginName());

        String tradeNo = tradeService.insertTrade(trade);

        UserAccountOperatorRequest request = new UserAccountOperatorRequest();
        request.setUserId(ShiroUtils.getLoginName());
        request.setSourceCode(tradeNo);
        //单位分
        request.setAmount(money.getCent());
        //支出
        request.setOptType(AccountOptType.OUTLAY.getCode());
        //用户提现
        request.setBizCode(AccountBizCode.WITHDRAW.getCode());
        accountFacade.minusBalance(request);
        return toAjax(1);
    }


}
