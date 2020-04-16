package com.ruoyi.reward.mapper;

import com.ruoyi.reward.domain.Shipin;

import java.util.List;

/**
 * 公共片库Mapper接口
 *
 * @author ruoyi
 * @date 2020-03-17
 */
public interface ExtShipinMapper {
    /**
     * 查询公共片库
     *
     * @param id 公共片库ID
     * @return 公共片库
     */
    Shipin selectShipinById(Long id);

    /**
     * 查询公共片库列表
     *
     * @param shipin 公共片库
     * @return 公共片库集合
     */
    public List<Shipin> selectShipinList(Shipin shipin);

    /**
     * 新增公共片库
     *
     * @param shipin 公共片库
     * @return 结果
     */
    public int insertShipin(Shipin shipin);

    /**
     * 修改公共片库
     *
     * @param shipin 公共片库
     * @return 结果
     */
    public int updateShipin(Shipin shipin);

    /**
     * 删除公共片库
     *
     * @param id 公共片库ID
     * @return 结果
     */
    public int deleteShipinById(Long id);

    int updateClickPlus(Long id);

    /**
     * 批量删除公共片库
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteShipinByIds(String[] ids);
}
