<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="utf-8"/>
<meta name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>

<%-- <link type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-pagination.min.css"
	rel="stylesheet" /> --%>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/js/bootstrap-paginator.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hiddenoverflow.css">
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/js/bootstrap-paginator.min.js"></script>

<div class="row search">
    <div class="col-md-6">
        <form action="" method="post">
            <div class="input-group" style="width: 300px">
                <input type="text" class="form-control" id="queryName"
                       placeholder="请输入公司名称..."> <span class="input-group-btn">
					<button class="btn btn-default" onclick="return queryEquipment()">
						<span class="glyphicon glyphicon-search"></span>&nbsp;查询
					</button>
				</span>
            </div>
        </form>
    </div>
    <div class="col-md-2 alert alert-success alert-dismissable text-center" id="total"
         style="margin-bottom:10px;"></div>
    <div class="col-md-4">
    </div>
</div>
<p><font face="verdana" size="3">下列是所有<font color="#ff4500">新增</font>公司：</font></p>
<div>
    <table class="table table-hover  table-bordered table-striped"
           style="margin-bottom: 0px;">
        <thead>
        <tr>
            <th class="col-md-0.5">序号</th>
            <th class="col-md-1.5">公司名称</th>
            <th class="col-md-1">招聘岗位</th>
            <th class="col-md-2">投递链接</th>
            <th class="col-md-1.3">截止时间</th>
            <th class="col-md-1.2">备注</th>
            <th class="col-md-1">状态</th>
            <th class="col-md-1.5">操作</th>
        </tr>
        </thead>
        <tbody id="equList"></tbody>
    </table>
</div>
<div id="pagination">
    <div class="col-md-5 col-md-offset-3">
        <ul class="pagination"></ul>
    </div>


    <div class="btn-group col-md-3" style="margin-top:20px">
        <button type="button" class="btn btn-default" value="10" onclick="changePageSize(this)">10</button>
        <button type="button" class="btn btn-default" value="20" onclick="changePageSize(this)">20</button>
        <button type="button" class="btn btn-default" value="50" onclick="changePageSize(this)">50</button>
        <button type="button" class="btn btn-default" value="100" onclick="changePageSize(this)">100</button>
    </div>
    <input type="text" id="currentPage" style="display:none" value="1"></input>
    <input type="text" id="pageSize" style="display:none" value="5"></input>
</div>
<!-- 更新模态框 -->
<form method="post" class="form-horizontal" action="" role="form"
      id="updateForm" style="margin: 20px;">
    <div class="modal fade" id="updateEquipment" tabindex="-1"
         role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true"
         data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <input type="text" name="equipmentId" id="upEquipmentId"
                       style="display:none"/>
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
                        <label for="link" class="col-md-4 control-label">投递链接</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="no" id="link"
                                   placeholder="请输入投递链接">
                        </div>
                    </div>
                    <div id="datetimepicker" class="form-group">
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
                    <h4 class="modal-title" id="crdateModalLabel">添加设备</h4>
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
                        <label for="crProduceName" class="col-md-4 control-label">招聘岗位</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="produceName"
                                   value="" id="crProduceName" placeholder="请输入招聘岗位">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="crNo" class="col-md-4 control-label">设备编号</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="no" id="crNo"
                                   placeholder="请输入设备编号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="crTypeId" class="col-md-4 control-label">部门</label>
                        <div class="col-md-6">
                            <select class="form-control" id="crTypeId">
                                <option value="none">请选择设备类型</option>
                            </select>
                        </div>
                    </div>
                </div>
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

