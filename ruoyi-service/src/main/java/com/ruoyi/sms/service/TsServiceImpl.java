package com.ruoyi.sms.service;


import com.alibaba.dubbo.config.annotation.Service;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.sms.mapper.ExtTsMapper;
import com.ruoyi.sms.mapper.TsMapper;
import com.ruoyi.sms.domain.Ts;
import com.ruoyi.sms.domain.TsExample;
import com.ruoyi.sms.facade.api.ITsService;
import com.ruoyi.sms.facade.dto.TsDTO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.stream.Collectors;


/**
 * 投诉列表Service业务层处理
 *
 * @author ruoyi
 * @date 2020-03-16
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class TsServiceImpl implements ITsService {
    @Autowired
    private ExtTsMapper extTsMapper;


    @Autowired
    private TsMapper tsMapper;
    /**
     * 查询投诉列表
     *
     * @param id 投诉列表ID
     * @return 投诉列表
     */
    @Override
    public TsDTO selectTsById(Long id) {


        return convert(extTsMapper.selectTsById(id));
    }

    private TsDTO convert(Ts item) {
        if (item == null) {
            return null;
        }
        TsDTO dto = new TsDTO();
        BeanUtils.copyProperties(item, dto);
        return dto;
    }


    /**
     * 查询投诉列表列表
     *
     * @param ts 投诉列表
     * @return 投诉列表
     */
    @Override
    public List<TsDTO> selectTsList(TsDTO ts) {
        Ts item = new Ts();
        BeanUtils.copyProperties(ts, item);
        List<Ts> list = extTsMapper.selectTsList(item);
        return list.stream().map(this::convert).collect(Collectors.toList());
    }

    /**
     * 新增投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    @Override
    public int insertTs(TsDTO ts) {
        Ts item = new Ts();
        BeanUtils.copyProperties(ts, item);
        return extTsMapper.insertTs(item);
    }

    /**
     * 修改投诉列表
     *
     * @param ts 投诉列表
     * @return 结果
     */
    @Override
    public int updateTs(TsDTO ts) {
        Ts item = new Ts();
        BeanUtils.copyProperties(ts, item);
        return extTsMapper.updateTs(item);
    }

    /**
     * 删除投诉列表对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTsByIds(String ids) {
        return extTsMapper.deleteTsByIds(Convert.toStrArray(ids));
    }

    @Override
    public int count() {
        return (int) tsMapper.countByExample(new TsExample());
    }

    /**
     * 删除投诉列表信息
     *
     * @param id 投诉列表ID
     * @return 结果
     */
    @Override
    public int deleteTsById(Long id) {
        return extTsMapper.deleteTsById(id);
    }

}
