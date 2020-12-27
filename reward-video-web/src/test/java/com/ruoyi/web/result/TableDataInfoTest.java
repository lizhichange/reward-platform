package com.ruoyi.web.result;


import com.google.common.base.Function;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import lombok.Getter;
import lombok.Setter;
import org.checkerframework.checker.nullness.qual.Nullable;
import org.junit.Assert;
import org.junit.Test;

import java.util.ArrayList;

public class TableDataInfoTest {


    @Test
    public void getTotalPage() {
        A a = new A();
        a.setA(1);
        a.setB("1");
        a.setC(1);
        A a1 = new A();
        a1.setA(2);
        a1.setB("2");
        a1.setC(2);
        A a2 = new A();
        a2.setA(3);
        a2.setB("2");
        a2.setC(3);



        B b = new B();
        b.setA(1);
        b.setB("1");
        b.setC(1);
        B b1 = new B();
        b1.setA(2);
        b1.setB("2");
        b1.setC(2);


        ArrayList<B> bs = Lists.newArrayList(b, b1);
        ArrayList<A> as = Lists.newArrayList(a, a1,a2);

        ImmutableMap<String, A> stringAImmutableMap = Maps.uniqueIndex(as, new Function<A, String>() {
            @Nullable
            @Override
            public String apply(@Nullable A a) {
                return a.getB();
            }
        });
        stringAImmutableMap.asMultimap();



        Assert.assertTrue(true);
    }

    @Getter
    @Setter
    class A {
        private int a;
        private String b;
        private int c;

        public int getA() {
            return a;
        }

        public void setA(int a) {
            this.a = a;
        }

        public String getB() {
            return b;
        }

        public void setB(String b) {
            this.b = b;
        }

        public int getC() {
            return c;
        }

        public void setC(int c) {
            this.c = c;
        }
    }

    @Getter
    @Setter
    class B {
        private int a;
        private String b;
        private int c;
        private int l;

        public int getA() {
            return a;
        }

        public void setA(int a) {
            this.a = a;
        }

        public String getB() {
            return b;
        }

        public void setB(String b) {
            this.b = b;
        }

        public int getC() {
            return c;
        }

        public void setC(int c) {
            this.c = c;
        }

        public int getL() {
            return l;
        }

        public void setL(int l) {
            this.l = l;
        }
    }
}