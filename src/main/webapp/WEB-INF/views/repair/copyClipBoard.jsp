<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="utf-8"/>
<meta name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>

<%--<script type="text/javascript" charset="utf-8"--%>
<%--src="${pageContext.request.contextPath}/js/clipboard.js"></script>--%>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/js/clipboard.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<head>
    <title>我的剪切版</title>
</head>

<body>

<form id="textForm" action="" method="post">
    <div>
        <textarea name="message" placeholder="请输入您要拷贝的内容，并点击 submit  提交。。。" id="MSG" cols=130 rows=25 ></textarea>
        <br>
    </div>

<%--<!-- Target -->--%>
<%--<textarea id="bar">Mussum ipsum cacilds...</textarea>--%>

<!-- Trigger -->
<div>
    <button class="btn" id="setText" type="submit">
        提交
    </button>
    <button class="btn" id="getText" type="button">
        刷新
    </button>
    <button class="btn" data-clipboard-action="cut" data-clipboard-target="#MSG" type="button">
        剪切
    </button>
    <button class="btn" id="clear" type="button" type="button">
        清空
    </button>
</div>
</form>

</body>
</html>
<script type="text/javascript">
    $(function () {
        new Clipboard('.btn');

    });
    $("#textForm")
        .submit(
            function (e) {
                var message = $.trim($("#MSG").val());
                if (!message) {
                    alert("填写内容为空！");
                    return false;
                }
                $
                    .ajax({
                        url: "${pageContext.request.contextPath}/copy/setText",
                        type: "post",
                        contentType: "application/json",
                        data: JSON.stringify({
                            message: message
                        }),
                        success: function (data) {
                            if (data == true) {
                                alert("提交成功!");
                            } else {
                                alert("提交失败");
                            }

                        },
                        error: function () {
                            alert("提交出错!");
                        }

                    });
                e.preventDefault();
            });
    $('#getText').click(function(){
        $
            .ajax({
                url: "${pageContext.request.contextPath}/copy/getText",
                type: "get",
                success: function (data) {
                    $("#MSG").val(data.message)
                }
            });
    });
    $('#clear').click(function(){
        $("#MSG").val("");
    });


</script>