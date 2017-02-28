<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> top.html </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<!-- css -->
	<link href="${pageContext.request.contextPath}/admin_file/css/main.css" rel="stylesheet" type="text/css"/>
	
	
</head>
<body>
	<div class="top">
		<div class="content_1">
			<div class="one">
				<div class="_1">
					<a href="${pageContext.request.contextPath}">网站首页</a>
					&nbsp;&nbsp;<font color="#fff">|</font>&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/admin/user/admin_loginOut.action">安全退出</a>
				</div>
				<div class="_2">
					<img src="${pageContext.request.contextPath}/admin_file/images/top_2.jpg" class="img_1"/>
					<span class="span_1">当前登陆：【${session_user.nickname}】</span>
					<span class="span_2">Time：<span id="nowTime">2015-05-22 12:12:12</span></span>
					<img src="${pageContext.request.contextPath}/admin_file/images/top_3.jpg" class="img_2"/>
				</div>
			</div>
		</div>
	</div>	
</body>
	<!-- js -->
	<script type="text/javascript">
		function doSomething(time){
	  		i = parseInt(time);
	  		if( i / 10 < 1){
	  			i = "0" + i;
	  		}
	  		return i;
	  	}
	    function setDate() {
			var date = new Date();
			var year = date.getFullYear();
			nowDate1 = year + "-" + doSomething((date.getMonth() + 1)) + "-" + doSomething(date.getDate())+"  ";
			nowDate1 += doSomething(date.getHours()) + ":" + doSomething(date.getMinutes()) + ":" + doSomething(date.getSeconds());
			document.getElementById("nowTime").innerHTML = nowDate1;
			setTimeout('setDate()', 1000);
		}
	  	setDate();
	</script>
</html>
