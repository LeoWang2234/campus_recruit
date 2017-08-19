package com.wechat.start;

import java.util.Properties;

public class GlobalConstants {

    public static Properties interfaceUrlProperties;

    /**
     * @param @param  key
     * @param @return
     * @Description: TODO
     * @author dapengniao
     * @date 2015年10月13日 下午4:59:14
     */
    public static String getInterfaceUrl(String key) {
        return (String) interfaceUrlProperties.get(key);
    }
}
