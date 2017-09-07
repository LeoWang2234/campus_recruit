package com.ecust.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Created by cheng on 2017/8/31.
 */
public class PropertyUtils {

    private static Properties prop = new Properties();
    private static InputStream input = null;

    public  static Properties loadProperity(String filePath) {
        input = PropertyUtils.class.getResourceAsStream(filePath);
        try {
            prop.load(input);
        } catch (IOException e) {
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return prop;
    }

    public static Map<String, String> getAllProperities(String filePath) {
        Map<String, String> properties = new HashMap<String, String>();
        loadProperity(filePath);
        //·½·¨Èý£º
        Enumeration<?> e = prop.propertyNames();
        while (e.hasMoreElements()) {
            String key = (String) e.nextElement();
            String value = prop.getProperty(key);
            properties.put(key, value);
        }
        return properties;
    }

    public static String getProperty(String key, String filePath) {
        loadProperity(filePath);
        return prop.getProperty(key);
    }

    public static void main(String[] args) {
        System.out.println(getAllProperities("./wechat.properties"));
        System.out.println(getProperty("appd", "./wechat.properties"));
    }
}