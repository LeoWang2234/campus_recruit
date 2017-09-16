package com.ecust.pojo;

import java.io.Serializable;

/**
 * Created by cheng on 2017/9/16.
 */
public class Result implements Serializable {
    private String message;

    public Result(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
