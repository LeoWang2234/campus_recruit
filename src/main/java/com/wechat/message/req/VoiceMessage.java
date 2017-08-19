package com.wechat.message.req;

import com.wechat.message.req.BaseMessage;

/**
 * ClassName: VoiceMessage
 * @Description: 语音消息
 * @author dapengniao
 * @date 2016 年 3 月 7 日 下午 3:07:10
 */
public class VoiceMessage extends BaseMessage {
    // 媒体 ID   
    private String MediaId;
    // 语音格式   
    private String Format;

    public String getMediaId() {
        return MediaId;
    }

    public void setMediaId(String mediaId) {
        MediaId = mediaId;
    }

    public String getFormat() {
        return Format;
    }

    public void setFormat(String format) {
        Format = format;
    }
}