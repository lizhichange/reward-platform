package com.ruoyi.sms.facade.api;



import com.ruoyi.sms.facade.dto.YqmDTO;

import java.util.List;


/**
 * 邀请码管理Service接口
 *
 * @author ruoyi
 * @date 2020-03-17
 */
public interface IYqmService {
    /**
     * 查询邀请码管理
     *
     * @param id 邀请码管理ID
     * @return 邀请码管理
     */
    public YqmDTO selectYqmById(Long id);

    /**
     * 查询邀请码管理列表
     *
     * @param yqm 邀请码管理
     * @return 邀请码管理集合
     */
    List<YqmDTO> selectYqmList(YqmDTO yqm);

    /**
     * 新增邀请码管理
     *
     * @param yqm 邀请码管理
     * @return 结果
     */

     int insertYqm(YqmDTO yqm);

    /**
     * 修改邀请码管理
     *
     * @param yqm 邀请码管理
     * @return 结果
     */
    public int updateYqm(YqmDTO yqm);

    /**
     * 批量删除邀请码管理
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteYqmByIds(String ids);

    /**
     * 删除邀请码管理信息
     *
     * @param id 邀请码管理ID
     * @return 结果
     */
    public int deleteYqmById(Long id);
    }
