package com.wechat.message.req;

import com.wechat.message.req.BaseMessage;

/**
 * ClassName: ImageMessage
 * @Description: 图片消息
 * @author dapengniao
 * @date 2016 年 3 月 7 日 下午 3:04:52
 */
public class ImageMessage extends BaseMessage {
    // 图片链接
    private String PicUrl;

    public String getPicUrl() {
        return PicUrl;
    }

    public void setPicUrl(String picUrl) {
        PicUrl = picUrl;
    }
}