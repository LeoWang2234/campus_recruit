<%--
  Created by IntelliJ IDEA.
  User: cheng
  Date: 2017/9/16
  Time: 下午8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 更新模态框 -->
<form method="post" class="form-horizontal" action="" role="form"
      id="updateForm" style="margin: 20px;">
    <div class="modal fade" id="updateEquipment" tabindex="-1"
         role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true"
         data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <input type="text" name="equipmentId" id="upEquipmentId"
                       style="display: none"/>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title" id="updateModalLabel">信息修改</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="upName" class="col-md-4 control-label">公司名称</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="upName" name="name"
                                   placeholder="公司名称">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="upProduceName" class="col-md-4 control-label">招聘岗位</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="produceName"
                                   value="" id="upProduceName" placeholder="招聘岗位">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="upLink" class="col-md-4 control-label">投递链接</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="no" id="upLink"
                                   placeholder="请输入投递链接">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="upBeizhu" class="col-md-4 control-label">备注信息</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="beizhu" id="upBeizhu"
                                   placeholder="请输入备注信息">
                        </div>
                    </div>
                    <div id="datetimepicker" class="form-group">
                        <!-- Text input-->
                        <label for="updDeadline" class="col-md-4 control-label">截止日期</label>
                        <div class="col-md-6">
                            <input type="text" name="time" class="form-control" id="updDeadline" placeholder="点击下方小日历选择日期"
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
                    <button type="submit" class="btn btn-primary">修改</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
</form>

</body>
</html>
