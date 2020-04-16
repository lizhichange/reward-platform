package com.ruoyi.reward.facade;


import com.alibaba.dubbo.config.annotation.Service;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.reward.facade.api.EnterpriseInfoFacade;
import com.ruoyi.reward.facade.dto.EnterpriseInfoDTO;
import com.ruoyi.reward.domain.EnterpriseInfo;
import com.ruoyi.reward.mapper.EnterpriseInfoMapper;
import com.ruoyi.reward.mapper.ExtEnterpriseInfoMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.stream.Collectors;


/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2019-09-06
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class EnterpriseInfoFacadeImpl implements EnterpriseInfoFacade {
    @Autowired
    private EnterpriseInfoMapper enterpriseInfoMapper;

    @Autowired
    private ExtEnterpriseInfoMapper extEnterpriseInfoMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public EnterpriseInfoDTO selectEnterpriseInfoById(Long id) {
        EnterpriseInfo enterpriseInfo = extEnterpriseInfoMapper.selectEnterpriseInfoById(id);
        return convert(enterpriseInfo);
    }

    private EnterpriseInfoDTO convert(EnterpriseInfo enterpriseInfo) {
        if (enterpriseInfo == null) {
            return null;
        }
        EnterpriseInfoDTO dto = new EnterpriseInfoDTO();
        BeanUtils.copyProperties(enterpriseInfo, dto);
        return dto;
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param enterpriseInfoDTO 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<EnterpriseInfoDTO> selectEnterpriseInfoList(EnterpriseInfoDTO enterpriseInfoDTO) {
        EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
        BeanUtils.copyProperties(enterpriseInfoDTO, enterpriseInfo);
        List<EnterpriseInfo> list = extEnterpriseInfoMapper.selectEnterpriseInfoList(enterpriseInfo);
        return list.stream().map(this::convert).collect(Collectors.toList());
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param enterpriseInfoDTO 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertEnterpriseInfo(EnterpriseInfoDTO enterpriseInfoDTO) {
        EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
        BeanUtils.copyProperties(enterpriseInfoDTO, enterpriseInfo);
        return extEnterpriseInfoMapper.insertEnterpriseInfo(enterpriseInfo);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param enterpriseInfoDTO 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateEnterpriseInfo(EnterpriseInfoDTO enterpriseInfoDTO) {
        EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
        BeanUtils.copyProperties(enterpriseInfoDTO, enterpriseInfo);
        return extEnterpriseInfoMapper.updateEnterpriseInfo(enterpriseInfo);
    }

    /**
     * 删除【请填写功能名称】对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteEnterpriseInfoByIds(String ids) {
        return extEnterpriseInfoMapper.deleteEnterpriseInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteEnterpriseInfoById(Long id) {
        return extEnterpriseInfoMapper.deleteEnterpriseInfoById(id);
    }
}
