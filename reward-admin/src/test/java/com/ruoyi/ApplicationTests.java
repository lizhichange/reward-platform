package com.ruoyi;

import com.ruoyi.reward.facade.dto.UserDTO;
import com.ruoyi.reward.mapper.VideoMapper;
import com.ruoyi.reward.repository.UserDetailRepository;
import com.ruoyi.system.domain.Account;
import com.ruoyi.system.mapper.AccountMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
// 指定启动类
@SpringBootTest(classes = {RuoYiApplication.class})
public class ApplicationTests {
    @Autowired
    VideoMapper videoMapper;
    @Autowired
    AccountMapper accountMapper;
    @Autowired
    UserDetailRepository userDetailRepository;

    @Test
    public void test01() {
        Account account = new Account();
        account.setAccountId("admin");
        account.setState("0");
        account.setBalance(110L);
        accountMapper.insertSelective(account);

    }

    @Test
    public void test02() {
        UserDTO userDto = userDetailRepository.queryByUserName("admin");
        System.out.println(userDto);

    }
}
