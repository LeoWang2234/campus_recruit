<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

<div class="pull-right">
	<button type="button" class="btn btn-primary" style="float: right;"
		data-toggle="modal" data-target="#createRole">添加</button>
</div>
<div>
	<table class="table table-hover  table-bordered table-striped"
		style="margin-bottom: 0px;">
		<thead>
			<tr>
				<th class="col-md-1 col-md-offset-1">序号</th>
				<th class="col-md-1">角色名称</th>
				<th class="col-md-1">创建人</th>
				<th class="col-md-2">创建时间</th>
				<th class="col-md-4">角色说明</th>
				<th class="col-md-1">操作</th>
			</tr>
		</thead>
		<tbody id="roleList"></tbody>
	</table>	
</div>

<!-- 添加模态框 -->
<form method="post" class="form-horizontal" action="" role="form"
	id="createForm" style="margin: 20px;">
	<div class="modal fade" id="createRole" tabindex="-1"
		role="dialog" aria-labelledby="createModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="crdateModalLabel">添加角色</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="crName" class="col-md-4 control-label">角色名称</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="crName" name="name"
								placeholder="请输入角色名称">
						</div>
					</div>

					<div class="form-group">
						<label for="crRemark" class="col-md-4 control-label">角色说明</label>
						<div class="col-md-6">
							<input type="text" class="form-control" name="produceName"
								value="" id="crRemark" placeholder="请输入角色说明">
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
		queryAllRole();

	});
	//查询所有用户
	function queryAllRole() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/user/queryAllRole",
					type : "get",
					success : function(data) {
						$("#roleList").empty();
						if (data.data == "") {
							$("#equList").html("<div  id='emptyAlert' class='alert alert-danger'>"+
								    "<a href='#' class='close' data-dismiss='alert'>&times;</a>"+
								    "<strong>失败！</strong>当前没有角色</div>");
								    return false;
						} else {
							$
									.each(
											data.data,
											function(j, val) {
												var html = "<tr>"
													+ "<td>"
													+ (j+1)
													+ "</td>"
													+ "<td>"
													+ val.roleName
													+ "</td>"
													+ "<td>"
													+ val.createName
													+ "</td>"
													+ "<td>"
													+ val.createTime
													+ "</td>"
													+ "<td>"
													+ val.remark
													+ "</td>"
													+ "<td>&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-xs' onclick='return deleteRole("
													+ val.id
													+ ")'>删除</button></td></tr>>";
												$('#roleList').append(html);				

											});
						}

					},
					error : function(error) {
						alert("error");
					}
				});
	}

	//删除角色
	function deleteRole(id) {
		if (!id) {
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
					url : "${pageContext.request.contextPath}/user/deleteRole/"
							+ id,
					type : "get",
					success : function(data) {
						if (data == true) {
							alert("删除成功！");
							queryAllRole();
						} else {
							alert("删除失败！");
						}
					},
					error : function() {
						alert("删除错误");
					},
				});
	}


	//添加角色
	$("#createForm")
			.submit(
					function(e) {
						var roleName = $.trim($("#crName").val());
						var remark = $.trim($("#crRemark").val());
						if (!roleName || !remark ) {
							alert("不能有空值！");
							return false;
						}
						$
								.ajax({
									url : "${pageContext.request.contextPath}/user/createRole",
									type : "post",
									contentType : "application/json",
									data : JSON.stringify({
										roleName : roleName,
										remark : remark,
										createId : ${currentUser.id}
									}),
									success : function(data) {
										if (data == true) {
											$("#createRole").modal('hide');
											queryAllRole();
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

	
	
</script>



</html>
