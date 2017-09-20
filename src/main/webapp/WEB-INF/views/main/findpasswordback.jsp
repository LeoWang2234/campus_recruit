<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>找回密码</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dmaku.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>

<div class="wrap flex-c-c">
    <form action="${pageContext.request.contextPath}/user/createUser/2" method="post" class="flex-c-c" id="myform"
          onsubmit="return dosubmit()">
        <ul class="select__list">
            <li id="js-usr-rtn" class="select__label">Where's My Psw</li>
            <%--<li id="js-usr-new" class="select__label select__label--active">Sign up</li>--%>
            <%--<li id="js-usr-rst" class="select__label">Forget PassWord</li>--%>
        </ul>
        <span class="pointer"></span>
        <input type="email" placeholder="Email Address" class="ui-field" id="js-field__email" name="userName"/>
        <input type="password" placeholder="New Password" class="ui-field" id="js-field__pass" name="password" />
        <input type="password" placeholder="Confirm New Password" class="ui-field" id="js-field__r-pass" />
        <button id="js-btn" class="ui-button" onclick="return signup()">重置密码</button>
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
    function signup(){
        var userName = $("#js-field__email").val();
        var password = $("#js-field__pass").val();
        var password2 = $("#js-field__r-pass").val();
        if (!userName || !password ||!password2){
            alert("无效的输入");
            return false;
        }else if(password2 != password){
            alert("两次输入密码不一致")
            return false;
        }else {
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

