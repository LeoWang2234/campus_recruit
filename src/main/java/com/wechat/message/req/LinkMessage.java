package com.wechat.message.req;

import com.wechat.message.req.BaseMessage;

/**
 * ClassName: LinkMessage
 * @Description: 连接消息
 * @author dapengniao
 * @date 2016 年 3 月 7 日 下午 3:05:48
 */
public class LinkMessage extends BaseMessage {
    // 消息标题
    private String Title;
    // 消息描述
    private String Description;
    // 消息链接
    private String Url;

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getUrl() {
        return Url;
    }

    public void setUrl(String url) {
        Url = url;
    }
}