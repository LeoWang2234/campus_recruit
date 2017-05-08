<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

<div class="pull-right">
	<button type="button" class="btn btn-primary" style="float: right;"
		data-toggle="modal" data-target="#createType">添加</button>
</div>
<div>
	<table class="table table-hover  table-bordered table-striped"
		style="margin-bottom: 0px;">
		<thead>
			<tr>
				<th class="col-md-2">序号</th>
				<th class="col-md-3">设备类型</th>
				<th class="col-md-2">创建人</th>
				<th class="col-md-3">创建时间</th>
				<th class="col-md-2">操作</th>
			</tr>
		</thead>
		<tbody id="typeList"></tbody>
	</table>	
</div>

<!-- 添加模态框 -->
<form method="post" class="form-horizontal" action="" role="form"
	id="createForm" style="margin: 20px;">
	<div class="modal fade" id="createType" tabindex="-1"
		role="dialog" aria-labelledby="createModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="crdateModalLabel">添加设备类型</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="crName" class="col-md-4 control-label">设备类型</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="crName" name="name"
								placeholder="请输入设备类型名称">
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
		queryAllType();

	});
	//查询所有用户
	function queryAllType() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/equipment/queryAllType",
					type : "get",
					success : function(data) {
						$("#typeList").empty();
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
													+ val.typeName
													+ "</td>"
													+ "<td>"
													+ val.createName
													+ "</td>"
													+ "<td>"
													+ val.createTime
													+ "</td>"
													+ "<td>&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-xs' onclick='return deleteType("
													+ val.typeId
													+ ")'>删除</button></td></tr>>";
												$('#typeList').append(html);				

											});
						}

					},
					error : function(error) {
						alert("error");
					}
				});
	}

	//删除设备类型
	function deleteType(typeId) {
		if (!typeId) {
			alert("无法添加，请刷新界面");
			return false;
		}
		var result = confirm("确定删除当前设备类型？");
		if (result) {

		} else {
			return false;
		}
		$
				.ajax({
					url : "${pageContext.request.contextPath}/equipment/deleteType/"
							+ typeId,
					type : "get",
					success : function(data) {
						if (data == true) {
							alert("删除成功！");
							queryAllType();
						} else {
							alert("删除失败！");
						}
					},
					error : function() {
						alert("删除错误");
					},
				});
	}


	//添加设备类型
	$("#createForm")
			.submit(
					function(e) {
						var typeName = $.trim($("#crName").val());
						if (!typeName) {
							alert("设备类型不能为空！");
							return false;
						}
						$
								.ajax({
									url : "${pageContext.request.contextPath}/equipment/createType",
									type : "post",
									contentType : "application/json",
									data : JSON.stringify({
										typeName : typeName,
										createId : ${currentUser.id}
									}),
									success : function(data) {
										if (data == true) {
											$("#createType").modal('hide');
											queryAllType();
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
