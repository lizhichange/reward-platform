package com.ruoyi.web.controller;

import cn.hutool.core.util.RandomUtil;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.reward.facade.dto.SysCategoryDTO;
import com.ruoyi.reward.facade.dto.SysConfigDTO;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.web.client.*;
import com.ruoyi.web.feign.UserDetailFacadeFeign;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.near.servicesupport.result.TPageResult;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.StringUtil;
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
import java.util.Map;


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
        convert(list);
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

    void convert(List<VideoDTO> list) {
        if (!CollectionUtils.isEmpty(list)) {
            Date now = new Date();
            for (VideoDTO dto : list) {
                SysConfigDTO configDTO = sysConfigFacadeClient.queryConfigByKey("admin");
                if (configDTO != null && StringUtils.isNotBlank(configDTO.getConfigValue())) {
                    String main;
                    Map valueMap = JSONObject.parseObject(configDTO.getConfigValue(), Map.class);
                    if (valueMap.containsKey("main")) {
                        main = valueMap.get("main").toString();
                        Money m = new Money(main);
                        dto.setMoney("￥" + m.toString() + "元");
                    }
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
