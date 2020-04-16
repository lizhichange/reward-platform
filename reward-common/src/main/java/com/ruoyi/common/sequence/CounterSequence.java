package com.ruoyi.common.sequence;


import java.util.concurrent.atomic.AtomicLong;

/**
 * 计数器序列
 * @author Willard.Hu on 2017/10/30.
 */
public class CounterSequence implements Sequence<Long> {
    /** 计数器 */
    private AtomicLong counter;
    /** 跨步 */
    private int        step;

    /**
     * 无参构造函数，默认0开始，步长为1
     */
    public CounterSequence() {
        this(0, 1);
    }

    /**
     * 构造函数，指定默认值，步长为1
     * @param start 起始值
     */
    public CounterSequence(long start) {
        this(start, 1);
    }

    /**
     * 构造函数，指定步长，默认0开始
     * @param step 步长
     */
    public CounterSequence(int step) {
        this(0, step);
    }

    /**
     * 构造函数，指定步长和起始值
     * @param start 起始值
     * @param step 步长
     */
    public CounterSequence(long start, int step) {
        counter = new AtomicLong(start);
        this.step = step;
    }

    @Override
    public Long nextId() {
        return counter.addAndGet(step);
    }
}