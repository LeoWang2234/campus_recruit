package com.ecust.schedule;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;


@Component
@Lazy(false)
public class TestJob {
    public static SimpleDateFormat sdf_yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");


    @Scheduled(cron = "0/5 * * * * ?")
    public void exejob() {
        System.out.println(sdf_yyyyMMddHHmmss.format(new Date()) + " £ºÖ´ÐÐÖÐ¡£¡£¡£");
    }

    @Scheduled(fixedRate =  60 * 10 * 1000)
    public void handle() {
    }
}