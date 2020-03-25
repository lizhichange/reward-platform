package com.ruoyi.sms.facade.dto;


import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.near.toolkit.model.ToString;

/**
 * 域名管理对象 sys_web_main
 *
 * @author ruoyi
 * @date 2020-03-23
 */
@Data
public class SysWebMainDTO extends ToString {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 链接地址
     */

    private String mainUrl;

    /**
     * 状态
     */

    private String mainStatus;


}
