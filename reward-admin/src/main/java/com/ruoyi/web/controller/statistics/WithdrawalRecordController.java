package com.ruoyi.web.controller.statistics;

import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.framework.shiro.service.SysPasswordService;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.reward.domain.Trade;
import com.ruoyi.reward.domain.TradeExample;
import com.ruoyi.reward.facade.api.AccountFacade;
import com.ruoyi.reward.facade.enums.AccountBizCode;
import com.ruoyi.reward.facade.enums.AccountOptType;
import com.ruoyi.reward.facade.enums.PayeeType;
import com.ruoyi.reward.facade.enums.TradeState;
import com.ruoyi.reward.facade.request.UserAccountOperatorRequest;
import com.ruoyi.reward.mapper.TradeMapper;
import com.ruoyi.reward.service.ITradeService;
import com.ruoyi.system.domain.Account;
import com.ruoyi.system.service.IAccountService;
import lombok.extern.slf4j.Slf4j;
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

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import static com.ruoyi.common.utils.DateUtils.YYYY_MM_DD;

/**
 * 打赏记录
 *
 * @author ruoyi
 */
@Controller
@RequestMapping("/statistics/withdrawal")
@Slf4j
public class WithdrawalRecordController extends BaseController {

    private final String prefix = "statistics/withdrawal";
    @Autowired
    ITradeService tradeService;
    @Autowired
    IAccountService accountService;
    @Autowired
    TradeMapper tradeMapper;
    @Autowired
    SysPasswordService passwordService;

    @GetMapping("/applyWithdrawal")
    public String applyWithdrawal(ModelMap modelMap) throws ParseException {
        long balance = getBalance(ShiroUtils.getLoginName());
        Money money = new Money();
        money.setCent(balance);
        //转换元
        String amount = money.toString();
        modelMap.put("balance", amount);
        List<SelectOptionVO> types = Lists.newArrayList();
        for (PayeeType value : PayeeType.values()) {
            SelectOptionVO option = new SelectOptionVO();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            types.add(option);
        }
        modelMap.addAttribute("types", types);


        TradeExample example = getTradeExample();
        List<Trade> tradeList = tradeMapper.selectByExample(example);
        //提现总金额 //单位分
        long sum = 0;
        if (!CollectionUtils.isEmpty(tradeList)) {
            sum = tradeList.stream().mapToLong(Trade::getAmount).sum();
        }
        Money sumMoney = new Money();
        sumMoney.setCent(sum);
        log.info("tradeList:{},sumMoney:{}", tradeList, sumMoney);
        modelMap.addAttribute("money", sumMoney);
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
        for (TradeState value : TradeState.values()) {
            SelectOptionVO option = new SelectOptionVO();
            option.setCode(value.getCode());
            option.setDesc(value.getDesc());
            states.add(option);
        }
        modelMap.addAttribute("states", states);

        return prefix + "/withdrawalRecord";
    }


    private TradeExample getTradeExample() throws ParseException {
        TradeExample example = new TradeExample();
        TradeExample.Criteria criteria = example.createCriteria();
        criteria.andCreateByEqualTo(ShiroUtils.getLoginName());
        Date date = new Date();
        String start = DateUtils.parseDateToStr(YYYY_MM_DD, date) + " 00:00:00";
        String end = DateUtils.parseDateToStr(YYYY_MM_DD, date) + " 23:59:59";
        Date startDate = org.near.toolkit.common.DateUtils.parseNewFormat(start);
        Date endDate = org.near.toolkit.common.DateUtils.parseNewFormat(end);
        criteria.andCreateTimeBetween(startDate, endDate);
        return example;
    }

    /**
     * 查询申请提现
     */
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Trade trade) {
        startPage();
        trade.setCreateBy(ShiroUtils.getLoginName());
        List<Trade> list = tradeService.selectTradeList(trade);
        if (!CollectionUtils.isEmpty(list)) {
            for (Trade item : list) {
                Long amount = item.getAmount();
                Money money = new Money();
                money.setCent(amount);
                item.setAmountStr(money.toString());
            }
        }
        return getDataTable(list);
    }

    @Autowired
    AccountFacade accountFacade;

    @Log(title = "申请提现", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Trade trade,
                              String password) throws ParseException {
        //check  用户提交申请的是元的单位
        Money money = new Money(trade.getAmountStr());
        //账户余额
        long balance = getBalance(ShiroUtils.getLoginName());
        if (balance < money.getCent()) {
            return AjaxResult.error("余额不足");
        }
        trade.setState(TradeState.N_PAY.getCode());
        boolean matches = passwordService.matches(ShiroUtils.getSysUser(), password);
        if (!matches) {
            return AjaxResult.error("用户密码错误");
        }

        //单笔最小提款金额
        if (money.getCent() < 50000) {
            return AjaxResult.error("单笔最小提款金额不足500元");
        }
        //提现单笔最高金额
        if (money.getCent() > 2000000) {
            return AjaxResult.error("提现单笔最高金额不能超过20000元");
        }

        TradeExample example = getTradeExample();
        List<Trade> tradeList = tradeMapper.selectByExample(example);
        log.info("tradeList:{}", tradeList);
        long sum = 0;
        if (!CollectionUtils.isEmpty(tradeList)) {
            //提现总金额 //单位分
            sum = tradeList.stream().mapToLong(Trade::getAmount).sum();
            long l = sum + money.getCent();
            //如果今日大于10万
            if (l > 10000000) {
                return AjaxResult.error("每天可提款总金额已经超过10万元");
            }
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
