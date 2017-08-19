<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="utf-8"/>
<meta name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
<link href="css/bootstrap-combined.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap-datetimepicker.min.css">

<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/js/bootstrap-paginator.min.js"></script>

<form method="post" class="form-horizontal" action="" role="form"
      id="createForm" style="margin: 20px;">

    <fieldset>
        <div id="legend" class="">
            <legend class="">招聘信息</legend>
        </div>
        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">公司名称</label>
            <div class="controls">
                <input type="text" placeholder="placeholder" class="input-xlarge" name="companyName">
                <p class="help-block">Supporting help text</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">招聘岗位</label>
            <div class="controls">
                <input type="text" placeholder="placeholder" class="input-xlarge">
                <p class="help-block">Supporting help text</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">投递链接</label>
            <div class="controls">
                <input type="text" placeholder="placeholder" class="input-xlarge">
                <p class="help-block">Supporting help text</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">是否内推</label>
            <div class="controls">
                <input type="text" placeholder="placeholder" class="input-xlarge">
                <p class="help-block">Supporting help text</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label">内推码</label>
            <div class="controls">
                <input type="text" placeholder="" class="input-xlarge">
                <p class="help-block">Supporting help text</p>
            </div>
        </div>


        <div id="datetimepicker" class="input-append date">
            <!-- Text input-->
            <label class="control-label">截止日期</label>
            <div class="controls">
                <input type="text" name="time" id="time" placeholder="yyyy/mm/dd" class="input-xlarge"/>
                <span class="add-on">
                    <i class="glyphicon glyphicon-calendar" data-time-icon="icon-time"
                       data-date-icon="icon-calendar"></i>
                </span>
                <p class="help-block">截止日期需大于当前日期</p>
            </div>
        </div>

        <div class="control-group">
            <label class="control-label">填好了</label>

            <!-- Button -->
            <div class="controls">
                <button class="btn btn-success">提交</button>
            </div>
        </div>

    </fieldset>
</form>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
    $('#datetimepicker').datetimepicker({
        format: 'MM/dd/yyyy',
        language: 'en',
        pickDate: true,
        pickTime: false,
        hourStep: 1,
        minuteStep: 15,
        secondStep: 30,
        inputMask: true,
        startDate: new Date()
    });

    function validateForm()
    {
        var x=document.forms["myForm"]["companyName"].value;
        alert("here");
        if (x==null || x=="")
        {
            alert("姓必须填写");
            return false;
        }
    }
</script>
<html>

<%--
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="utf-8"/>
<meta name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.formance.min.js"></script>
    <script>
        $( function() {
            $('input.dd_mm_yyyy').formance('format_dd_mm_yyyy');
                .on( 'keyup change blur', function (event) { // setup the event listeners to validate the field whenever the user takes an action
                    if ( $(this).formance('validate_dd_mm_yyyy') )
                        $("input[type='submit']").prop("disabled", false); // enable the submit button if valid phone number
                    else
                        $("input[type='submit']").prop("disabled", true); // disable the submit button if invalid phone number
                });
        });
    </script>
</head>
<body>
<form >
    <label>Phone Number (US & Canada)</label>
    <input type="text" class="phone_number">
    <input type="submit">
</form>
<form >
    <label>Date (dd_mm_yyyy)</label>
    <input type="text" class="dd_mm_yyyy">
    <input type="submit">
</form>

<form class="form-horizontal">
    <fieldset>
        <div id="legend" class="">
            <legend class="">表单名</legend>
        </div>
        <div class="control-group">

            <!-- Text input-->
            <label class="control-label" >公司名称</label>
            <div class="controls">
                <input type="text" placeholder="placeholder" class="input-xlarge">
                <p class="help-block">Supporting help text</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label" >招聘岗位</label>
            <div class="controls">
                <input type="text" placeholder="placeholder" class="input-xlarge">
                <p class="help-block">Supporting help text</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label" >投递链接</label>
            <div class="controls">
                <input type="text" placeholder="placeholder" class="input-xlarge">
                <p class="help-block">Supporting help text</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label" >是否内推</label>
            <div class="controls">
                <input type="text" placeholder="placeholder" class="input-xlarge">
                <p class="help-block">Supporting help text</p>
            </div>
        </div>

        <div class="control-group">

            <!-- Text input-->
            <label class="control-label" >内推码</label>
            <div class="controls">
                <input type="text" placeholder="" class="input-xlarge">
                <p class="help-block">Supporting help text</p>
            </div>
        </div>

    </fieldset>
</form>
</body>
</html>--%>
