package com.wechat.message.resp;

/**
 * ClassName: Video
 * @Description: 视频消息体
 * @author dapengniao
 * @date 2016 年 3 月 8 日 下午 6:05:45
 */
public class Video {

    private String MediaId;
    private String Title;
    private String Description;

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

    public String getMediaId() {
        return MediaId;
    }

    public void setMediaId(String mediaId) {
        MediaId = mediaId;
    }

}