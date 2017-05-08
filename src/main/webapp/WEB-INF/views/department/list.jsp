<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title></title>

<div class="row search">
	<button type="button" class="btn btn-primary" style="float: right;"
			data-toggle="modal" data-target="#createDepartment" >添加</button>
</div>
<div >
	<table class="table table-hover  table-bordered table-striped">
		<thead>
			<th class="col-md-1">序号</th>
			<th class="col-md-3">部门名称</th>
			<th class="col-md-3">创建人</th>
			<th class="col-md-3">创建时间</th>
			<th class="col-md-2">操作</th>
		</thead>
		<tbody id="depList"></tbody>
	</table>
</div>
<!-- 添加模态框 -->
<form method="post" class="form-horizontal" action="" role="form"
	id="createForm" style="margin: 20px;">
	<div class="modal fade" id="createDepartment" tabindex="-1"
		role="dialog" aria-labelledby="createModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="crdateModalLabel">添加部门</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="depName" class="col-md-4 control-label">部门名称</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="depName" 
								placeholder="请输入部门名称">
						</div>
					</div>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button type="submit" class="btn btn-primary">添加</button>
				</div>
			</div>
		</div>
	</div>
</form>


<script type="text/javascript">


	$(function() {
		queryAllDepartment();
	});
	
	//查询所有部门
	function queryAllDepartment(){
		$.ajax({
			url : "${pageContext.request.contextPath}/department/queryAllDepartment",
			type : "GET",
			dataType : "json",
			success : function(data) {
				$('#depList').empty();
					$.each(data.data,function(i, val) {
						$('#depList').append(
							"<tr>"
							+ "<td>"
							+ (i+1)
							+ "</td>"
							+ "<td>"
							+ val.depName
							+ "</td>"
							+ "<td>"
							+ val.createName
							+ "</td>"
							+ "<td>"
							+ val.createTime
							+ "</td>"
							+ "<td>&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-xs' onclick='return deleteDepartment("+val.depId+")'>删除</button></td>");
					});
				},
			error : function() {
				alert("error");
			}
		});
	}
	
	//添加部门
	$("#createForm")
			.submit(
					function(e) {
						var depName = $.trim($("#depName").val());
						if (!depName) {
							alert("部门不能为空！");
							return false;
						}
						$
								.ajax({
									url : "${pageContext.request.contextPath}/department/createDepartment",
									type : "post",
									contentType : "application/json",
									data : JSON.stringify({
										depName : depName,
										createId : ${currentUser.id}
									}),
									success : function(data) {
										if (data == true) {
											$("#createDepartment").modal('hide');
											queryAllDepartment();
											alert("添加成功!");
										} else {
											alert("添加失败！");
										}

									},
									error : function() {
										alert("添加出错!");
									}

								});
						e.preventDefault();
				});
	
	//删除部门
	function deleteDepartment(depId) {
		if (!depId) {
			alert("登录失效，请重新登录！");
			return false;
		}
		var result = confirm("确定删除当前角色？");
		if (result) {

		} else {
			return false;
		}
		$
				.ajax({
					url : "${pageContext.request.contextPath}/department/deleteDepartment/"
							+ depId,
					type : "get",
					success : function(data) {
						if (data == true) {
							alert("删除成功！");
							queryAllDepartment();
						} else {
							alert("删除失败！");
						}
					},
					error : function() {
						alert("删除错误");
					},
				});
	}
	
	
</script>
</html>
