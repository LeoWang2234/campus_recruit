<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cheng
  Date: 2017/9/19
  Time: 下午1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>登录超时</title>
    <!-- Custom Theme files -->
    <%--<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"  media="all"/>
    <!-- Custom Theme files -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <!--Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <!--Google Fonts-->
</head>
<body>
<!--login form start here-->
<h1>登录超时，请重新登录</h1>
<div class="login">
    <div class="rib"> </div>
    <form  id="login_timeout"  action="<c:url value="/user/login" />" method="post">
        <input id="user" type="text" value="Email Address" name="userName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}">
        <input id="password" type="password" value="password" name="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}">
        <input type="submit" value="SIGN IN" >
    </form>
</div>
<div class="copyright">
    <p> <a href="#">做自己的网站，让别人羡慕去吧</a></p>
</div>
<!--login form end here-->
</body>


</html>
