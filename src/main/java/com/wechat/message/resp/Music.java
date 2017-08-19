package com.wechat.message.resp;

/**
 * ClassName: Music
 * @Description: 音乐消息消息体
 * @author dapengniao
 * @date 2016 年 3 月 7 日 下午 3:54:00
 */
public class Music {
    // 音乐名称   
    private String Title;
    // 音乐描述   
    private String Description;
    // 音乐链接   
    private String MusicUrl;
    // 高质量音乐链接，WIFI 环境优先使用该链接播放音乐   
    private String HQMusicUrl;

    private String ThumbMediaId; //缩略图的媒体 id

    public String getThumbMediaId() {
        return ThumbMediaId;
    }

    public void setThumbMediaId(String thumbMediaId) {
        ThumbMediaId = thumbMediaId;
    }

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

    public String getMusicUrl() {
        return MusicUrl;
    }

    public void setMusicUrl(String musicUrl) {
        MusicUrl = musicUrl;
    }

    public String getHQMusicUrl() {
        return HQMusicUrl;
    }

    public void setHQMusicUrl(String musicUrl) {
        HQMusicUrl = musicUrl;
    }

}