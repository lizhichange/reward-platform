package com.ruoyi.common.sequence;

/**
 * 高并发计数器
 *
 * @author Willard.Hu on 2017/10/4.
 */
public class ConcurrentSequence implements Sequence<Long> {
    /**
     * 日期起始点
     */
    private final static long twepoch = 1463108596098L;
    /**
     * 工作机器 ID，占用 10 bit //机器ID 最大值
     */
    private final static long maxWorkerId = Long.valueOf("1111111111", 2);
    /**
     * 序列掩码，占用 12 bit
     */
    private final static long sequenceMask = Long.valueOf("111111111111", 2);
    /**
     * 机器ID占用10bits
     */
    private final static long workerIdBits = 10L;
    /**
     * 序列占用12bits
     */
    private final static long sequenceBits = 12L;
    /**
     * 时间偏移位
     */
    private final static long timestampLeftShift = sequenceBits + workerIdBits;
    /**
     * 机器ID偏移位
     */
    private final static long workerIdShift = sequenceBits;

    private final long workerId;

    private long sequence;
    private long lastTimestamp;

    public ConcurrentSequence(final long workerId) {
        if (workerId > maxWorkerId || workerId < 0) {
            throw new IllegalArgumentException("worker Id can't be greater than " + maxWorkerId + " or less than 0");
        }
        this.workerId = workerId;
    }

    @Override
    public synchronized Long nextId() {
        long timestamp = this.timeGen();
        if (this.lastTimestamp == timestamp) {
            this.sequence = (this.sequence + 1) & sequenceMask;
            if (this.sequence == 0) {
                timestamp = this.tilNextMillis(this.lastTimestamp);
            }
        } else {
            this.sequence = 0;
        }
        if (timestamp < this.lastTimestamp) {
            throw new IllegalStateException("Clock moved backwards.  Refusing to generate id for "
                    + (this.lastTimestamp - timestamp) + " milliseconds");
        }
        this.lastTimestamp = timestamp;
        return ((timestamp - twepoch << timestampLeftShift)) | (this.workerId << workerIdShift) | (this.sequence);
    }

    private long tilNextMillis(final long lastTimestamp) {
        long timestamp = this.timeGen();
        while (timestamp <= lastTimestamp) {
            timestamp = this.timeGen();
        }
        return timestamp;
    }

    private long timeGen() {
        return System.currentTimeMillis();
    }

}