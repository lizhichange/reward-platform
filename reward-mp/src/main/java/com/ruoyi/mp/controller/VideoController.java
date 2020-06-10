package com.ruoyi.mp.controller;

import com.ruoyi.mp.client.ShipinFacadeClient;
import com.ruoyi.reward.facade.dto.ShipinDTO;
import org.near.servicesupport.result.TPageResult;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/api")
public class VideoController {
    protected TableDataInfo getDataTable(List<?> list) {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(list);
        return rspData;
    }


    @Autowired
    ShipinFacadeClient shipinFacadeClient;

    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(ShipinDTO shipinDTO, PageForm pageForm) {
        int pageNum = pageForm.getPageNum();
        int pageSize = pageForm.getPageSize();
        String orderByClause = " create_time desc ";

        TPageResult<ShipinDTO> result = shipinFacadeClient.queryPage(pageNum, pageSize, shipinDTO, orderByClause);
        List<ShipinDTO> list = result.getValues();
        convert(list);
        TableDataInfo dataTable = getDataTable(list);
        dataTable.setTotal(result.getTotalRows());
        return dataTable;
    }

    private void convert(List<ShipinDTO> list) {
        if (!CollectionUtils.isEmpty(list)) {
            Date now = new Date();
            for (ShipinDTO dto : list) {
                convert(now, dto);
            }
        }
    }

    private void convert(Date now, ShipinDTO dto) {
        Date createTime = dto.getCreateTime();
        if (createTime != null) {
            long diffDays = DateUtils.getDiffDays(now, createTime);
            if (diffDays < 1) {
                dto.setDiffDays("刚刚");
            } else {
                dto.setDiffDays(diffDays + "天前");
            }
        }
        if (StringUtil.isNotBlank(dto.getShijian())) {
            dto.setShijianStr(DateUtils.getTimeString(Integer.parseInt(dto.getShijian())));
        }
    }
}
