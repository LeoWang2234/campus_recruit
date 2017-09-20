package com.ecust.test;

import com.ecust.service.MailService;
import com.ecust.service.impl.MailServiceImpl;
import org.junit.Test;

/**
 * Created by cheng on 2017/8/18.
 */
public class JavaMailTest {
    @Test
    public void sendMail() {
        MailService mailService = new MailServiceImpl();
//        mailService.sendMail();

    }
}
