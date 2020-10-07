package com.ylyang.wx_url_check;


import com.google.common.collect.Lists;
import lombok.Data;
import org.near.toolkit.common.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.net.Socket;
import java.util.*;
import java.util.concurrent.*;

public class Demo {

    public static void main(String[] args) throws InterruptedException, ExecutionException {


        ArrayList<Item> items = Lists.newArrayList();
        for (int i = 0; i < 200; i++) {
            Item item = new Item();
            item.setId(UUID.randomUUID().toString());
            item.setName(UUID.randomUUID().toString());
            Date date = new Date();
            item.setCreateTime(DateUtils.addHours(date, i));
            items.add(item);
            //  System.out.println(DateUtils.formatNewFormat(item.getCreateTime()));
        }

        Collections.sort(items, new Comparator<Item>() {
            @Override
            public int compare(Item o1, Item o2) {
                return o2.getCreateTime().compareTo(o1.getCreateTime());
            }
        });
        for (Item item : items) {
            //  System.out.println(DateUtils.formatNewFormat(item.getCreateTime()));

        }


        //items 集合数据 200/10 =20
        //10个
        ExecutorService executorService = Executors.newFixedThreadPool(10);
        List<MyCall> objects = Lists.newArrayList();

        List<List<Item>> partition = Lists.partition(items, 20);

        for (List<Item> itemList : partition) {
            MyCall myCall = new MyCall(itemList);
            objects.add(myCall);
        }

        List<Future<Integer>> futures = executorService.invokeAll(objects);
        for (Future<Integer> future : futures) {
            Integer integer = future.get();

        }
    }
}

@Data
class Item implements Serializable {
    private String id;
    private String name;
    private Date createTime;
}

@Data
class MyCall implements Callable<Integer> {
    private List<Item> list;


    MyCall(List<Item> list) {
        this.list = list;

    }

    @Override
    public Integer call() throws Exception {
        for (Item item : list) {
            System.out.println("数据时间:" + DateUtils.formatNewFormat(item.getCreateTime()) + "当前时间:" + System.currentTimeMillis() + "线程名字:" + Thread.currentThread().getName() + "---->消费的数据行:" + list.size());

        }
        return list.size();
    }
}