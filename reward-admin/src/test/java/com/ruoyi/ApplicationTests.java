package com.ruoyi;

import com.ruoyi.reward.domain.Video;
import com.ruoyi.reward.domain.VideoExample;
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

import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = {RuoYiApplication.class})// 指定启动类
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

    @Test
    public void testOne() {
        List<Video> list = videoMapper.selectByExample(new VideoExample());
        for (Video shipin : list) {
            for (int i = 0; i < 1000; i++) {
                Video newShi = new Video();
                newShi.setMoney(shipin.getMoney());
                newShi.setSj(shipin.getSj());
                newShi.setCs(shipin.getCs());
                newShi.setUrl(shipin.getUrl());
                newShi.setUserId(shipin.getUserId());
                newShi.setName(shipin.getName());
                newShi.setZykey(shipin.getZykey());
                newShi.setShijian(shipin.getShijian());
                newShi.setLx(shipin.getLx());
                newShi.setZt(shipin.getZt());
                newShi.setLogo(shipin.getLogo());
                newShi.setIsLei(shipin.getIsLei());
                newShi.setIsAllow(shipin.getIsAllow());
                newShi.setClick(shipin.getClick());
                newShi.setIsPreview(shipin.getIsPreview());
                newShi.setShorturl(shipin.getShorturl());
                newShi.setCategoryId(shipin.getCategoryId());
                newShi.setCreateTime(new Date());
                videoMapper.insertSelective(newShi);
            }
        }

    }
}
