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
</div>
<div>
	<table class="table table-hover  table-bordered table-striped"
		style="margin-bottom: 0px;" id="equTable">
		<thead>
			<tr>
				<th class="col-md-1">序号</th>
				<th class="col-md-2">设备名称</th>
				<th class="col-md-2">工序</th>
				<th class="col-md-2">设备编号</th>
				<th class="col-md-2">设备状态</th>
				<th class="col-md-3">操作</th>
			</tr>
		</thead>
		<tbody id="equList"></tbody>
	</table>	
</div>
<div id="pagination">
	<center>
		<ul class="pagination"></ul>
	</center>
	<input type="text" id="currentPage" style="display:none" value="1"></input> 
</div>


<script type="text/javascript">
	$(function() {
		pagehtml($("#currentPage").val());

	});
	
	//设备报修
	function repairEquipment(equipmentId,repairId,state){
		//修理完成
		if(state == 0){
			var result = confirm("修理是否完成？");
			if (result) {

			} else {
				return false;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/repair/repairEquipment",
				data : JSON.stringify({
					"equipmentId" : equipmentId,
					"state" : state,
					"repairManId" : ${currentUser.id},
					"repairId" : repairId
				}),
				contentType : "application/json",
				type : "post",
				success : function(data) {
					if(data == true){
						pagehtml($("#currentPage").val());
						alert("修理完成");
					}else{
						alert("修理失败");
					}
				},
				error : function() {
					alert("修理出错");
				},
			});
			return false;
		}
		//维修设备
		if(state == 1){
			var result = confirm("是否修理设备？");
			if (result) {

			} else {
				return false;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/repair/repairEquipment",
				data : JSON.stringify({
					"equipmentId" : equipmentId,
					"state" : state,
					"repairManId" : ${currentUser.id},
					"repairId" : repairId
				}),
				contentType : "application/json",
				type : "post",
				success : function(data) {
					if(data == true){
						pagehtml($("#currentPage").val());
						alert("开始维修");
					}else{
						alert("维修失败");
					}
				},
				error : function() {
					alert("维修出错");
				},
			});
			return false;
		}
		//设备报废
		else if(state == 2){
			var result = confirm("是否报废设备？");
			if (result) {

			} else {
				return false;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/repair/repairEquipment",
				data : JSON.stringify({
					"equipmentId" : equipmentId,
					"state" : state,
					"repairManId" : ${currentUser.id},
					"repairId" : repairId
				}),
				contentType : "application/json",
				type : "post",
				success : function(data) {
					if(data == true){
						pagehtml($("#currentPage").val());
						alert("报废成功");
					}else{
						alert("报废失败");
					}
				},
				error : function() {
					alert("报废错误");
				},
			});
			return false;
		}
		//设备报修
		else if(state == 3){
			var result = confirm("是否报修？");
			if (result) {
				var re = confirm("是否发送短信？");
				if (re) {
					
				}else{
					
				}
			} else {
				return false;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/repair/repairEquipment",
				data : JSON.stringify({
					"equipmentId" : equipmentId,
					"state" : state,
					"createId" : ${currentUser.id}
				}),
				contentType : "application/json",
				type : "post",
				success : function(data) {
					if(data == true){
						pagehtml($("#currentPage").val());
						alert("报修成功");
					}else{
						alert("报修失败");
					}
				},
				error : function() {
					alert("报修出错");
				},
			});
			return false;
		}
	}
	
	//显示数据，分页
	function pagehtml(pageNo) {
		//维修者显示所有数据
		if("${currentUser.roleName}" == "维修者"){
			pageSize = 200;
		}else{
			pageSize = 10;
		}
		$
				.ajax({
					url : "${pageContext.request.contextPath}/equipment/queryAllEquipment",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify({
						pageNo : pageNo,
						pageSize : pageSize,
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
												//报废和正常设备，修理者界面不显示
												if("${currentUser.roleName}" == "维修者" && (val.state == 0 || val.state == 2)){
													//jquery跳出当前循环
													return true;
												}
												var html;
												html = "<tr>"
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
													+ "</td>";
													if(val.state == 0){
														html += "<td>正常</td>";
													}else if(val.state == 1){
														html += "<td style='background:#7CCD7C'>正在维修</td>";
													}else if(val.state == 2){
														html += "<td style='background:#FF3030'>已报废</td>";
													}else if(val.state == 3){
														html += "<td style='background:#F9F100'>等待维修</td>";
													}else{
														html += "<td>正常</td>";
													}
													if("${currentUser.roleName}" == "维修者"){
														//正在维修
														 if(val.state == 1){
															 html += "<td>&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-success btn-xs' onclick='return repairEquipment("
																 + val.equipmentId + "," + val.repairId + ",0)'>修理完成</button>"
																+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-xs' onclick='return repairEquipment("
																+ val.equipmentId + "," + val.repairId + ",2)'>设备报废</button></td></tr>>";
														 }
														//等待维修
														 else if(val.state == 3){
															 html += "<td>&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-warning btn-xs' onclick='return repairEquipment("
																+ val.equipmentId + "," + val.repairId + ",1)' >设备维修</button></td></tr>>";
														 } 
													}else if("${currentUser.roleName}" == "管理员"){
														//正在维修
														 if(val.state == 1){
															 html += "<td>&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-success btn-xs' onclick='return repairEquipment("
																+ val.equipmentId + "," + val.repairId + ",0)' >修理完成</button>"
																+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-xs' onclick='return repairEquipment("
																+ val.equipmentId + "," + val.repairId + ",2)'>设备报废</button></td></tr>>";
														 }
														//等待维修
														 else if(val.state == 3){
															 html += "<td>&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-warning btn-xs' onclick='return repairEquipment("
																+ val.equipmentId + "," + val.repairId + ",1)'>设备维修</button></td></tr>>";
														 } 
														 //设备正常
														 else if(val.state == 0){
															 html += "<td>&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-info btn-xs' onclick='return repairEquipment("
																	+ val.equipmentId + "," + val.repairId + ",3)'>设备报修</button></td></tr>>";
														 }
														 //设备报废
														 else if(val.state == 2){
															 html += "<td>&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-danger btn-xs' onclick='return repairEquipment("
																	+ val.equipmentId + "," + val.repairId + ",0)'>使用设备</button></td></tr>>";
														 }
													}
													//用户
													else{
														//设备正常
														if(val.state == 0){
															html += "<td>&nbsp;&nbsp;<button type='button' class='btn btn-info btn-xs' onclick='return repairEquipment("
																 + val.equipmentId + "," + val.repairId + ",3)'>设备报修</button></td></tr>>";
														}else if(val.state == 1){
															html += "<td>&nbsp;&nbsp;设备正在维修</td></tr>>";
														}else if(val.state == 2){
															html += "<td>&nbsp;&nbsp;设备已经报废</td></tr>>";
														}else if(val.state == 3){
															html += "<td>&nbsp;&nbsp;设备正等待维修</td></tr>>";
														}
														
													}
												$('#equList').append(html);

											});
							//当前没有维修的设备
							if($("table[id$='equTable']>tbody").children("tr").length == 0){
								$("#main").html("<h1>当前没有设备需要维修</h1>");
							}
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
	
</script>



</html>
