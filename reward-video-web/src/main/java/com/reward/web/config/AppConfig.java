package com.reward.web.config;

import lombok.Data;
import org.near.toolkit.model.ToString;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author sunflower
 */
@Component
@Data
public class AppConfig extends ToString {
    /**
     *
     */
    @Value("${app.wxPayUrl}")
    private String wxPayUrl;

}
