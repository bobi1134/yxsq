<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title> ${sq.sq_name}社区表白园 | 月下社区 </title>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<style type="text/css">
		*{margin:0px;padding:0px}
		body{font-size:12px;font-family:"微软雅黑";color:#666;}
		a{text-decoration:none;color:#666;}
		a:hover{text-decoration:underline}
		.main{background:#b8d4d8 url(${pageContext.request.contextPath}/images/bb/bg1.jpg) top center;background-repeat:no-repeat;height:700px;width:1002px;margin:0px auto}
		.one{position: absolute;top: 156px;left: 248px;font-size:20px;font-weight: bold;}
		.two{width:400px;position: absolute;top: 220px;left: 680px;font-size:18px;font-weight: bold;text-align:center;color:#FFC0CB}
		.three{width:400px;position: absolute;top: 253px;left:680px;font-size:16px;color:#FFC0CB}
		.three a{margin-left:335px;color:#FFC0CB}
	</style>
</head>
<body bgcolor="#b8d4d8">
	<div class="main">
		<div class="one">
			<a href="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq.sq_name}">${sq.sq_name}社区</a>
		</div>
		<div class="two">
			${sq.sq_name}社区表白园
		</div>
		<div class="three">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;世上有很多事可以求，唯缘分难求。茫茫人海，浮华世界，多少人真正能寻觅到自己最完美的归属，又有多少人在擦肩而过中错失了最好的机缘。或者又有多少人有正确的选择却站在了错误的时间和地点。有时缘去缘留只在人一念之间。
		<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;佛早就说过：前世五百次的回眸，才换得今生的擦肩而过！所有的一切都有它出现的理由，不必为此而感到惊讶！
		所以：爱Ta就大声说出来！
		<br>
		<a href="${pageContext.request.contextPath}/yxsq/sq/bb_twoPage.action?sqId=${sq.id}">点我进入</a>
		</div>
	</div>
</body>
</html>

