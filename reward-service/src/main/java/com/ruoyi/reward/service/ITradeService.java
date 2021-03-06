package com.ruoyi.reward.service;

import com.ruoyi.reward.domain.Trade;

import java.util.List;

/**
 * 交易信息Service接口
 *
 * @author s
 * @date 2020-06-05
 */
public interface ITradeService {
    /**
     * 查询交易信息
     *
     * @param tradeNo 交易信息ID
     * @return 交易信息
     */
    public Trade selectTradeById(String tradeNo);

    /**
     * 查询交易信息列表
     *
     * @param trade 交易信息
     * @return 交易信息集合
     */
    public List<Trade> selectTradeList(Trade trade);

    /**
     * 新增交易信息
     *
     * @param trade 交易信息
     * @return 结果
     */
    public String insertTrade(Trade trade);

    /**
     * 修改交易信息
     *
     * @param trade 交易信息
     * @return 结果
     */
    public int updateTrade(Trade trade);

    /**
     * 批量删除交易信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTradeByIds(String ids);

    /**
     * 删除交易信息信息
     *
     * @param tradeNo 交易信息ID
     * @return 结果
     */
    public int deleteTradeById(String tradeNo);
}
