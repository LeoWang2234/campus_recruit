package com.wechat.dispatcher;

import com.ecust.dto.CompanyForm;
import com.ecust.pojo.Company;
import com.ecust.pojo.MyCopyMessage;
import com.ecust.service.EquipmentService;
import com.ecust.service.MyCopyService;
import com.ecust.service.impl.EquipmentServiceImpl;
import com.ecust.utils.DataTrans;
import com.ecust.utils.PropertyUtils;
import com.wechat.wechatinput.InputData;
import com.wechat.wechatinput.SessionData;
import com.wechat.utils.MessageUtil;
import com.wechat.message.resp.Article;
import com.wechat.message.resp.NewsMessage;
import com.wechat.message.resp.TextMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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


    private static String userId;

    static EquipmentService equipmentService;
    static MyCopyService myCopyService;

    @Autowired
    public void setEquipmentService(EquipmentService equipmentService){
        MsgDispatcher.equipmentService = equipmentService;
    }

    @Autowired
    public void setMyCopyService(MyCopyService myCopyService){
        MsgDispatcher.myCopyService = myCopyService;
    }




    private static Timer timer = new Timer();

    public static String processMessage(final Map<String, String> map) {


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

            // 先找到对应 userId ,方便向数据库中插入 ，先判断用户有没有权限
            userId = setUserId(map.get("FromUserName"));
            if (userId == null) {
                txtmsg.setContent("您暂时还没有权限使用添加功能");
                return MessageUtil.textMessageToXml(txtmsg);
            }


            // 用户的正常逻辑处理
            if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) { // 文本消息

                InputData inputData = session.get(openid);
                if (map.get("Content").trim().equals("添加") || inputData != null) { // 添加逻辑
                    if (inputData == null) {

                        // 定时器，用户操作时间 1 分钟，则视为放弃了操作
                        TimerTask task = new TimerTask() {
                            public void run() {
                                session.remove(openid);
                            }
                        };
                        timer.schedule(task, 1000 * 60);
                        inputData = new InputData();
                        inputData.setVisitTime(1);
                        session.put(openid, inputData);
                        txtmsg.setContent("请输入公司姓名:");
                    } else if (inputData.getVisitTime() == 1) {
                        Map result = equipmentService.queryEquipmentByName(map.get("Content"));
                        if (result != null) {
                            txtmsg.setContent("该公司的招聘信息已经存在,不要重复添加");
                            session.remove(openid);
                            return MessageUtil.textMessageToXml(txtmsg);
                        }
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
                        txtmsg.setContent("您已经添加完成,添加信息为\n公司名称：" +
                                "" + inputData.getCompanyForm().getName() + "\n职位：" +
                                "" + inputData.getCompanyForm().getPosition() + "\n链接:" +
                                "" + inputData.getCompanyForm().getLink() + "");
                        new Thread() {
                            @Override
                            public void run(){
                                Company company = DataTrans.toCompany(session.get(openid).getCompanyForm());
                                company.setCreatedUser(userId);
                                Boolean bool = equipmentService.createEquipment(company);
                                session.remove(openid);
                            }
                        }.start();
                    } else {
                        session.remove(openid);
                    }
                } else {
                    new Thread() {
                        @Override
                        public void run(){
                            MyCopyMessage myCopyMessage = new MyCopyMessage();
                            myCopyMessage.setUserId(userId);
                            myCopyMessage.setMessage(map.get("Content"));
                            myCopyService.setText(myCopyMessage);
                        }
                    }.start();
                    txtmsg.setContent("消息已到粘贴板");
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

    private static String setUserId(String ToUserName) {
        return PropertyUtils.getProperty(ToUserName,"/wechat.properties");
    }
}
