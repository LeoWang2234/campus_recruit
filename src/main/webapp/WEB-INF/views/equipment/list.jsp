<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

<%-- <link type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-pagination.min.css"
	rel="stylesheet" /> --%>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/bootstrap-paginator.min.js"></script>

<div class="row search">
	<div class="col-md-6">
		<form action="" method="post">
			<div class="input-group" style="width: 300px">
				<input type="text" class="form-control" id="queryName"
					placeholder="请输入设备名称..."> <span class="input-group-btn">
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
		<button type="button" class="btn btn-primary" style="float: right;"
			data-toggle="modal" data-target="#createEquipment" onclick="addType('#crTypeId')">添加</button>
	</div>
</div>
<div>
	<table class="table table-hover  table-bordered table-striped"
		style="margin-bottom: 0px;">
		<thead>
			<tr>
				<th class="col-md-1">序号</th>
				<th class="col-md-2">设备名称</th>
				<th class="col-md-2">工序</th>
				<th class="col-md-2">设备编号</th>
				<th class="col-md-3">设备类型</th>
				<th class="col-md-2">操作</th>
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
	<input type="text" id="pageSize" style="display:none" value="10"></input> 
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
					style="display:none" />
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="updateModalLabel">设备修改</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="upName" class="col-md-4 control-label">设备名称</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="upName" name="name"
								placeholder="设备名称">
						</div>
					</div>

					<div class="form-group">
						<label for="upProduceName" class="col-md-4 control-label">工序</label>
						<div class="col-md-6">
							<input type="text" class="form-control" name="produceName"
								value="" id="upProduceName" placeholder="工序">
						</div>
					</div>
					<div class="form-group">
						<label for="upNo" class="col-md-4 control-label">设备编号</label>
						<div class="col-md-6">
							<input type="text" class="form-control" name="no" id="upNo"
								placeholder="设备编号">
						</div>
					</div>
					<div class="form-group">
						<label for=upTypeId" class="col-md-4 control-label">部门</label>
						<div class="col-md-6">
							<select class="form-control" id="upTypeId">
								<option value="none" >请选择设备类型</option>
							</select>
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
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="crdateModalLabel">添加设备</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="crName" class="col-md-4 control-label">设备名称</label>
						<div class="col-md-6">
							<input type="text" class="form-control" id="crName" name="name"
								placeholder="请输入设备名称">
						</div>
					</div>

					<div class="form-group">
						<label for="crProduceName" class="col-md-4 control-label">工序</label>
						<div class="col-md-6">
							<input type="text" class="form-control" name="produceName"
								value="" id="crProduceName" placeholder="请输入工序">
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
								<option value="none" >请选择设备类型</option>
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
	$(function() {
		pagehtml($("#currentPage").val());

	});

	//删除设备
	function deleteEquipment(equipmentId) {
		if (!equipmentId) {
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
					url : "${pageContext.request.contextPath}/equipment/deleteEquipment/"
							+ equipmentId,
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

	//获取要修改的设备
	function getEquipmentById(equipmentId) {
		if (!equipmentId) {
			alert('Error！');
			return false;
		}
		addType("#upTypeId");
		$
				.ajax({
					url : "${pageContext.request.contextPath}/equipment/queryEquipmentById",
					data : {
						"equipmentId" : equipmentId
					},
					type : "get",
					success : function(data) {
						$("#upName").val(data.name);
						$("#upProduceName").val(data.produceName);
						$("#upNo").val(data.no);
						$("#upEquipmentId").val(equipmentId);
					},
					error : function() {
						alert("请求出错");
					},
				});

		return false;
	}
	//修改设备
	$("#updateForm")
			.submit(
					function(e) {
						var name = $.trim($("#upName").val());
						var produceName = $.trim($("#upProduceName").val());
						var no = $.trim($("#upNo").val());
						var typeId = $.trim($("#upTypeId").val());
						if (!name || !produceName || !no || typeId == "none") {
							alert("设备信息不完整！");
							return false;
						}
						$
								.ajax({
									url : "${pageContext.request.contextPath}/equipment/updateEquipment",
									type : "post",
									contentType : "application/json",
									data : JSON.stringify({
										name : name,
										produceName : produceName,
										no : no,
										equipmentId : $("#upEquipmentId").val(),
										typeId : typeId
									}),
									success : function(data) {
										if (data == true) {
											$("#updateEquipment").modal('hide');
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
									url : "${pageContext.request.contextPath}/equipment/createEquipment",
									type : "post",
									contentType : "application/json",
									data : JSON.stringify({
										name : name,
										produceName : produceName,
										no : no,
										typeId: typeId
									}),
									success : function(data) {
										if (data == true) {
											$("#createEquipment").modal('hide');
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

	//分页
	function pagehtml(pageNo) {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/equipment/queryAllEquipment",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify({
						pageNo : pageNo,
						pageSize : $("#pageSize").val(),
						name : $.trim($("#queryName").val())
					}),
					success : function(data) {
						$("#total").html("当前共有"+data.page.totalElements+"件设备");
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
						$("#equList").empty();
						if (data.data == "") {
							$("#equList").html("<div  id='emptyAlert' class='alert alert-danger'>"+
								    "<a href='#' class='close' data-dismiss='alert'>&times;</a>"+
								    "<strong>失败！</strong>未查到您搜索的设备。</div>");
							$("#pagination").hide();
								    return false;
						} else {
							$
									.each(
											data.data,
											function(j, val) {
												$('#equList')
														.append(
																"<tr>"
																		+ "<td>"
																		+ ((data.page.pageNo - 1)
																				* data.page.pageSize
																				+ j + 1)
																		+ "</td>"
																		+ "<td>"
																		+ val.name
																		+ "</td>"
																		+ "<td>"
																		+ val.produceName
																		+ "</td>"
																		+ "<td>"
																		+ val.no
																		+ "</td>"
																		+ "<td>"
																		+ val.typeName
																		+ "</td>"
																		+ "<td><button type='button' class='btn btn-info btn-xs' onclick='return getEquipmentById("
																		+ val.equipmentId
																		+ ")' data-toggle='modal' data-target='#updateEquipment'>修改</button>"
																		+ "&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-xs' onclick='return deleteEquipment("
																		+ val.equipmentId
																		+ ")' data-target='#addUserModal'>删除</button></td></tr>>");

											});
							$("#pagination").show();
							$(".pagination").bootstrapPaginator(options);
						}

					},
					error : function(error) {
						alert("error");
					}
				});
	}
	//查询设备
	function queryEquipment() {
		//不管name是否为空，使得搜索条件为空时，查询所有
		pagehtml(1);
		return false;
	}
	
	//加载设备类型下拉框
	function addType(id){
		$.ajax({
			url : "${pageContext.request.contextPath}/equipment/queryAllType",
			type: "get",
			dataType : "json",
			success : function(data) {
				var html;
				html = "<option value='none'>请选择设备类型</option>";
				$.each(data.data,function(i,item){
					html += "<option value="+item.typeId+">"+item.typeName+"</option>"; 
				});
				$(id).html(html);
				},
				error : function() {
					alert("查询出错");
				},
		});
	};
	
	//切换每页显示数据数
	function changePageSize(obj){
		var pageSize = obj.value;
		$("#pageSize").val(pageSize);
		pagehtml(1);
	}
</script>



</html>
