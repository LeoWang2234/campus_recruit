package com.wechat.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.wechat.start.GlobalConstants;
import com.wechat.utils.HttpUtils;
import net.sf.json.JSONObject;

/**
 * ClassName: WeChatTask
 * @Description: 微信两小时定时任务体
 * @author dapengniao
 * @date 2016 年 3 月 10 日 下午 1:42:29
 */
public class WeChatTask {
    /**
     * @Description: 任务执行体
     * @param @throws Exception
     * @author dapengniao
     * @date 2016 年 3 月 10 日 下午 2:04:37
     */
    public void getToken_getTicket() throws Exception {
        Map<String, String> params = new HashMap<String, String>();
        params.put("grant_type", "client_credential");
        params.put("appid", GlobalConstants.getInterfaceUrl("appid"));
        params.put("secret", GlobalConstants.getInterfaceUrl("AppSecret"));
        String jstoken = HttpUtils.sendGet(
                GlobalConstants.getInterfaceUrl("tokenUrl"), params);
        String access_token = JSONObject.fromObject(jstoken).getString(
                "access_token"); // 获取到 token 并赋值保存
        System.out.println("********************************************************");
        System.out.println("********************************************************");
        System.out.println("********************************************************");
        System.out.println("********************************************************");
        System.out.println(access_token);
        System.out.println("********************************************************");
        System.out.println("********************************************************");
        System.out.println("********************************************************");
        GlobalConstants.interfaceUrlProperties.put("access_token", access_token);
        System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"token 为==============================\n"+access_token);
    }

}
