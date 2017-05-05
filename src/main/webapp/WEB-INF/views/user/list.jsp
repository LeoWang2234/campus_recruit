<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/bootstrap-paginator.min.js"></script>

<div class="pull-right">
	<button type="button" class="btn btn-primary" style="float: right;"
		data-toggle="modal" data-target="#createUser" onclick="addElements()">添加</button>
</div>
<div>
	<table class="table table-hover  table-bordered table-striped"
		style="margin-bottom: 0px;">
		<thead>
			<tr>
				<th class="col-md-1">序号</th>
				<th class="col-md-2">账号</th>
				<th class="col-md-1">姓名</th>
				<th class="col-md-1">部门</th>
				<th class="col-md-1">联系电话</th>
				<th class="col-md-1">角色</th>
				<th class="col-md-1">创建人</th>
				<th class="col-md-2">创建时间</th>
				<th class="col-md-2">操作</th>
			</tr>
		</thead>
		<tbody id="userList"></tbody>
	</table>	
</div>
<div id="pagination">
	<center>
		<ul class="pagination"></ul>
	</center>
	<input type="text" id="currentPage" style="display:none" value="1"></input> 
</div>

<!-- 更新模态框 -->
<form method="post" class="form-horizontal" action="" role="form"
	id="updateForm" style="margin: 20px;">
	<div class="modal fade"  tabindex="-1"
		role="dialog" aria-labelledby="createModalLabel" id="updateUser" aria-hidden="true"
		data-backdrop="static">
		<input type="text" name="equipmentId" id="upId" style="display:none" />
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" >修改用户</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="upUserName" class="col-md-4 control-label">账号</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="upUserName" 
								placeholder="请输入账号">
						</div>
					</div>
					<div class="form-group">
						<label for="upPassword" class="col-md-4 control-label">密码</label>
						<div class="col-md-6">
							<input type="password" class="form-control" 
								 id="upPassword" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="upTrueName" class="col-md-4 control-label">姓名</label>
						<div class="col-md-6">
							<input type="text" class="form-control" 
								 id="upTrueName" placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group">
						<label for=upDeptName" class="col-md-4 control-label">部门</label>
						<div class="col-md-6">
							<select class="form-control" id="upDeptName">
								<option value="none" >请选择部门</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="upRoleName" class="col-md-4 control-label">角色</label>
						<div class="col-md-6">
							<select class="form-control" id="upRoleName" >
								<option value="none" >请选择角色</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="upPhone" class="col-md-4 control-label">联系方式</label>
						<div class="col-md-6">
							<input type="text" class="form-control" 
								 id="upPhone" placeholder="请输入联系方式">
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
<!-- 添加模态框 -->
<form method="post" class="form-horizontal" action="" role="form"
	id="createForm" style="margin: 20px;" >
	<div class="modal fade"  tabindex="-1"
		role="dialog" aria-labelledby="createModalLabel" id="createUser" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" >添加用户</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="userName" class="col-md-4 control-label">账号</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="userName" 
								placeholder="请输入账号" >
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-md-4 control-label">密码</label>
						<div class="col-md-6">
							<input type="password" class="form-control" 
								 id="password" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="trueName" class="col-md-4 control-label">姓名</label>
						<div class="col-md-6">
							<input type="text" class="form-control" 
								 id="trueName" placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group">
						<label for="deptName" class="col-md-4 control-label">部门</label>
						<div class="col-md-6">
							<select class="form-control" id="deptName">
								<option value="none" >请选择部门</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="roleName" class="col-md-4 control-label">角色</label>
						<div class="col-md-6">
							<select class="form-control" id="roleName" >
								<option value="none" >请选择角色</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-md-4 control-label">联系方式</label>
						<div class="col-md-6">
							<input type="text" class="form-control" 
								 id="phone" placeholder="请输入联系方式">
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
		pagehtml($("#currentPage").val());

	});
	//查询所有用户，分页
	function pagehtml(pageNo) {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/user/queryAllUser",
					type : "get",
					data : {pageNo : pageNo,pageSize : 10},
					success : function(data) {
						var options = {
							alignment : "center",//居中显示
							currentPage : data.page.pageNo,//当前页数
							totalPages : data.page.totalPages,//总页数 
							bootstrapMajorVersion : 3,
							onPageClicked : function(event, originalEvent,
									type, page) {
								$("#currentPage").val(page);
								pagehtml(page);
							}
						};
						$("#userList").empty();
						if (data.data == "") {
							$("#equList").html("<div  id='emptyAlert' class='alert alert-danger'>"+
								    "<a href='#' class='close' data-dismiss='alert'>&times;</a>"+
								    "<strong>失败！</strong>当前没有用户</div>");
								    return false;
						} else {
							$
									.each(
											data.data,
											function(j, val) {
												var html = "<tr>"
													+ "<td>"
													+ ((data.page.pageNo - 1)
															* data.page.pageSize
															+ j + 1)
													+ "</td>"
													+ "<td>"
													+ val.userName
													+ "</td>"
													+ "<td>"
													+ val.trueName
													+ "</td>"
													+ "<td>"
													+ val.deptName
													+ "</td>"
													+ "<td>"
													+ val.phone
													+ "</td>"
													+ "<td";
												if(val.roleName == "管理员"){
													html += " class='success'";
												}else if(val.roleName == "维修者"){
													html += " class='danger'";
												}else if(val.roleName == "保养着"){
													html += " class='info'";
												}else{
													html += " class='warning'";
												}
												html += 
													">"
													+ val.roleName
													+ "</td>"
													+ "<td>"
													+ val.createName
													+ "</td>"
													+ "<td>"
													+ val.createTime
													+ "</td>"
													+ "<td><button type='button' class='btn btn-info btn-xs' onclick='return queryUserById("
													+ val.id
													+ ")' data-toggle='modal' data-target='#updateUser'>修改</button>"
													+ "&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-xs' onclick='return deleteUser("
													+ val.id
													+ ")' >删除</button></td></tr>>";
												$('#userList').append(html);				

											});
							$(".pagination").bootstrapPaginator(options);
						}

					},
					error : function(error) {
						alert("error");
					}
				});
	}

	//删除设备
	function deleteUser(id) {
		if (!id) {
			alert('Error！');
			return false;
		}
		var result = confirm("确定删除当前设备？");
		if (result) {

		} else {
			return false;
		}
		$
				.ajax({
					url : "${pageContext.request.contextPath}/user/deleteUser/"
							+ id,
					type : "get",
					success : function(data) {
						if (data == true) {
							alert("删除成功！");
							pagehtml($("#currentPage").val());
						} else {
							alert("删除失败！");
						}
					},
					error : function() {
						alert("删除错误");
					},
				});
	}

	//获取要修改的用户
	function queryUserById(id) {
		if (!id) {
			alert('Error！');
			return false;
		}
		addDept("#upDeptName");
		addRole("#upRoleName");
		$
				.ajax({
					url : "${pageContext.request.contextPath}/user/queryUserById",
					data : {
						"id" : id
					},
					type : "get",
					success : function(data) {
						$("#upUserName").val(data.userName);
						$("#upPassword").val(data.password);
						$("#upTrueName").val(data.trueName);
						$("#upPhone").val(data.phone);
						$("#upId").val(data.id);
					},
					error : function() {
						alert("请求出错");
					},
				});

		return false;
	}
	//修改用户
	$("#updateForm")
			.submit(
					function(e) {
						var userName = $.trim($("#upUserName").val());
						var password = $.trim($("#upPassword").val());
						var trueName = $.trim($("#upTrueName").val());
						var deptName = $.trim($("#upDeptName").val());
						var roleName = $.trim($("#upRoleName").val());
						var phone = $.trim($("#upPhone").val());
						var id = $.trim($("#upId").val());
						if (!userName || !password || !trueName || deptName == "none" 
							|| roleName == "none" || !phone ) {
							alert("输入信息不完整！");
							return false;
						}
						$
								.ajax({
									url : "${pageContext.request.contextPath}/user/updateUser",
									type : "post",
									contentType : "application/json",
									data : JSON.stringify({
										userName : userName,
										password : password,
										trueName : trueName,
										deptName: deptName,
										roleName: roleName,
										phone: phone,
										id: id,
										createId: ${currentUser.id}
									}),
									success : function(data) {
										if (data == true) {
											$("#updateUser").modal('hide');
											alert("修改成功!");
											pagehtml($("#currentPage").val());
										} else {
											alert("修改失败！");
										}

									},
									error : function() {
										alert("修改出错!");
									}

								});
						e.preventDefault();
					});

	//添加设备
	$("#createForm")
			.submit(
					function(e) {
						var userName = $.trim($("#userName").val());
						var password = $.trim($("#password").val());
						var trueName = $.trim($("#trueName").val());
						var deptName = $.trim($("#deptName").val());
						var roleName = $.trim($("#roleName").val());
						var phone = $.trim($("#phone").val());
						if (!userName || !password || !trueName || deptName == "none" 
							|| roleName == "none" || !phone ) {
							alert("输入信息不完整！");
							return false;
						}
						$
								.ajax({
									url : "${pageContext.request.contextPath}/user/createUser",
									type : "post",
									contentType : "application/json",
									data : JSON.stringify({
										userName : userName,
										password : password,
										trueName : trueName,
										deptName: deptName,
										roleName: roleName,
										phone: phone,
										createId: ${currentUser.id}
									}),
									success : function(data) {
										if (data == true) {
											$("#createUser").modal('hide');
											alert("添加成功!");
											pagehtml($("#currentPage").val());
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
	
	//加载下拉框数据
	function addElements(){
		addDept("#deptName");
		addRole("#roleName");
	}
	
	//加载部门下拉框
	function addDept(id){
		$.ajax({
			url : "${pageContext.request.contextPath}/department/queryAllDepartment",
			type: "get",
			dataType : "json",
			success : function(data) {
				var html;
				html = "<option value='none'>请选择部门</option>";
				$.each(data.data,function(i,item){
					html += "<option value="+item.depName+">"+item.depName+"</option>"; 
				});
				$(id).html(html);
				},
				error : function() {
					alert("查询出错");
				},
		});
	};
	
	//加载角色下拉框
	function addRole(id){
		$.ajax({
			url : "${pageContext.request.contextPath}/user/queryAllRole",
			type: "get",
			dataType : "json",
			success : function(data) {
				var html;
				html = "<option value='none'>请选择角色</option>";
				$.each(data.data,function(i,item){
					html += "<option value="+item.roleName+">"+item.roleName+"</option>"; 
				});
				$(id).html(html);
				},
				error : function() {
					alert("查询出错");
				},
		});
	};
	
	
</script>



</html>
