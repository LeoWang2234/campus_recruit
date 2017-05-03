<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>

<title>设备管理系统登录</title>
<style>
.logon_title{
color: rgb(22, 87, 115);
background-color: transparent;
height: auto;
font-size:24px;
margin: 10px auto 0 auto;
width:992px;
}

.errorMsg{
	margin-left:20px;
}
</style>

</head>

<body>
    <div class="login_logo">
        <img src="${pageContext.request.contextPath}/images/logo_hand_180.jpg"/>
    </div>
     <div  class="logon_title"><h3>设备管理系统</h3></div>
    <div class="login_container">
        <div class="login_inb">
      
            <div class="login_left_img">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="4000">
                <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="${pageContext.request.contextPath}/images/login_2.jpg">
                            <div class="carousel-caption">
                            </div>
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/login_1.jpg">
                            <div class="carousel-caption">
                            </div>
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/new2.jpg">
                            <div class="carousel-caption">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="login-box">
                <h3 class="login_welcome">欢迎登录</h3>
                <div class="right_login" style="border:none;z-index: 9999">
                    <div>
                        <form  id="login_form"  action="<c:url value="/user/login" />" method="post">
                            <div>
                                <div class="login-item">
                                    <span class="span_user glyphicon glyphicon-user "></span>
                                    <input type="text"  class="form-input" id="user" maxlength="21" placeholder="用户名" name="userName" value="">
                                </div>
                            </div>
                            <div>
                                <div class="login-item">
                                    <span class="span_user glyphicon glyphicon-lock"></span>
                                    <input type="password" class="form-input" id="password" maxlength="18"  placeholder="密码" name="password" value="">
                                </div>
                            </div>

                            <input type="submit" class="formBtn-login" value="登 录" />
                        </form>
                    </div>
                    <div class="clear"></div>
                    <div class="errorMsg">
                        <c:if test="${loginMsg !=null}">
                        <center>
                        	<div class="ts"><img src="${pageContext.request.contextPath}/images/ts.png" > ${loginMsg}</div>
                        </center>
                        </c:if>
                        <!-- <div class="forgotpassword">
                             <a href="#" onclick="link()">忘记密码？</a>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<div class="login_bottom">--%>
        <%--<span class="bottom_info">Copyright©2005-2016 360.CN All Rights Reserved 360安全中心 京ICP证080047号 京公网安备110000000006号</span>--%>
    <%--</div>--%>
</body>
   
</html>