<script type="text/javascript">
    $(function () {
        pagehtml($("#currentPage").val());

    });

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
    //删除设备
    function notInterested(equipmentId) {

        if (!equipmentId) {
            alert('Error！');
            return false;
        }
        var result = confirm("确定不感兴趣么？");
        if (result) {

        } else {
            return false;
        }
        $
            .ajax({
                url: "${pageContext.request.contextPath}/equipment/notInterested/"
                + equipmentId,
                type: "get",
                success: function (data) {
                    if (data == true) {
                        alert("设置成功！");
                        pagehtml($("#currentPage").val());
                    } else {
                        alert("设置失败！");
                    }
                },
                error: function () {
                    alert("设置出错");
                },
            });
    }

    //获取要修改的设备
    function getEquipmentById(equipmentId) {

        if (!equipmentId) {
            alert('Error！');
            return false;
        }
        $
            .ajax({
                url: "${pageContext.request.contextPath}/equipment/queryEquipmentById",
                data: {
                    "equipmentId": equipmentId
                },
                type: "get",
                success: function (data) {
                    $("#upName").val(data.name);
                    $("#upProduceName").val(data.position);
                    $("#link").val(data.link);
                    $("#dead_line").val(data.deadline);
                    $("#upEquipmentId").val(data.id);
                },
                error: function () {
                    alert("请求出错");
                },
            });
        return false;
    }

    //添加设备
    $("#createForm")
        .submit(
            function (e) {
                var name = $.trim($("#crName").val());
                var no = $.trim($("#crNo").val());
                var produceName = $.trim($("#crProduceName").val());
                var typeId = $.trim($("#crTypeId").val());
                if (!name || !produceName || !no) {
                    alert("不能有空值！");
                    return false;
                }
                $
                    .ajax({
                        url: "${pageContext.request.contextPath}/equipment/createEquipment",
                        type: "post",
                        contentType: "application/json",
                        data: JSON.stringify({
                            name: name,
                            produceName: produceName,
                            no: no,
                            typeId: typeId
                        }),
                        success: function (data) {
                            if (data == true) {
                                $("#createEquipment").modal('hide');
                                alert("添加成功!");
                                pagehtml($("#currentPage").val());
                            } else {
                                alert("添加失败！");
                            }

                        },
                        error: function () {
                            alert("添加出错!");
                        }

                    });
                e.preventDefault();
            });

    //分页
    function pagehtml(pageNo) {
        $
            .ajax({
                url: "${pageContext.request.contextPath}/equipment/queryAllEquipment",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify({
                    pageNo: pageNo,
                    pageSize: $("#pageSize").val(),
                    name: $.trim($("#queryName").val()),
                    applied:2
                }),
                success: function (data) {
                    $("#total").html("当前共有" + data.page.totalElements + "家公司");
                    var options = {
                        alignment: "center",//居中显示
                        currentPage: data.page.pageNo,//当前页数
                        totalPages: data.page.totalPages,//总页数
                        bootstrapMajorVersion: 3,
                        onPageClicked: function (event, originalEvent,
                                                 type, page) {
                            $("#currentPage").val(page);
                            pagehtml(page);
                        }
                    };
                    $("#equList").empty();
                    if (data.data == "") {
                        $("#equList").html("<div  id='emptyAlert' class='alert alert-danger'>" +
                            "<a href='#' class='close' data-dismiss='alert'>&times;</a>" +
                            "<strong>失败！</strong>未查到您搜索的信息。</div>");
                        $("#pagination").hide();
                        return false;
                    } else {

                        $
                            .each(
                                data.data,
                                function (j, val) {
                                    var html;
                                    var hidden_link = "<div class=\"newInfoTruncation\">"
                                        + val.link
                                        + "</div>"
                                        + "<span>"
                                        + val.link
                                        + "</span>";
                                    var hidden_push_code = "<div class=\"newInfoTruncation\">"
                                        + val.push_code
                                        + "</div>"
                                        + "<span>"
                                        + val.push_code
                                        + "</span>";
                                    var hidden_position = "<div><a  class=\"newsInfo\"><div class=\"newInfoTruncation\">"
                                        + val.position
                                        + "</div>"
                                        + "<span>"
                                        + val.position
                                        + "</span></a></div>";
                                    var hidden_name = "<div><a  class=\"newsInfo\"><div class=\"newInfoTruncation\">"
                                        + val.name
                                        + "</div>"
                                        + "<span>"
                                        + val.name
                                        + "</span></a></div>";
                                    html = "<tr>"
                                        + "<td  align=\"center\">"
                                        + ((data.page.pageNo - 1)
                                        * data.page.pageSize
                                        + j + 1)
                                        + "</td>"
                                        + "<td>"
                                        + hidden_name
                                        + "</td>"
                                        + "<td>"
                                        + hidden_position
                                        + "</td>"
                                        + "<td>"
                                        + "<a href= \""+val.link+"\" target=\"_blank\" class=\"newsInfo\">" + hidden_link + "</a>"
                                        + "</td>"
                                        + "<td  align=\"center\">"
                                        + val.deadline
                                        + "</td>"
                                        + "<td>" + "<div><a  class=\"newsInfo\">"
                                        + hidden_push_code
                                            + "</a></div></td>";

                                    if(val.status == 0){
                                        html += "<td style='background:#7CCD7C'>正在进行";
                                    }else if(val.status == 1){
                                        html += "<td style='background:#F9F100'>即将过期";
                                    }else if(val.status == 2){
                                        html += "<td style='background:#FF3030'>已经结束";
                                    }else{
                                        html += "<td >状态未知";
                                    }

                                    html += "</td>"
                                        + "<td align=\"center\"><button type='button' class='btn btn-info btn-xs' onclick='return addToMe("+val.id+")'>"
                                        + "未投"
                                        + "</button>"
                                        + "&nbsp;&nbsp;<button type='button' class='btn btn-info btn-xs' onclick='return addToMeAndSetApplied("
                                        + val.id
                                        + ")' data-target='#addUserModal'>已投</button>";
                                    html += "&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-xs' onclick='return notInterested("
                                        + val.id
                                        + ")' data-target='#addUserModal'>忽略</button>";
                                        html += "</button>"
                                        + "</td></tr>"
                                    $("#equList").append(html);

                                });
                        $("#pagination").show();
                        $(".pagination").bootstrapPaginator(options);
                    }

                },
                error: function (error) {
                    alert("error");
                }
            });
    }

    function goVisit(dest) {
        //       window.open(dest);
//        location.href = "http://www.baidu.com";
//        alert(dest);
    }
    //查询设备
    function queryEquipment() {
        //不管name是否为空，使得搜索条件为空时，查询所有
        pagehtml(1);
        return false;
    }


    //切换每页显示数据数
    function changePageSize(obj) {
        var pageSize = obj.value;
        $("#pageSize").val(pageSize);
        pagehtml(1);
    }

    // 设置为已经投递
    function  addToMe(equipmentId) {
        var result = confirm("确定执行此操作？");
        if (result) {

        } else {
            return false;
        }
        $
            .ajax({
                url: "${pageContext.request.contextPath}/equipment/addToMe/"+ equipmentId,
                data: {
                    "equipmentId": equipmentId
                },
                type: "get",
                success: function (data) {
                    if (data == true) {
                        alert("设置成功！");
                        pagehtml($("#currentPage").val());
                    } else {
                        alert("设置失败！");
                    }
                },
                error: function () {
                    alert("设置错误");
                },
            });
        return false;
    }
    //删除设备
    function deleteEquipment(equipmentId) {

        if (!equipmentId) {
            alert('Error！');
            return false;
        }
        var result = confirm("确定删除当前信息？");
        if (result) {

        } else {
            return false;
        }
        $
            .ajax({
                url: "${pageContext.request.contextPath}/equipment/deleteEquipment/"
                + equipmentId,
                type: "get",
                success: function (data) {
                    if (data == true) {
                        alert("删除成功！");
                        pagehtml($("#currentPage").val());
                    } else {
                        alert("只可以删除自己添加的信息！");
                    }
                },
                error: function () {
                    alert("删除错误");
                },
            });
    }


    function addToMeAndSetApplied(equipmentId) {
        var result = confirm("确定执行此操作？");
        if (result) {

        } else {
            return false;
        }
        $
            .ajax({
                url: "${pageContext.request.contextPath}/equipment/addToMeAndSetApplied/"+ equipmentId,
                data: {
                    "equipmentId": equipmentId
                },
                type: "get",
                success: function (data) {
                    if (data == true) {
                        alert("设置成功！");
                        pagehtml($("#currentPage").val());
                    } else {
                        alert("设置失败！");
                    }
                },
                error: function () {
                    alert("设置错误");
                },
            });
        return false;
    }
</script>


</html>
