package com.ecust.schedule;

import com.ecust.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Component
@Lazy(false)
public class ValidationTest {

    @Autowired
    EquipmentService equipmentService;

    public static SimpleDateFormat sdf_yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");

    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

    //    @Scheduled(cron = "5 * * * * *")
    @Scheduled(fixedRate = 50000)
    public void validateTest() {

        Date date1;
        Date date2 = new Date();
        List<Map<String, Object>> dataList = equipmentService.queryAllEquipmentForValidation();
        for (int i = 0; i < dataList.size(); i++) {
            HashMap oneCompany = (HashMap) dataList.get(i);
            String dateString = (String) oneCompany.get("deadline");
            try {
                date1 = sdf.parse(dateString);
                int days = (int) ((date1.getTime() - date2.getTime()) / (1000 * 3600 * 24));
                if (days <= 0) { // 已经过期
                    equipmentService.updateStatus(((Long)oneCompany.get("id")).intValue(),2);
                }else if(days < 3 ){ // 即将过期
                    equipmentService.updateStatus(((Long)oneCompany.get("id")).intValue(),1);
                }else { // 正在进行
                    equipmentService.updateStatus(((Long)oneCompany.get("id")).intValue(),0);
                }
            } catch (Exception e) {
                // 状态未知
                equipmentService.updateStatus(((Long)oneCompany.get("id")).intValue(),4);
            }
        }
        System.out.println(sdf_yyyyMMddHHmmss.format(new Date()) + " ：执行中。。。");
    }

    @Scheduled(fixedRate = 5000)
    public void handle() {

        System.out.println("*****************************************");
    }
}