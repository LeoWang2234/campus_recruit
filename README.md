# campus_recruit
校园招聘信息管理系统

在原系统设备管理的基础上进行改进

主要功能是实现：
不用用户之间招聘信息的共享
每个用户管理自己的招聘信息
每个用户可以添加招聘信息

展示链接：

http://23.106.142.89/recruit

常用操作命令：

登录 
 
ssh -p 28594 root@23.106.142.89

上传文件：

scp -P 28594 -r /Users/cheng/Desktop/projects/campus_recruit/dx/target/equipmentMS-0.0.1-SNAPSHOT.war root@23.106.142.89:/opt/tomcat/apache-tomcat-8.5.20/webapps

scp -P 28594 -r /Users/cheng/Desktop/projects/campus_recruit/dx/target/recruit.war root@23.106.142.89:/opt/tomcat/apache-tomcat-8.5.20/webappsx

scp -P 28594 -r /Users/cheng/Desktop/db_equipment_2017-08-21.sql root@23.106.142.89:/root/data_for_web/user_company_2017-08-21.sql

scp -P 28594 -r /Users/cheng/Desktop/apache-tomcat-8.5.20.tar.gz root@23.106.142.89:/root/apache-tomcat-8.5.20.tar.gz

apache-tomcat-8.5.20.tar.gz

systemctl start tomcat8


本地的 tomcat 目录：
/usr/local/Cellar/tomcat/8.5.15/libexec/webapps


/root/webapp/equipmentMS-0.0.1-SNAPSHOT


mysql.server start 

mysql相关操作命令:
http://blog.fens.me/linux-mysql-install/

服务器 tomcat 目录
/opt/apache-tomcat-8.5.20/bin

查看当前目录下所有文件及大小：
du -h -d 1


