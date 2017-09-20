package com.ecust.test;

import com.ecust.utils.MD5Util;
import org.junit.Test;

/**
 * Created by cheng on 2017/9/20.
 */
public class CurrentTimeTest {
    @Test
    public void test() {
        String s = MD5Util.encode2hex("wangcheng2234@163.com");

//        System.currentTimeMillis();
//
        System.out.println(s);
    }
}
