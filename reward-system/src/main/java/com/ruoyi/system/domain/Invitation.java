package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.List;

/**
 * 邀请码管理对象 invitation
 *
 * @author ruoyi
 * @date 2020-03-26
 */
@Data
public class Invitation extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;

    /**
     * 代理id
     */
    @Excel(name = "代理id")
    private String userId;

    private List<String> userIdList;

    /**
     * 邀请码
     */
    @Excel(name = "邀请码")
    private String invitation;

    /**
     * 时间
     */
    @Excel(name = "时间")
    private String duration;

    /**
     * 使用者
     */
    @Excel(name = "使用者")
    private String name;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private String status;

    private String ztDesc;

}
