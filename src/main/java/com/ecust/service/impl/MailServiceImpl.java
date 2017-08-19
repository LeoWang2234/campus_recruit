package com.ecust.service.impl;

import com.ecust.service.MailService;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class MailServiceImpl implements MailService {
    @Override
    public void sendMail() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.163.com");
        mailSender.setUsername("wangcheng2234@163.com");
        mailSender.setPassword("wangcheng1234");

        SimpleMailMessage smm = new SimpleMailMessage();
// 设定邮件参数
        smm.setFrom(mailSender.getUsername());
        smm.setTo("wangcheng2234@163.com");
        smm.setSubject("Hello world");
        smm.setText("Hello world via spring mail sender");
// 发送邮件
        mailSender.send(smm);
    }
}

