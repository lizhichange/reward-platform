package com.ruoyi.reward.mapper;

import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.reward.domain.EnterpriseInfo;

import java.util.List;


/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2019-09-06
 * @date 2019-09-06
 */
@DataSource(DataSourceType.SLAVE)
public interface ExtEnterpriseInfoMapper {
    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    EnterpriseInfo selectEnterpriseInfoById(Long id);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param enterpriseInfo 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    List<EnterpriseInfo> selectEnterpriseInfoList(EnterpriseInfo enterpriseInfo);

    /**
     * 新增【请填写功能名称】
     *
     * @param enterpriseInfo 【请填写功能名称】
     * @return 结果
     */
    int insertEnterpriseInfo(EnterpriseInfo enterpriseInfo);

    /**
     * 修改【请填写功能名称】
     *
     * @param enterpriseInfo 【请填写功能名称】
     * @return 结果
     */
    int updateEnterpriseInfo(EnterpriseInfo enterpriseInfo);

    /**
     * 删除【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    int deleteEnterpriseInfoById(Long id);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteEnterpriseInfoByIds(String[] ids);
}
