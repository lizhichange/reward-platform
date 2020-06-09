package com.ruoyi.reward.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.sequence.ConcurrentSequence;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.reward.domain.Trade;
import com.ruoyi.reward.mapper.TradeMapper;
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
    private TradeMapper tradeMapper;
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
        return tradeMapper.selectTradeById(tradeNo);
    }

    /**
     * 查询交易信息列表
     *
     * @param trade 交易信息
     * @return 交易信息
     */
    @Override
    public List<Trade> selectTradeList(Trade trade) {
        return tradeMapper.selectTradeList(trade);
    }

    /**
     * 新增交易信息
     *
     * @param trade 交易信息
     * @return 结果
     */
    @Override
    public int insertTrade(Trade trade) {
        trade.setTradeNo(concurrentSequence.nextId().toString());
        Date nowDate = DateUtils.getNowDate();
        trade.setCreateTime(nowDate);
        trade.setGmtCreate(nowDate);
        trade.setGmtModified(nowDate);
        return tradeMapper.insertTrade(trade);
    }

    /**
     * 修改交易信息
     *
     * @param trade 交易信息
     * @return 结果
     */
    @Override
    public int updateTrade(Trade trade) {
        return tradeMapper.updateTrade(trade);
    }

    /**
     * 删除交易信息对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTradeByIds(String ids) {
        return tradeMapper.deleteTradeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除交易信息信息
     *
     * @param tradeNo 交易信息ID
     * @return 结果
     */
    @Override
    public int deleteTradeById(String tradeNo) {
        return tradeMapper.deleteTradeById(tradeNo);
    }
}