package com.ruoyi.common.sequence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

/**
 * @author sunflower
 */
@Configuration
public class ConcurrentSequenceConfig {
    /**
     * Concurrent sequence concurrent sequence.
     *
     * @param environment the environment
     * @return the concurrent sequence
     */
    @Bean
    public ConcurrentSequence concurrentSequence(Environment environment) {
        Long workId = environment.getProperty("sequence.workerId", Long.class);
        return new ConcurrentSequence(workId);
    }


}