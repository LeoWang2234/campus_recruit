<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- data-spy="affix" -->
<ul id="main-nav" class="nav nav-tabs nav-stacked ">
	<li class="active" style="margin: 0" id="home"><a > <i
			class="glyphicon glyphicon-th-large"></i> 首页
	</a></li>
	<li style="margin: 0" id="equipmentMenu"><a href="#systemSetting"
		class="nav-header collapsed" data-toggle="collapse"> <i
			class="glyphicon glyphicon-cog"></i> 设备管理 <span
			class="pull-right glyphicon glyphicon-chevron-down"></span>
	</a>
		<ul id="systemSetting" class="nav nav-list collapse secondmenu"
			style="height: 0px;">
			<li ><a href="javascript:pageEquipment()"><i
					class="glyphicon glyphicon-user"></i>所有设备</a></li>
			<li><a href="#"><i class="glyphicon glyphicon-user"></i>按部门</a></li>
			<li><a href="#"><i class="glyphicon glyphicon-th-list"></i>按使用状态</a></li>
			<li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>按设备类型</a></li>
			<li><a href="#"><i class="glyphicon glyphicon-edit"></i>按设备标识</a></li>
			<li><a href="#"><i class="glyphicon glyphicon-eye-open"></i>安检验情况</a></li>
		</ul></li>
	<li style="margin: 0"><a href="#"> <i
			class="glyphicon glyphicon-credit-card"></i> 设备维护
	</a></li>
	<li style="margin: 0"><a href="#"> <i
			class="glyphicon glyphicon-globe"></i> 配件 <span
			class="label label-warning pull-right">5</span>
	</a></li>
	<li style="margin: 0" id="departmentMenu"><a >
			<i class="glyphicon glyphicon-calendar"></i> 部门管理
	</a></li>
	<li style="margin: 0" id="userMenu"><a href="#account"
		class="nav-header collapsed" data-toggle="collapse"> <i
			class="glyphicon glyphicon-cog"></i> 用户管理 <span
			class="pull-right glyphicon glyphicon-chevron-down"></span>
	</a>
		<ul id="account" class="nav nav-list collapse secondmenu"
			style="height: 0px;">
			<li><a href="javascript:pageUser()"><i class="glyphicon glyphicon-user"></i>账户管理</a></li>
			<li><a href="javascript:pageRole()"><i class="glyphicon glyphicon-th-list"></i>角色管理</a></li>
		</ul></li>
</ul>
<script type="text/javascript">
	//查询所有部门
	 $('#departmentMenu').click(function(event) {
		 $(this).addClass("active").siblings().removeClass("active");
		pageDepartment();
	});
	
	//点击设备管理
	 $('#equipmentMenu').click(function(event) {
		 $(this).addClass("active").siblings().removeClass("active");
	 });
	//切换到department/list.jsp
	function pageDepartment() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/department/pageDepartment",
					type : "GET",
					dataType : "html",
					async : false,
					success : function(data) {
						$('#main').empty();
						$('#main').html(data);
					},
					error : function() {
						alert("error");
					}
				});
	}

	

	//切换到equipment/list.jsp
	function pageEquipment() {
		$.ajax({
			url : "${pageContext.request.contextPath}/equipment/pageEquipment",
			type : "GET",
			dataType : "html",
			//true有时会得不到数据
			async : false,
			success : function(data) {
				$('#main').empty();
				$('#main').html(data);
			},
			error : function() {
				alert("error");
			}
		});
	}
	
	//点击首页
	$("#home").click(function(event){
		$(this).addClass("active").siblings().removeClass("active");
		$.ajax(
			{
				url: "${pageContext.request.contextPath}/user/home",
				type: "GET",
				datatype: "html",
				success : function(data){
					$("#main").empty();
					$("#main").html(data);
				},
				error: function(){
					alert("errer");
				}
		});
	});
	
	//点击联系人
	$("#userMenu").click(function(event){
		$(this).addClass("active").siblings().removeClass("active");
	})
	//切换到user/list.jsp
	function pageUser(){
		$.ajax(
			{
				url: "${pageContext.request.contextPath}/user/pageUser",
				type: "GET",
				datatype: "html",
				success : function(data){
					$("#main").empty();
					$("#main").html(data);
				},
				error: function(){
					alert("errer");
				}
		});
	}
	
	//切换到user/roleList.jsp
	function pageRole(){
		$.ajax(
			{
				url: "${pageContext.request.contextPath}/user/pageRole",
				type: "GET",
				datatype: "html",
				success : function(data){
					$("#main").empty();
					$("#main").html(data);
				},
				error: function(){
					alert("errer");
				}
		});
	}
</script>
