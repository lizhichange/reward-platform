package com.ruoyi.framework.aspectj;

import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;

/**
 * @author sunflower
 */
public class CglibProxy implements MethodInterceptor {

    public final int MAX_TIMES = 3;

    @Override
    public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
        int times = 0;
        while (true) {
            try {
                //通过代理子类调用父类的方法
                return methodProxy.invokeSuper(o, objects);
            } catch (Exception e) {
                times++;
                if (times >= MAX_TIMES) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    /**
     * 获取代理类
     *
     * @param clazz 类信息
     * @return 代理类结果
     */
    public Object getProxy(Class clazz) {
        Enhancer enhancer = new Enhancer();
        //目标对象类
        enhancer.setSuperclass(clazz);
        enhancer.setCallback(this);
        //通过字节码技术创建目标对象类的子类实例作为代理
        return enhancer.create();
    }

}

