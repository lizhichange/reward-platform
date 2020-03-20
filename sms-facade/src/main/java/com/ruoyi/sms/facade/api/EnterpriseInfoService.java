package com.ruoyi.sms.facade.api;

import com.ruoyi.sms.facade.dto.EnterpriseInfoDTO;

import java.util.List;

/**
 * 【请填写功能名称】Service接口
 *
 * @author ruoyi
 * @date 2019-09-06
 */
public interface EnterpriseInfoService {

    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    EnterpriseInfoDTO selectEnterpriseInfoById(Long id);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param enterpriseInfoDTO 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    List<EnterpriseInfoDTO> selectEnterpriseInfoList(EnterpriseInfoDTO enterpriseInfoDTO);

    /**
     * 新增【请填写功能名称】
     *
     * @param enterpriseInfoDTO 【请填写功能名称】
     * @return 结果
     */
    int insertEnterpriseInfo(EnterpriseInfoDTO enterpriseInfoDTO);

    /**
     * 修改【请填写功能名称】
     *
     * @param enterpriseInfoDTO 【请填写功能名称】
     * @return 结果
     */
    int updateEnterpriseInfo(EnterpriseInfoDTO enterpriseInfoDTO);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteEnterpriseInfoByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    int deleteEnterpriseInfoById(Long id);
}
