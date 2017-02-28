<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> 欢迎使用后台管理系统 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<style type="text/css">
		frameset{min-width:1002px;}
	</style>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript">
		$(function(){
			if (${session_user.status} != 1) {
				//alert("退出。。。");
				window.location = "${pageContext.request.contextPath}/admin/user/admin_loginOut.action";
			}
		});
	</script>
</head>
	<frameset frameborder="no" cols="*,1002,*">
		<frame src=""/>
		<frameset rows="113,*,20">
			<frame src="top.action" scrolling="no"/>
			<frameset cols="220,*">
				<frame src="left.action" scrolling="no"/>
				<frame src="content.action" name="content" scrolling="no"/>
			</frameset>
			<frame src="bottom.action" scrolling="no"/>
		</frameset>
		<frame src=""/>
	</frameset>
</html>
