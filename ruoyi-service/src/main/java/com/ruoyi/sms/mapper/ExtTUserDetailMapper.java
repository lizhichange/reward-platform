package com.ruoyi.sms.mapper;

import com.ruoyi.sms.domain.TUserDetail;

import java.util.List;


/**
 * 平台用户Mapper接口
 *
 * @author ruoyi
 * @date 2020-04-11
 */
public interface ExtTUserDetailMapper {
    /**
     * 查询平台用户
     *
     * @param id 平台用户ID
     * @return 平台用户
     */
    public TUserDetail selectTUserDetailById(Long id);

    /**
     * 查询平台用户列表
     *
     * @param tUserDetail 平台用户
     * @return 平台用户集合
     */
    public List<TUserDetail> selectTUserDetailList(TUserDetail tUserDetail);

    /**
     * 新增平台用户
     *
     * @param tUserDetail 平台用户
     * @return 结果
     */
    public int insertTUserDetail(TUserDetail tUserDetail);

    /**
     * 修改平台用户
     *
     * @param tUserDetail 平台用户
     * @return 结果
     */
    public int updateTUserDetail(TUserDetail tUserDetail);

    /**
     * 删除平台用户
     *
     * @param id 平台用户ID
     * @return 结果
     */
    public int deleteTUserDetailById(Long id);

    /**
     * 批量删除平台用户
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTUserDetailByIds(String[] ids);
}
