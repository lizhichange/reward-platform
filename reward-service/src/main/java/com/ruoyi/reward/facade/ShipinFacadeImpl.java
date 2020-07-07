package com.ruoyi.reward.facade;

import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.collect.Lists;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.reward.convert.ShipinConvert;
import com.ruoyi.reward.facade.api.ShipinFacade;
import com.ruoyi.reward.facade.dto.ShipinDTO;

import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.ShipinExample;
import com.ruoyi.reward.mapper.ExtShipinMapper;
import com.ruoyi.reward.mapper.ShipinMapper;
import com.ruoyi.reward.repository.ShipinRepository;
import org.near.servicesupport.result.ResultBuilder;
import org.near.servicesupport.result.TPageResult;
import org.near.toolkit.common.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;


/**
 * 公共片库Service业务层处理
 *
 * @author ruoyi
 * @date 2020-03-17
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class ShipinFacadeImpl implements ShipinFacade {
    @Autowired
    private ShipinMapper shipinMapper;
    @Autowired
    ShipinRepository shipinRepository;
    @Autowired
    private ExtShipinMapper extShipinMapper;

    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    @Override
    public ShipinDTO selectShipinDTOById(Long id) {
        Video shipin = extShipinMapper.selectShipinById(id);
        return ShipinConvert.convert(shipin);

    }

    @Override
    public int updateClickPlus(Long id) {
        return extShipinMapper.updateClickPlus(id);
    }


    /**
     * 查询公共片库列表
     *
     * @param item 公共片库
     * @return 公共片库
     */
    @Override
    public List<ShipinDTO> selectShipinDTOList(ShipinDTO item) {
        Video it = new Video();
        BeanUtils.copyProperties(item, it);
        List<Video> list = extShipinMapper.selectShipinList(it);
        return list.stream().map(ShipinConvert::convert).collect(Collectors.toList());

    }

    @Override
    public int count(ShipinDTO item) {
        ShipinExample example = new ShipinExample();
        ShipinExample.Criteria criteria = example.createCriteria();
        if (item.getId() != null) {
            criteria.andIdEqualTo(item.getId());
        }
        if (StringUtil.isNotBlank(item.getUserId())) {
            criteria.andUserIdEqualTo(item.getUserId());
        }
        long l = shipinMapper.countByExample(example);
        return (int) l;
    }

    /**
     * 新增公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    @Override
    public int insertShipinDTO(ShipinDTO item) {
        Video it = new Video();
        BeanUtils.copyProperties(item, it);
        return extShipinMapper.insertShipin(it);
    }

    /**
     * 修改公共片库
     *
     * @param item 公共片库
     * @return 结果
     */
    @Override
    public int updateShipinDTO(ShipinDTO item) {
        Video it = new Video();
        BeanUtils.copyProperties(item, it);
        return extShipinMapper.updateShipin(it);
    }

    @Override
    public TPageResult<ShipinDTO> queryPage(int start, int rows, ShipinDTO shipinDTO, String orderByClause) {
        int i = start > 1 ? (start - 1) * rows : 0;
        List<ShipinDTO> list = shipinRepository.queryPage(i, rows, shipinDTO, orderByClause);
        if (CollectionUtils.isEmpty(list)) {
            return ResultBuilder.succTPage(Lists.newArrayList(), start, rows, 0);
        }
        long count = shipinRepository.count(shipinDTO);
        return ResultBuilder.succTPage(list, start, rows, (int) count);
    }

    /**
     * 删除公共片库对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteShipinDTOByIds(String ids) {
        return extShipinMapper.deleteShipinByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除公共片库信息
     *
     * @param id 公共片库ID
     * @return 结果
     */
    @Override
    public int deleteShipinDTOById(Long id) {
        return extShipinMapper.deleteShipinById(id);
    }
}
