package com.ecust.pojo;

import java.io.Serializable;

/**
 * Created by cheng on 2017/9/16.
 */
public class Result implements Serializable {
    private String message;

    private String code; // 1 成功 2 重复激活 3 链接失效 4 未知错误

    public Result() {
    }

    public Result(String code ,String message) {
        this.code = code;
        this.message = message;
    }

    public Result(String message) {
        this.message = message;
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
