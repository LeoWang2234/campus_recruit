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

<div>
	<table class="table table-hover  table-bordered table-striped"
		style="margin-bottom: 0px;" >
		<thead>
			<tr>
				<th class="col-md-1">序号</th>
				<th class="col-md-1">设备名称</th>
				<th class="col-md-1">工序</th>
				<th class="col-md-1">设备编号</th>
				<th class="col-md-1">报修人</th>
				<th class="col-md-2">报修时间</th>
				<th class="col-md-1">维护人</th>
				<th class="col-md-2">维护时间</th>
				<th class="col-md-1">设备状态</th>
			</tr>
		</thead>
		<tbody id="repairList"></tbody>
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
	
	
	//显示数据，分页
	function pagehtml(pageNo) {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/repair/queryAllRepairHistory",
					type : "get",
					contentType : "application/json",
					data : {
						pageNo : pageNo,
						pageSize : 30,
					},
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
						$
						.each(
								data.data,
								function(j, val) {
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
										+ "</td>"
										+ "<td>"
										+ val.createMan
										+ "</td>"
										+ "<td>"
										+ val.createTime
										+ "</td>"
										+ "<td>"
										+ val.repairMan
										+ "</td>"
										+ "<td>"
										+ val.repairTime
										+ "</td>";
										if(val.state == 0){
											html += "<td>维修完成";
										}else if(val.state == 1){
											html += "<td style='background:#7CCD7C'>正在维修";
										}else if(val.state == 2){
											html += "<td style='background:#FF3030'>设备报废";
										}else if(val.state == 3){
											html += "<td style='background:#F9F100'>等待维修";
										}
										html += "</td></tr>>";
									$('#repairList').append(html);

								});
					$("#pagination").show();
					$(".pagination").bootstrapPaginator(options);
						
					},
					error : function(error) {
						alert("error");
					}
				});
	}
	
</script>



</html>
