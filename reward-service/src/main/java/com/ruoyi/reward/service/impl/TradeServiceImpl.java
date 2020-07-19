package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.sequence.ConcurrentSequence;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.reward.domain.Trade;
import com.ruoyi.reward.mapper.ExtTradeMapper;
import com.ruoyi.reward.service.ITradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 交易信息Service业务层处理
 *
 * @author s
 * @date 2020-06-05
 */
@Service
public class TradeServiceImpl implements ITradeService {
    @Autowired
    private ExtTradeMapper extTradeMapper;
    @Autowired
    ConcurrentSequence concurrentSequence;

    /**
     * 查询交易信息
     *
     * @param tradeNo 交易信息ID
     * @return 交易信息
     */
    @Override
    public Trade selectTradeById(String tradeNo) {
        return extTradeMapper.selectTradeById(tradeNo);
    }

    /**
     * 查询交易信息列表
     *
     * @param trade 交易信息
     * @return 交易信息
     */
    @Override
    public List<Trade> selectTradeList(Trade trade) {
        return extTradeMapper.selectTradeList(trade);
    }

    /**
     * 新增交易信息
     *
     * @param trade 交易信息
     * @return 结果
     */
    @Override
    public String insertTrade(Trade trade) {
        String tradeNo = concurrentSequence.nextId().toString();
        trade.setTradeNo(tradeNo);
        Date nowDate = DateUtils.getNowDate();
        trade.setCreateTime(nowDate);
        trade.setGmtCreate(nowDate);
        trade.setGmtModified(nowDate);
        extTradeMapper.insertTrade(trade);
        return tradeNo;
    }

    /**
     * 修改交易信息
     *
     * @param trade 交易信息
     * @return 结果
     */
    @Override
    public int updateTrade(Trade trade) {
        return extTradeMapper.updateTrade(trade);
    }

    /**
     * 删除交易信息对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTradeByIds(String ids) {
        return extTradeMapper.deleteTradeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除交易信息信息
     *
     * @param tradeNo 交易信息ID
     * @return 结果
     */
    @Override
    public int deleteTradeById(String tradeNo) {
        return extTradeMapper.deleteTradeById(tradeNo);
    }
}
