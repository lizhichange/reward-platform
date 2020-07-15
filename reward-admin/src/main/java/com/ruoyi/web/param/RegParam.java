package com.ruoyi.web.param;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

/**
 * @author sunflower
 */
@Data
public class RegParam extends BaseEntity {


    private static final long serialVersionUID = 4138700137950266581L;
    /**
     * 登录名称
     */
    private String loginName;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 密码
     */
    private String password;
    /**
     * 邀请码
     */
    private String yqm;
    /**
     * 收款人
     */
    private String payee;
    /**
     *
     */
    private String payeeAccount;


}
