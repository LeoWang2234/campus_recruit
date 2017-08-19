package com.wechat.quartz;

import com.wechat.common.WeChatTask;
import org.apache.log4j.Logger;


public class QuartzJob{
    private static Logger logger = Logger.getLogger(QuartzJob.class);
    /**
     * @Description: 任务执行获取 token
     * @param
     * @author dapengniao
     * @date 2016 年 3 月 10 日 下午 4:34:26
     */
    public void workForToken() {
        try {
            WeChatTask timer = new WeChatTask();
            timer.getToken_getTicket();
        } catch (Exception e) {
            logger.error(e, e);
        }
    }

}
