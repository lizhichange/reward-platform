package com.ruoyi.web.controller;

import cn.hutool.core.util.RandomUtil;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.reward.facade.dto.VideoRelPriceDTO;
import com.ruoyi.web.client.*;
import com.ruoyi.web.feign.UserDetailFacadeFeign;
import lombok.extern.slf4j.Slf4j;
import org.near.servicesupport.result.TPageResult;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.context.SessionContext;
import org.near.toolkit.model.Money;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;


/**
 * @author sunflower
 */
@Slf4j
public class BaseController {

    public static final Logger LOGGER = LoggerFactory.getLogger(BaseController.class);
    @Autowired
    SysCategoryFacadeClient sysCategoryFacadeClient;
    @Autowired
    ComplaintFacadeClient complaintFacadeClient;
    @Autowired
    UserDetailFacadeFeign userDetailFacadeFeign;
    @Autowired
    UserDetailFacadeClient userDetailFacadeClient;
    @Autowired
    VideoFacadeClient videoFacadeClient;

    @Autowired
    SysConfigFacadeClient sysConfigFacadeClient;
    @Autowired
    VideoRelPriceFacadeClient videoRelPriceFacadeClient;

    public static String renderString(HttpServletResponse response, String string) {
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(string);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean isAjaxRequest(HttpServletRequest request) {
        String ajaxFlag = request.getHeader("X-Requested-With");
        return "XMLHttpRequest".equals(ajaxFlag);
    }

    public void xxx(@RequestParam(value = "userId", required = false) String userId,
                    @RequestParam(value = "categoryId", required = false) String categoryId,
                    @RequestParam(value = "videoId", required = false) String videoId,
                    ModelMap modelmap) {
        log.info("userId:{}", userId);
        VideoDTO videoDTO = new VideoDTO();
        String orderByClause = " create_time desc ";
        TPageResult<VideoDTO> result = videoFacadeClient.queryPage(1, 12, videoDTO, orderByClause);
        List<VideoDTO> list = result.getValues();
        convert(list, SessionContext.getUserId());
        list.sort((o1, o2) -> o2.getCreateTime().compareTo(o1.getCreateTime()));
        modelmap.addAttribute("list", list);
        getCategory(modelmap);
        modelmap.addAttribute("categoryId", categoryId);
        if (StringUtil.isNotBlank(videoId)) {
            try {
                VideoDTO dto = videoFacadeClient.selectVideoDTOById(Long.parseLong(videoId));
                modelmap.addAttribute("video", dto);
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
        }
    }

    private void convert(Date now, VideoDTO dto) {
        Date createTime = dto.getCreateTime();
        if (createTime != null) {
            long diffDays = DateUtils.getDiffDays(now, createTime);
            if (diffDays < 1) {
                dto.setDiffDays("刚刚");
            } else {
                dto.setDiffDays(diffDays + "天前");
            }
        }
        if (StringUtil.isNotBlank(dto.getDuration())) {
            dto.setDurationStr(DateUtils.getTimeString(Integer.parseInt(dto.getDuration())));
        }
    }

    void convert(List<VideoDTO> list, String extensionUserId) {
        if (!CollectionUtils.isEmpty(list)) {
            Date now = new Date();
            for (VideoDTO dto : list) {
                if (StringUtil.isBlank(extensionUserId)) {
                    extensionUserId = "admin";
                }
                VideoRelPriceDTO price = new VideoRelPriceDTO();
                price.setUserId(extensionUserId);
                price.setVideoId(Long.valueOf(dto.getId()));
                List<VideoRelPriceDTO> relPrices = videoRelPriceFacadeClient.selectVideoDTOList(price);
                if (CollectionUtils.isEmpty(relPrices)) {
                    String money = dto.getMoney();
                    String[] split = money.split("-");
                    int start = Integer.parseInt(split[0]);
                    int end = Integer.parseInt(split[1]);
                    //这个单位是元
                    int i = RandomUtil.randomInt(start, end + 1);
                    //实际金额 转换单位分
                    Money m = new Money(i);
                    int amount = Math.toIntExact(m.getCent());
                    log.info("实际支付金额:{}", amount);
                    dto.setMoney("￥" + m.toString() + "元");
                } else {
                    VideoRelPriceDTO relPrice = relPrices.get(0);
                    Money money = new Money();
                    money.setCent(relPrice.getPrice());
                    dto.setMoney("￥" + money.toString() + "元");
                }
                convert(now, dto);
                dto.setMockNum(mock() + "人付款");
            }
        }
    }


    public String mock() {
        String s = RandomUtil.randomNumbers(3);
        if (s.contains("0")) {
            s = s.replaceAll("0", "");
        }
        return s;
    }

    protected void getCategory(ModelMap modelmap) {
        SysCategoryDTO sysCategory = new SysCategoryDTO();
        sysCategory.setParentId(100L);
        sysCategory.setStatus("0");
        List<SysCategoryDTO> categoryList = sysCategoryFacadeClient.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
    }
}
