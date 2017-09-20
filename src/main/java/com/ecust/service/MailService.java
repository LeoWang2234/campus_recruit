package com.ecust.service;

import com.ecust.pojo.User;

public interface MailService {

    public void sendMail(User user, String content,String subject);

}