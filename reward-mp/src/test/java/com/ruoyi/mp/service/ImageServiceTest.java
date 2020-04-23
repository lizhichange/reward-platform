package com.ruoyi.mp.service;

import com.ruoyi.mp.ApplicationTests;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ImageServiceTest extends ApplicationTests {

    @Autowired
    ImageService imageService;

    @Test
    public void test01() {
        String account = "1.00";
        imageService.queryWeChatQrCode(account);
    }
}
