<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title></title>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/Scripts/jquery-1.11.0.min.js"></script>
<link type="text/css" href="${pageContext.request.contextPath}/Scripts/bootstrap-3.3.1/css/bootstrap.min.css" rel="stylesheet" />
<%--<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/Sbootstrap-pagination.min.csscripts/bootstrap-3.3.1/js/bootstrap.min.js"></script>--%>
<link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-pagination.min.css" rel="stylesheet" />
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/bootstrap-pagination.min.js"></script>

<div class="row search">
	<div class="col-md-6">
		<form
			action="${pageContext.request.contextPath}/views/department/list"
			method="post">
			<div class="input-group" style="width: 300px">
				<input type="text" class="form-control" name="deptName"
					placeholder="请输入要查询的部门..."> <span class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<span class="glyphicon glyphicon-search"></span>&nbsp;查询
					</button>
				</span>
			</div>
		</form>
	</div>
	<div class="col-md-6">
		<button type="button" class="btn btn-primary" style="float: right;"
			onclick="javascript:window.location.href='${pageContext.request.contextPath}/department/preSave.do'">添加</button>
	</div>
</div>
<div>
	<%--${map}--%>
	<table class="table table-hover  table-bordered table-striped"
		 style="margin-bottom: 0px;">
		<tr>
			<th>序号</th>
			<th>部门编号</th>
			<th>部门名称</th>
			<th>操作</th>
		</tr>
		<table class="table table-hover  table-bordered table-striped"
					id="depList" style="margin-bottom: 0px;">

		</table>>
	</table>
</div>



<script type="text/javascript">

    $(function () {
        var demo1 = BootstrapPagination($("#demo1"), {
            //记录总数。
            total:100,
            //当前页索引编号。从其开始（从0开始）的整数。
            pageIndex: 2,
            pageChanged: function queryAllDepartment(pageIndex, pageSize) {
//                pageDepartment();
                $.ajax({
                    url: "/department/queryAllDepartment?page="+pageIndex,
                    type: "GET",
                    dataType: "json",
                    async: true,
                    success: function(data) {
                        $('#depList').html("");
                        $.each(data, function(i, item){
                            $.each(item, function(j, val){
                                $('#depList').append(
                                    "<tr>"+
                                    "<td>"+j+"</td>"+
                                    "<td>"+val.depId+"</td>"+
                                    "<td>"+val.depName+"</td>"+
                                    "<td><button type='button' class='btn btn-info btn-xs' onclick=''>修改</button>"+
                                    "&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-xs' onclick=''>删除</button></td>"
                                );
                            });
                        });
                    },
                    error: function() {
                        alert("error");
                    }
                });

            },
        });
    });
</script>


<body>
<form class="form-inline">
	<%--<h1>Demo1：最简短代码示例</h1>--%>
	<nav>
		<ul id="demo1" class="pagination">
		</ul>
	</nav>
</form>
</body>
</html>
