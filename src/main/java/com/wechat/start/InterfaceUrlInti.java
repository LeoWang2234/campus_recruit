package com.wechat.start;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * ClassName: InterfaceUrlInti
 * @Description: 项目启动初始化方法
 * @author dapengniao
 * @date 2016 年 3 月 10 日 下午 4:08:21
 */
public class InterfaceUrlInti {

    public synchronized static void init(){
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        System.out.println("*************************************************************************");
        ClassLoader cl = Thread.currentThread().getContextClassLoader();
        Properties props = new Properties();
        if(GlobalConstants.interfaceUrlProperties==null){
            GlobalConstants.interfaceUrlProperties = new Properties();
        }
        InputStream in = null;
        try {
            in = cl.getResourceAsStream("interface_url.properties");
            props.load(in);
            for(Object key : props.keySet()){
                GlobalConstants.interfaceUrlProperties.put(key, props.get(key));
            }

            props = new Properties();
            in = cl.getResourceAsStream("wechat.properties");
            props.load(in);
            for(Object key : props.keySet()){
                GlobalConstants.interfaceUrlProperties.put(key, props.get(key));
            }

        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            if(in!=null){
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return;
    }

}