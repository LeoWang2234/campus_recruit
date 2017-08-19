package com.wechat.dispatcher;

import com.wechat.utils.MessageUtil;

import java.util.Map;


/**
 * ClassName: EventDispatcher
 * @Description: 事件消息业务分发器
 * @author dapengniao
 * @date 2016 年 3 月 7 日 下午 4:04:41
 */
public class EventDispatcher {
    public static String processEvent(Map<String, String> map) {
        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) { //关注事件
            System.out.println("==============这是关注事件！");
        }

        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) { //取消关注事件
            System.out.println("==============这是取消关注事件！");
        }

//        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_SCAN)) { //扫描二维码事件
//            System.out.println("==============这是扫描二维码事件！");
//        }
//
//        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_LOCATION)) { //位置上报事件
//            System.out.println("==============这是位置上报事件！");
//        }
//
//        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_CLICK)) { //自定义菜单点击事件
//            System.out.println("==============这是自定义菜单点击事件！");
//        }
//
//        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_VIEW)) { //自定义菜单 View 事件
//            System.out.println("==============这是自定义菜单 View 事件！");
//        }

        return null;
    }
}