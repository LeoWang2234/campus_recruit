package com.wechat.wechatinput;

import com.wechat.wechatinput.InputData;

import java.util.*;

/**
 * Created by cheng on 2017/8/21.
 * <p>
 * 因为微信后台没有  session  所以自己写一个模拟 session ,
 */
public class SessionData {

    private static Map<String, InputData> session = new HashMap<>();


    private SessionData() {

    }

    public static Map<String, InputData> getSessionData() {
        return session;
    }
}
