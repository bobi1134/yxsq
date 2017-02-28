<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> 管理员登陆 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/admin_file/css/login.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript">
		if (parent.window.location != window.location)
		{
			parent.window.location = window.location;
		}
	
		$(function(){
			//var _width = $(window).width();
			var _height = $(window).height();
			$(".content_1").css("height",_height);
			$(".content_1 .bc").css("height",_height-677);
			
			$("#loginBtn").click(function(){
				var text_1 = $("#text_1");
				var text_2 = $("#text_2");
				if ($.trim(text_1.val()) == "") {
					alert("请输入账号！");
					text_1.focus();
				}else if ($.trim(text_2.val()) == "") {
					alert("请输入密码！");
					text_2.focus();
				}else{
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/admin/user/admin_userLoginAjax.action",
						dataType:"json",
						data:$("#loginForm").serialize(),
						success:function(json){
							if (json.flag != 1) {
								alert("用户名或密码错误！");
							}else {
								window.location = "${pageContext.request.contextPath}/main.action";
							}
						},
						error:function(){
							alert("异步登陆出错！");
						}
					});
				}
			});
		});
	</script>
</head>
<body>
	<div class="warp">
		<div class="content_1">
			<div class="login">
				<form id="loginForm">
					<input type="text" class="text_1" autocomplete="off" placeholder="请输入账号" id="text_1" name="username"/>
					<input type="text" onfocus="this.type='password'" class="text_2" autocomplete="off" placeholder="请输入密码" id="text_2" name="password"/>
					<input type="button" class="btn" value="登&nbsp;陆" id="loginBtn"/>
				</form>
			</div>
			<div class="bc">			
			</div>
		</div>
	</div>	
</body>
</html>
