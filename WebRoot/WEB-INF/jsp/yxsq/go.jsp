<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<title> 注册成功页面 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<style type="text/css">
		body{font-size:12px;font-family:"微软雅黑";text-align:center;background:#dceffe}
		#time{color:red;}
		p{margin-top:200px;}
	</style>
	<!-- js -->
	<script type="text/javascript">
		var miao = 10;
		var URL;
		function load(url){
			URL = url;
			for(var i = miao; i >= 0; i--){
				window.setTimeout('doUpdate('+ i +')', (miao - i) * 1000);
			}
		}

		function doUpdate(num){
			document.getElementById("time").innerHTML = num;
			if(num == 0){
				window.location = URL;
			}
		}

		load("${pageContext.request.contextPath}/yxsq/sq/main.action");
		
	</script>
</head>
<body>
	<p>注册成功，请登录您的邮箱进行注册！本页面将在<span id="time">10</span>秒后自动转入<a href="${pageContext.request.contextPath}/yxsq/sq/main.action">社区大厅</a>，请稍后...</p>
</body>
</html>
