<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!-- delete -->
<!-- <div class="navbar navbar-duomi navbar-static-top " role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" id="logo">配置管理系统
			</a>
		</div>
	</div>
</div> -->

<!-- 导航条 -->
<nav class="navbar navbar-default navbar-fixed-top " style="height: 8%" role="navigation">
	<div class="container-fluid">
		<!-- 导航条左边 -->
		<div class="navbar-header">
			<a href="#" class="navbar-brand"><img src="" alt="设备管理系统"></a>
			<!-- 页面缩小时显示按钮 -->
			<!-- <button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse">
				按钮中三条线
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
 -->

		</div>
		<!-- 导航条右边 -->
		<!-- <div class="collapse navbar-collapse navbar-right"
			id="navbar-collapse"> -->
		<!-- <ul class="nav navbar-nav" style="margin-top:0;">
				<li class="active"><a href="index.html"> <span
						class="glyphicon glyphicon-home"></span> 首页
				</a></li>
				<li><a href="user.html"> <span
						class="glyphicon glyphicon-list"></span> 设备管理
				</a></li>
				<li><a href="manage.html"> <span
						class="glyphicon glyphicon-fire"></span> 设备维护
				</a></li>
				<li><a href="exit.html"> <span
						class="glyphicon glyphicon-question-sign"></span> 配件
				</a></li>
			</ul> -->
		<ul class="nav navbar-nav navbar-right ">
			<li>
				<a style="color:black;">
					欢迎您：<span class="glyphicon glyphicon-user"></span>${currentUser.trueName }【${currentUser.roleName }】
				</a>
			</li>
			<li onmouseover="this.style.backgroundColor='#7b92aa'" onmouseout="this.style.backgroundColor='transparent'"><a  href="javascript:logout()"><span class="glyphicon glyphicon-remove-sign"></span>
					退出</a></li>
		</ul>
		<!-- <a class="navbar-brand"></a> -->
		<!-- <a class="navbar-brand" href="javascript:logout()">退出</a> -->
	</div>
	</div>
</nav>
<script type="text/javascript">
	function logout() {
		if (confirm("确认退出？")) {
			window.location.href = "${pageContext.request.contextPath}/user/logout";
		}
	}
</script>