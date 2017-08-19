package com.ecust.dto;

import java.io.Serializable;

/**
 * Created by cheng on 2017/8/18.
 */
public class CompanyForm implements Serializable{
    //公司名称
    private String name;
    // 招聘职位
    private String position;
    //投递链接
    private String link;
    private String deadline;
    private String push_code;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getPush_code() {
        return push_code;
    }

    public void setPush_code(String push_code) {
        this.push_code = push_code;
    }
}
