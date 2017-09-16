<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>本页面仅提供注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dmaku.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>

<div class="wrap flex-c-c">
    <form action="${pageContext.request.contextPath}/user/createUser" method="post" class="flex-c-c" id="myform">
        <ul class="select__list">
            <li id="js-usr-rtn" class="select__label">Sign Up</li>
            <%--<li id="js-usr-new" class="select__label select__label--active">Sign up</li>--%>
            <%--<li id="js-usr-rst" class="select__label">Forget PassWord</li>--%>
        </ul>
        <span class="pointer"></span>
        <input type="email" placeholder="Email Address" class="ui-field" id="js-field__email" name="userName"/>
        <input type="password" placeholder="Password" class="ui-field" id="js-field__pass" name="password" />
        <input type="password" placeholder="Confirm Password" class="ui-field" id="js-field__r-pass" />
        <button id="js-btn" class="ui-button --usr-new" onclick="return signup()"></button>
    </form>
</div>

<script>
    //to-do. dry-up & remove jq
    $('.select__label').click(function() {
        $('.select__label').removeClass('select__label--active');
        $(this).addClass('select__label--active');
    });

    $('#js-usr-rtn').click(function() {
        $('#js-btn, .pointer, #js-field__pass').removeClass('--usr-new --usr-rst ui-field--hidden');
        $('#js-btn, .pointer').addClass('--usr-rtn');
        $('#js-field__r-pass').addClass('ui-field--hidden');
    });
    $('#js-usr-new').click(function() {
        $('#js-btn, .pointer, #js-field__r-pass, #js-field__pass').removeClass('--usr-rtn --usr-rst ui-field--hidden');
        $('#js-btn').addClass('--usr-new');
    });
    $('#js-usr-rst').click(function() {
        $('#js-btn, .pointer').removeClass('--usr-rtn --usr-new');
        $('#js-btn, .pointer').addClass('--usr-rst');
        $('#js-field__r-pass, #js-field__pass').addClass('ui-field--hidden');
    });
    function signup(){
        var userName = $("#js-field__email").val();
        var password = $("#js-field__pass").val();
        var password2 = $("#js-field__r-pass").val();
        if (!userName || !password ||!password2){
            alert("Invalid Input");
            return false;
        }else if(password2 != password){
            alert("password should be same")
            return false;
        }else {
//            document.getElementById("myform").submit();
        }
    }

</script>
</body>
</html>

