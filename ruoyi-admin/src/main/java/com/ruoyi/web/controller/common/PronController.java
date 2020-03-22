package com.ruoyi.web.controller.common;

import com.github.pagehelper.PageHelper;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.sms.facade.api.IShipinService;
import com.ruoyi.sms.facade.api.IYqmService;
import com.ruoyi.sms.facade.dto.ShipinDTO;
import com.ruoyi.system.domain.SysCategory;
import com.ruoyi.system.service.ISysCategoryService;
import com.ruoyi.system.service.ISysPostService;
import lombok.Data;
import lombok.extern.java.Log;
import org.near.toolkit.common.DateUtils;
import org.near.toolkit.common.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @author sunflower
 */
@Controller
@RequestMapping("/pron")
@Log
public class PronController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(PronController.class);

    private String prefix = "pron";


    @Autowired
    IShipinService shipinService;

    @Autowired
    IYqmService yqmService;
    @Autowired
    ISysCategoryService categoryService;


    @Autowired
    ISysPostService postService;

    @Autowired
    ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @GetMapping()
    public String index(ModelMap modelmap) {
        ShipinDTO shipinDTO = new ShipinDTO();
        PageHelper.startPage(1, 12, StringUtil.EMPTY_STRING);
        List<ShipinDTO> list = shipinService.selectShipinDTOList(shipinDTO);

        convert(list);

        modelmap.addAttribute("list", list);
        SysCategory sysCategory = new SysCategory();
        sysCategory.setParentId(100L);
        List<SysCategory> categoryList = categoryService.selectDeptList(sysCategory);
        modelmap.addAttribute("categoryList", categoryList);
        return prefix + "/index.html";
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
            long diffDays = DateUtils.getDiffDays(createTime, now);
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

    @GetMapping("/pagination")
    public String pagination() {
        return prefix + "/pagination";
    }

    @GetMapping("/detail/{id}/{userid}")
    public String detail(@PathVariable("id") Long id, @PathVariable("userid") String userid, ModelMap modelmap) {
        logger.info("user:{},id:{}", userid, id);
        ShipinDTO shipin = shipinService.selectShipinDTOById(id);
        if (shipin!=null){
            convert(new Date(), shipin);
            modelmap.put("shipin", shipin);
            SysCategory category = categoryService.selectDeptById(shipin.getCategoryId().longValue());
            if (category!=null){
                modelmap.put("category", category);
            }
        }
        threadPoolTaskExecutor.execute(() -> {


        });

        ShipinDTO shipinDTO = new ShipinDTO();
        PageHelper.startPage(1, 12, StringUtil.EMPTY_STRING);
        List<ShipinDTO> list = shipinService.selectShipinDTOList(shipinDTO);

        convert(list);

        modelmap.addAttribute("list", list);


        return prefix + "/detail";
    }


    @GetMapping("/flowplayer")
    public String flowplayer(ModelMap mmap) {
        return prefix + "/flowplayer";
    }


    @PostMapping("/list")
    @ResponseBody
    public TableDataInfoExt list(ShipinDTO shipinDTO) {
        startPage();
        List<ShipinDTO> list = shipinService.selectShipinDTOList(shipinDTO);
        convert(list);
        TableDataInfo dataTable = getDataTable(list);
        TableDataInfoExt ext = new TableDataInfoExt();
        BeanUtils.copyProperties(dataTable, ext);
        ext.setLength(dataTable.getRows().size());
        return ext;
    }


}

@Data
class TableDataInfoExt extends TableDataInfo {
    private long length;

}