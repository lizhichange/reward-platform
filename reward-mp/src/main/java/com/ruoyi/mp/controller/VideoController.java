package com.ruoyi.mp.controller;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.mp.client.SysWebMainFacadeClient;
import com.ruoyi.mp.client.VideoFacadeClient;
import com.ruoyi.reward.facade.api.WxMpShortUrlFacade;
import com.ruoyi.reward.facade.dto.SysWebMainDTO;
import com.ruoyi.reward.facade.dto.VideoDTO;
import com.ruoyi.reward.facade.enums.WebMainStatus;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.near.servicesupport.result.TPageResult;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.StringUtil;
import org.near.toolkit.model.ToString;
import org.near.webmvcsupport.view.PageForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/api")
@Slf4j
public class VideoController {
    protected TableDataInfo getDataTable(List<?> list) {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(list);
        return rspData;
    }

    @Autowired
    WxMpShortUrlFacade wxMpShortUrlFacade;

    @ResponseBody
    @RequestMapping("/check")
    public Object userList(String url) {
        return wxMpShortUrlFacade.check(url);
    }

    @Autowired
    VideoFacadeClient videoFacadeClient;

    @GetMapping("/list")
    @ResponseBody
    public List<VideoDTO> list(VideoDTO videoDTO, PageForm pageForm) {
        int pageNum = pageForm.getPageNum();
        int pageSize = pageForm.getPageSize();
        String orderByClause = " create_time desc ";
        TPageResult<VideoDTO> result = videoFacadeClient.queryPage(pageNum, pageSize, videoDTO, orderByClause);
        List<VideoDTO> list = result.getValues();
        convert(list);
        return list;
    }

    private void convert(List<VideoDTO> list) {
        if (!CollectionUtils.isEmpty(list)) {
            Date now = new Date();
            for (VideoDTO dto : list) {
                convert(now, dto);
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
            dto.setShijianStr(DateUtils.getTimeString(Integer.parseInt(dto.getDuration())));
        }
    }

    @Autowired
    SysWebMainFacadeClient sysWebMainFacadeClient;


    @Scheduled(cron = "1 1 * * * ?")
    void sync() {
        log.info("微信域名检测,sync:{}", DateUtils.formatNewFormat(new Date()));
        SysWebMainDTO sysWebMainDTO = new SysWebMainDTO();
        sysWebMainDTO.setMainStatus(WebMainStatus.OK.getCode());
        List<SysWebMainDTO> list = sysWebMainFacadeClient.selectSysWebMainList(sysWebMainDTO);
        if (!CollectionUtils.isEmpty(list)) {
            for (SysWebMainDTO item : list) {
                String check = wxMpShortUrlFacade.check(item.getMainUrl());
                CheckResponse parse = JSONObject.parseObject(check, CheckResponse.class);
                if (parse != null && "01".equals(parse.getCode())) {
                    SysWebMainDTO mainDTO = new SysWebMainDTO();
                    mainDTO.setId(item.getId());
                    mainDTO.setMainStatus(WebMainStatus.DISABLE.getCode());
                    sysWebMainFacadeClient.updateSysWebMain(mainDTO);
                }
            }
        }
    }

    @Data
    public static class CheckResponse extends ToString {

        private static final long serialVersionUID = -9112489328957184263L;
        /**
         * msg : 已停止访问该网页
         * code : 01
         * desc : 据用户投诉及腾讯安全网址安全中心检测，该网页包含不安全内容。为维护绿色上网环境，已停止访问。
         */

        private String msg;
        private String code;
        private String desc;

        public String getMsg() {
            return msg;
        }

        public void setMsg(String msg) {
            this.msg = msg;
        }

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }

        public String getDesc() {
            return desc;
        }

        public void setDesc(String desc) {
            this.desc = desc;
        }
    }
}
