package com.ruoyi.web.controller;

import com.ruoyi.reward.facade.dto.ComplaintDTO;
import com.ruoyi.reward.facade.enums.MultiTypeEnum;
import lombok.extern.slf4j.Slf4j;
import org.near.toolkit.common.EnumUtil;
import org.near.toolkit.context.SessionContext;
import org.near.utils.IpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/error")
@Slf4j
public class ErrorController extends BaseController {

    private static final String prefix = "error";
    @Autowired
    ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @GetMapping("/tips")

    public String tips(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        return prefix + "/tips";
    }

    @GetMapping("/audit")
    public String audit(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        return prefix + "/audit";
    }

    @GetMapping("/sub")
    public String success(@RequestParam(value = "userId", required = false) String userId,
                          HttpServletRequest request,
                          ModelMap modelmap) {
        threadPoolTaskExecutor.execute(() -> {
            ComplaintDTO complaintDTO = new ComplaintDTO();
            complaintDTO.setOpenId(SessionContext.getOpenId());
            complaintDTO.setUserId(SessionContext.getUserId());
            complaintDTO.setIp(IpUtils.getIpAddr(request));
            complaintFacadeClient.insertComplaint(complaintDTO);
        });
        return prefix + "/sub";
    }


    @GetMapping("/multi")
    public String multi(@RequestParam(value = "userId", required = false) String userId,
                        @RequestParam(value = "type") String type,
                        ModelMap modelmap) {
        MultiTypeEnum multiTypeEnum = EnumUtil.queryByCode(type, MultiTypeEnum.class);
        List<MultiTypeEnum.ItemContent> list = multiTypeEnum.getList();
        modelmap.addAttribute("list", list);
        return prefix + "/multi";
    }

    @GetMapping("/tswq")
    public String renderComplaint(@RequestParam(value = "userId", required = false) String userId, ModelMap modelmap) {
        return prefix + "/tswq";
    }
}
