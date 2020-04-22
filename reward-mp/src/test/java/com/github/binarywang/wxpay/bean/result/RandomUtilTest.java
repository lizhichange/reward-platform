package com.github.binarywang.wxpay.bean.result;

import cn.hutool.core.util.RandomUtil;
import org.junit.Test;

public class RandomUtilTest {
    @Test
    public void test() {
        for (int i = 11; i <= 100; i++) {
            System.out.println(getMoney(i));
        }

    }

    //随机减免
    //对价格给一个后两位的随机减免
    static int getMoney(Integer money) {
        int randomInt = 0;
        if (money == null || money == 0) {
            return randomInt;
        }
        //1-9
        if (money <= 10) {
            return RandomUtil.randomInt(1, money + 1);
        }
        //11-100
        if (money <= 100) {
            return RandomUtil.randomInt(money, 100);
        }
        return randomInt;
    }

    @Test
    public void test01() {
        for (int i = 0; i < 1111; i++) {
            int m = RandomUtil.randomInt(1, 100);
            int money = 100 - m;
            System.out.println(money);
        }


    }
}
