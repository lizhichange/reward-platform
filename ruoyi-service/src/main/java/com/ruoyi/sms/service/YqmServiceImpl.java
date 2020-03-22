package com.ruoyi.sms.service;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.sms.domain.Yqm;
import com.ruoyi.sms.domain.YqmExample;
import com.ruoyi.sms.facade.api.IYqmService;
import com.ruoyi.sms.facade.dto.YqmDTO;
import com.ruoyi.sms.mapper.ExtYqmMapper;
import com.ruoyi.sms.mapper.YqmMapper;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


/**
 * 邀请码管理Service业务层处理
 *
 * @author ruoyi
 * @date 2020-03-17
 */
@Service
public class YqmServiceImpl implements IYqmService {
    @Autowired
    private ExtYqmMapper extYqmMapper;
    @Autowired
    private YqmMapper yqmMapper;

    @Override
    public int count(YqmDTO item) {
        YqmExample example = new YqmExample();
        YqmExample.Criteria criteria = example.createCriteria();
        if (item.getId() != null) {
            criteria.andIdEqualTo(item.getId());
        }
        if (StringUtil.isNotBlank(item.getUserid())) {
            criteria.andUseridEqualTo(item.getUserid());
        }
        long l = yqmMapper.countByExample(example);
        return (int) l;
    }

    /**
     * 查询邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 邀请码管理
     */
    @Override
    public YqmDTO selectYqmById(Long id) {
        return convert(extYqmMapper.selectYqmById(id));
    }

    /**
     * 查询邀请码管理列表
     *
     * @param yqm 邀请码管理
     * @return 邀请码管理
     */
    @Override
    public List<YqmDTO> selectYqmList(YqmDTO yqm) {

        Yqm item = new Yqm();
        BeanUtils.copyProperties(yqm, item);
        List<Yqm> list = extYqmMapper.selectYqmList(item);
        return list.stream().map(this::convert).collect(Collectors.toList());
    }

    private YqmDTO convert(Yqm item) {
        if (item == null) {
            return null;
        }
        YqmDTO dto = new YqmDTO();
        BeanUtils.copyProperties(item, dto);
        return dto;
    }


    /**
     * 新增邀请码管理
     *
     * @param yqm 邀请码管理
     * @return 结果
     */
    @Override
    public int insertYqm(YqmDTO yqm) {
        Yqm item = new Yqm();
        BeanUtils.copyProperties(yqm, item);
        return extYqmMapper.insertYqm(item);
    }

    /**
     * 修改邀请码管理
     *
     * @param yqm 邀请码管理
     * @return 结果
     */
    @Override
    public int updateYqm(YqmDTO yqm) {
        Yqm item = new Yqm();
        BeanUtils.copyProperties(yqm, item);
        return extYqmMapper.updateYqm(item);
    }

    /**
     * 删除邀请码管理对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteYqmByIds(String ids) {
        return extYqmMapper.deleteYqmByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除邀请码管理信息
     *
     * @param id 邀请码管理ID
     * @return 结果
     */
    @Override
    public int deleteYqmById(Long id) {
        return extYqmMapper.deleteYqmById(id);
    }
}
