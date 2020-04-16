package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.AccountDetail;
import com.ruoyi.system.mapper.ExtAccountDetailMapper;
import com.ruoyi.system.service.IAccountDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 账户明细Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-04-13
 */
@Service
public class AccountDetailServiceImpl implements IAccountDetailService 
{
    @Autowired
    private ExtAccountDetailMapper accountDetailMapper;

    /**
     * 查询账户明细
     * 
     * @param id 账户明细ID
     * @return 账户明细
     */
    @Override
    public AccountDetail selectAccountDetailById(Long id)
    {
        return accountDetailMapper.selectAccountDetailById(id);
    }

    /**
     * 查询账户明细列表
     * 
     * @param accountDetail 账户明细
     * @return 账户明细
     */
    @Override
    public List<AccountDetail> selectAccountDetailList(AccountDetail accountDetail)
    {
        return accountDetailMapper.selectAccountDetailList(accountDetail);
    }

    /**
     * 新增账户明细
     * 
     * @param accountDetail 账户明细
     * @return 结果
     */
    @Override
    public int insertAccountDetail(AccountDetail accountDetail)
    {
        return accountDetailMapper.insertAccountDetail(accountDetail);
    }

    /**
     * 修改账户明细
     * 
     * @param accountDetail 账户明细
     * @return 结果
     */
    @Override
    public int updateAccountDetail(AccountDetail accountDetail)
    {
        return accountDetailMapper.updateAccountDetail(accountDetail);
    }

    /**
     * 删除账户明细对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteAccountDetailByIds(String ids)
    {
        return accountDetailMapper.deleteAccountDetailByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除账户明细信息
     * 
     * @param id 账户明细ID
     * @return 结果
     */
    @Override
    public int deleteAccountDetailById(Long id)
    {
        return accountDetailMapper.deleteAccountDetailById(id);
    }
}
