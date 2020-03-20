package com.ruoyi.web.controller.common;

import com.github.pagehelper.PageHelper;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.sms.facade.api.IShipinService;
import com.ruoyi.sms.facade.api.IYqmService;
import com.ruoyi.sms.facade.dto.ShipinDTO;
import com.ruoyi.system.service.ISysOperLogService;
import com.ruoyi.system.service.ISysPostService;
import com.ruoyi.system.service.ISysUserService;
import org.near.toolkit.common.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/pron")
public class PronController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(PronController.class);

    private String prefix = "pron";

    @Autowired
    ISysUserService userService;
    @Autowired

    IShipinService shipinService;
    @Autowired
    IYqmService yqmService;

    @Autowired
    ISysOperLogService operLogService;

    @Autowired
    ISysPostService postService;

    @GetMapping()
    public String index(ModelMap modelmap) {
        ShipinDTO shipinDTO = new ShipinDTO();
        PageHelper.startPage(1, 12, StringUtil.EMPTY_STRING);
        List<ShipinDTO> list = shipinService.selectShipinDTOList(shipinDTO);
        modelmap.addAttribute("list", list);
        return prefix + "/index.html";
    }

    @GetMapping("/pagination")
    public String pagination() {
        return prefix + "/pagination.html";
    }

    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ShipinDTO shipinDTO) {
        startPage();
        List<ShipinDTO> list = shipinService.selectShipinDTOList(shipinDTO);
        return getDataTable(list);
    }


}
