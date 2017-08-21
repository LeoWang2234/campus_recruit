package com.wechat.wechatinput;

import com.ecust.dto.CompanyForm;

/**
 * Created by cheng on 2017/8/21.
 */
public class InputData {

    private CompanyForm companyForm = new CompanyForm();

    private int visitTime;

    public int getVisitTime() {
        return visitTime;
    }

    public void setVisitTime(int visitTime) {
        this.visitTime = visitTime;
    }

    public CompanyForm getCompanyForm() {
        return companyForm;
    }

    public void setCompanyForm(CompanyForm companyForm) {
        this.companyForm = companyForm;
    }

}
