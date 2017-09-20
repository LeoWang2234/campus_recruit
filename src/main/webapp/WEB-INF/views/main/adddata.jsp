<%--
  Created by IntelliJ IDEA.
  User: cheng
  Date: 2017/9/16
  Time: 下午8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 添加模态框 -->
<form method="post" class="form-horizontal" action="" role="form"
      id="createForm" style="margin: 20px;">
    <div class="modal fade" id="createEquipment" tabindex="-1"
         role="dialog" aria-labelledby="createModalLabel" aria-hidden="true"
         data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title" id="crdateModalLabel">添加招聘</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="crName" class="col-md-4 control-label">公司名称</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="crName" name="name"
                                   placeholder="请输入公司名称">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="positioin" class="col-md-4 control-label">招聘岗位</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="produceName"
                                   value="" id="positioin" placeholder="请输入招聘岗位">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="link" class="col-md-4 control-label">投递链接</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="no" id="link"
                                   placeholder="请输入投递链接">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="push" class="col-md-4 control-label">备注信息</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="no" id="push"
                                   placeholder="供填写内推码或者其他备注信息">
                        </div>
                    </div>
                    <div id="datetimepicker_add" class="form-group">
                        <!-- Text input-->
                        <label for="dead_line" class="col-md-4 control-label">截止日期</label>
                        <div class="col-md-6">
                            <input type="text" name="time" class="form-control" id="dead_line" placeholder="点击下方小日历选择日期"
                                   class="input-xlarge"/>
                            <span class="add-on">
                                <i class="glyphicon glyphicon-calendar" data-time-icon="icon-time"
                                   data-date-icon="icon-calendar"></i>
                            </span>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="token" value="${token}">

                <div class="modal-footer" style="text-align:center">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                    </button>
                    <button type="submit" class="btn btn-primary">添加</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

</form>


</body>
</html>
