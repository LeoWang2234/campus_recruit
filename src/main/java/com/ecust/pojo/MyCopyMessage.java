package com.ecust.pojo;

import java.io.Serializable;

/**
 * Created by cheng on 2017/8/31.
 */
public class MyCopyMessage implements Serializable{


    private String userId;
    private String message;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
