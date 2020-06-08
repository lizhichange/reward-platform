package com.ruoyi.system.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * @author sunflower
 */
@Data
public class ExtSysOrderTimeCount implements Serializable {
    private String time;
    private int count;
}