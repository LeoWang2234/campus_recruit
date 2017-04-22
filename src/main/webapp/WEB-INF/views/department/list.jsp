<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	${map}
	<table class="table table-hover  table-bordered table-striped"
		id="depList" style="margin-bottom: 0px;">
		<tr>
			<th>序号</th>
			<th>部门编号</th>
			<th>部门名称</th>
			<th>操作</th>
		</tr>
		<%-- <c:forEach var="department" items="${depList }" varStatus="status">
	  	<tr>
	  		<td>${status.index+1 }</td>
	  		<td>${department.depId }</td>
	  		<td>${department.depName }</td>
	  		<td>
	  			<button type="button" class="btn btn-info btn-xs" onclick="javascript:window.location.href='${pageContext.request.contextPath}/department/update?id=${department.id }'">修改</button>
	  			<button type="button" class="btn btn-danger btn-xs" onclick="departmentDelete(${department.id })">删除</button>
	  		</td>
	  	</tr>
	  </c:forEach> --%>
	</table>
	<div >
		<ul class="pagination">
			<li><a href="#">上一页</a></li>
			<li class="active"><a href="#">1</a></li>
			<li class="disabled"><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">下一页</a></li>
		</ul>
	</div>
	
</div>