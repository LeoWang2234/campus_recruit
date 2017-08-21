package com.wechat.dispatcher;

import com.ecust.dto.CompanyForm;
import com.ecust.pojo.Company;
import com.ecust.service.EquipmentService;
import com.ecust.service.impl.EquipmentServiceImpl;
import com.ecust.utils.DataTrans;
import com.wechat.wechatinput.InputData;
import com.wechat.wechatinput.SessionData;
import com.wechat.utils.MessageUtil;
import com.wechat.message.resp.Article;
import com.wechat.message.resp.NewsMessage;
import com.wechat.message.resp.TextMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import java.util.*;

/**
 * ClassName: MsgDispatcher
 *
 * @author dapengniao
 * @Description: 消息业务处理分发器
 * @date 2016 年 3 月 7 日 下午 4:04:21
 */
@Component
public class MsgDispatcher {

    static EquipmentService equipmentService;

    @Autowired
    public void setSomeThing(EquipmentService equipmentService){
        MsgDispatcher.equipmentService = equipmentService;
    }

    private static Timer timer = new Timer();

    public static String processMessage(Map<String, String> map) {
        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) { // 文本消息
            final String openid = map.get("FromUserName"); //用户 openid
            String mpid = map.get("ToUserName");   //公众号原始 ID

            final Map<String, InputData> session = SessionData.getSessionData();

            TextMessage txtmsg = new TextMessage();
            txtmsg.setToUserName(openid);
            txtmsg.setFromUserName(mpid);
            txtmsg.setCreateTime(new Date().getTime());
            txtmsg.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
            System.out.println(map.get("Content").trim());
            System.out.println(map.get("Content"));
            if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) { // 文本消息

                InputData inputData = session.get(openid);
                if (map.get("Content").trim().equals("添加") || inputData != null) { // 添加逻辑
                    if (inputData == null) {

                        // 定时器，用户操作时间 30 秒，则视为放弃了操作
                        TimerTask task = new TimerTask() {
                            public void run() {
                                session.remove(openid);
                            }
                        };
                        timer.schedule(task, 1000 * 30);
                        inputData = new InputData();
                        inputData.setVisitTime(1);
                        session.put(openid, inputData);
                        txtmsg.setContent("请输入公司姓名:");
                    } else if (inputData.getVisitTime() == 1) {
                        inputData.setVisitTime(2);
                        txtmsg.setContent("请输入招聘岗位:");
                        inputData.getCompanyForm().setName(map.get("Content"));
                    } else if (inputData.getVisitTime() == 2) {
                        inputData.setVisitTime(3);
                        txtmsg.setContent("请输入投递链接:");
                        inputData.getCompanyForm().setPosition(map.get("Content"));
                    } else if (inputData.getVisitTime() == 3) {
                        inputData.setVisitTime(1);
                        inputData.getCompanyForm().setLink(map.get("Content"));
                        txtmsg.setContent("您已经添加完成");
                        session.remove(openid);

                        new Thread() {
                            @Override
                            public void run(){
                                Company company = DataTrans.toCompany(session.get(openid).getCompanyForm());
                                Boolean bool = equipmentService.createEquipment(company);
                            }
                        }.start();
                    } else {
                        session.remove(openid);
                        txtmsg.setContent("添加招聘请回复\"添加\"");
                    }
                } else {
                    txtmsg.setContent("添加招聘请回复\"添加\""); // 不添加逻辑
                }
                return MessageUtil.textMessageToXml(txtmsg);
            }
        }

        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) { // 图片消息
            String openid = map.get("FromUserName"); //用户 openid
            String mpid = map.get("ToUserName");   //公众号原始 ID
            //对图文消息
            NewsMessage newmsg = new NewsMessage();
            newmsg.setToUserName(openid);
            newmsg.setFromUserName(mpid);
            newmsg.setCreateTime(new Date().getTime());
            newmsg.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);

            if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) { // 图片消息
                System.out.println("==============这是图片消息！");
                Article article = new Article();
                article.setDescription("这是图文消息 1"); //图文消息的描述
                article.setPicUrl("http://res.cuiyongzhi.com/2016/03/201603086749_6850.png"); //图文消息图片地址
                article.setTitle("图文消息 1");  //图文消息标题
                article.setUrl("http://www.cuiyongzhi.com");  //图文 url 链接
                List<Article> list = new ArrayList<Article>();
                list.add(article);     //这里发送的是单图文，如果需要发送多图文则在这里 list 中加入多个 Article 即可！
                newmsg.setArticleCount(list.size());
                newmsg.setArticles(list);
                return MessageUtil.newsMessageToXml(newmsg);
            }
        }

        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) { // 链接消息
            System.out.println("==============这是链接消息！");
        }

        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) { // 位置消息
            System.out.println("==============这是位置消息！");
        }

        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) { // 语音消息
            System.out.println("==============这是语音消息！");
        }

        return null;
    }
}
