package com.wechat.message.resp;

import com.wechat.message.resp.BaseMessage;

/**
 * ClassName: MusicMessage
 * @Description: 音乐消息
 * @author dapengniao
 * @date 2016 年 3 月 7 日 下午 3:53:38
 */
public class MusicMessage extends BaseMessage {
    // 音乐   
    private Music Music;

    public Music getMusic() {
        return Music;
    }

    public void setMusic(Music music) {
        Music = music;
    }
}