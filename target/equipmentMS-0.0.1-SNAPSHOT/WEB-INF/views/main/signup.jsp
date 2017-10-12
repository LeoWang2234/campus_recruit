<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>本页面仅提供注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dmaku.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>

<div class="wrap flex-c-c">
    <form action="${pageContext.request.contextPath}/user/createUser/1" method="post" class="flex-c-c" id="myform"
              onsubmit="return dosubmit()">
        <ul class="select__list">
            <li id="js-usr-rtn" class="select__label">注册新用户</li>
            <%--<li id="js-usr-new" class="select__label select__label--active">Sign up</li>--%>
            <%--<li id="js-usr-rst" class="select__label">Forget PassWord</li>--%>
        </ul>
        <span class="pointer"></span>
        <input type="hidden" name="token" value="${token}">
        <input type="email" placeholder="邮箱地址" class="ui-field" id="js-field__email" name="userName"/>
        <input type="password" placeholder="密码" class="ui-field" id="js-field__pass" name="password"/>
        <input type="password" placeholder="确认密码" class="ui-field" id="js-field__r-pass"/>
        <button id="js-btn" class="ui-button --usr-new" onclick="return signup()"></button>
    </form>
</div>

<script>
    //to-do. dry-up & remove jq
    //    $('.select__label').click(function() {
    //        $('.select__label').removeClass('select__label--active');
    //        $(this).addClass('select__label--active');
    //    });
    //
    //    $('#js-usr-rtn').click(function() {
    //        $('#js-btn, .pointer, #js-field__pass').removeClass('--usr-new --usr-rst ui-field--hidden');
    //        $('#js-btn, .pointer').addClass('--usr-rtn');
    //        $('#js-field__r-pass').addClass('ui-field--hidden');
    //    });
    //    $('#js-usr-new').click(function() {
    //        $('#js-btn, .pointer, #js-field__r-pass, #js-field__pass').removeClass('--usr-rtn --usr-rst ui-field--hidden');
    //        $('#js-btn').addClass('--usr-new');
    //    });
    //    $('#js-usr-rst').click(function() {
    //        $('#js-btn, .pointer').removeClass('--usr-rtn --usr-new');
    //        $('#js-btn, .pointer').addClass('--usr-rst');
    //        $('#js-field__r-pass, #js-field__pass').addClass('ui-field--hidden');
    //    });
    function signup() {
        var userName = $("#js-field__email").val();
        var password = $("#js-field__pass").val();
        var password2 = $("#js-field__r-pass").val();
        if (!userName || !password || !password2) {
            alert("无效的输入");
            return false;
        } else if (password2 != password) {
            alert("两次密码不一致")
            return false;
        } else {
//            document.getElementById("myform").submit();
        }
    }

    var isCommitted = false;//表单是否已经提交标识，默认为false
    function dosubmit() {
        if (isCommitted == false) {
            isCommitted = true;//提交表单后，将表单是否已经提交标识设置为true
            return true;//返回true让表单正常提交
        } else {
            return false;//返回false那么表单将不提交
        }
    }

</script>
</body>
</html>

