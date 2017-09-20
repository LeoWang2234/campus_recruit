package com.ecust.service.impl;

import com.ecust.pojo.User;
import com.ecust.service.MailService;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

@Service
public class MailServiceImpl implements MailService {


    public static final String HOST = "smtp.163.com";
    public static final String PROTOCOL = "smtp";
    public static final int PORT = 25;
    public static final String FROM = "wangcheng2234@163.com";//发件人的email
    public static final String PWD = "wangcheng1234";//发件人密码
//    @Override
//    public void sendMail(User user, String content) {
//        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
//        mailSender.setHost("smtp.163.com");
//        mailSender.setUsername("wangcheng2234@163.com");
//        mailSender.setPassword("wangcheng1234");
//
////        SimpleMailMessage smm = new SimpleMailMessage();
//
//        MimeMailMessage smm = new MimeMailMessage();
//// 设定邮件参数
//        smm.set
//        smm.setFrom(mailSender.getUsername());
//        smm.setTo(user.getUserName());
//        smm.setSubject("校招管理邮箱激活");
//        smm.setContent(content , "text/html;charset=utf-8");
//        smm.setText(content);
//
//// 发送邮件
//        mailSender.send(smm);
//    }



    /**
     * 获取Session
     * @return
     */
    private static Session getSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);//设置服务器地址
        props.put("mail.store.protocol" , PROTOCOL);//设置协议
        props.put("mail.smtp.port", PORT);//设置端口
        props.put("mail.smtp.auth" , true);

        Authenticator authenticator = new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, PWD);
            }

        };
        Session session = Session.getDefaultInstance(props , authenticator);

        return session;
    }

    @Override
    public void sendMail(User user, String content,String subject) {
        String toEmail = user.getUserName();
        Session session = getSession();
        try {
            System.out.println("--send--"+content);
            // Instantiate a message
            Message msg = new MimeMessage(session);

            //Set message attributes
            msg.setFrom(new InternetAddress(FROM));
            InternetAddress[] address = {new InternetAddress(toEmail)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setContent(content , "text/html;charset=utf-8");

            //Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }

}

