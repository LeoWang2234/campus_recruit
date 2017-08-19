package com.ecust.schedule;

import org.springframework.scheduling.annotation.Scheduled;

/**
 * Created by cheng on 2017/8/18.
 */
public class Test {
    //写入自己的逻辑代码
    @Scheduled(fixedRate = 10 * 1000)
    public void handle() {
        //写入自己的逻辑代码
        System.out.println("test");
    }
}