package com.ruoyi.system.rest;


import com.ruoyi.reward.facade.api.IAccountFacade;
import com.ruoyi.reward.facade.dto.SysOrderDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2020-04-06
 */
@RequestMapping("/rest/account")
@RestController

@Slf4j
public class AccountFacadeController {
    @Autowired
    IAccountFacade accountFacade;

    @PostMapping("/take")
    public String take(@RequestBody SysOrderDTO dto) {
        try {
            accountFacade.take(dto);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }
}