package com.ecust.utils;

import com.ecust.dto.CompanyForm;
import com.ecust.pojo.Company;

/**
 * Created by cheng on 2017/8/18.
 */
public class DataTrans {
    public static Company toCompany(CompanyForm companyForm) {
        Company company = new Company();
        company.setName(companyForm.getName());
        company.setPosition(companyForm.getPosition());
        company.setLink(companyForm.getLink()==""?"未知":companyForm.getLink());
        company.setDeadline(companyForm.getDeadline() == "" ? "未知" : companyForm.getDeadline());
        if (companyForm.getPush_code() == "") {
            company.setPush(0);  // 1 push; 0 not push
            company.setPush_code("");
        }else {
            company.setPush(1);
            company.setPush_code(companyForm.getPush_code());
        }
        company.setStatus(0); // 0 :未投递 1: 已投递
        return company;
    }

    public static void main(String[] args) {
        System.out.println("\" nihao \"");
    }
}
