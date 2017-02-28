<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title> left.html </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<!-- css -->
	<link href="${pageContext.request.contextPath}/admin_file/css/main.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript">	
		$(function(){
			$("#1").click(function(){
				$("#1").hide();
				$("#2").show();
				$("#_2").slideDown("slow");
			});
			$("#2").click(function(){
				$("#2").hide();
				$("#1").show();
				$("#_2").slideUp("slow");
			});

			$("#3").click(function(){
				$("#3").hide();
				$("#4").show();
				$("#_3").slideDown("slow");
			});
			$("#4").click(function(){
				$("#4").hide();
				$("#3").show();
				$("#_3").slideUp("slow");
			});

			$("#5").click(function(){
				$("#5").hide();
				$("#6").show();
				$("#_4").slideDown("slow");
			});
			$("#6").click(function(){
				$("#6").hide();
				$("#5").show();
				$("#_4").slideUp("slow");
			});
		});
	</script>
</head>
<body>
	<div class="left">
		<ul class="ul">
			<li>
				<div class="menu">
					<img src="${pageContext.request.contextPath}/admin_file/images/top_7.jpg" width="14" height="14" class="img_2" style="display:block"/>
					<span>用户管理</span>
				</div>				
				<ul class="menu_two" id="_1">
					<li><a href="${pageContext.request.contextPath}/admin/user/admin_selectAllUser.action" target="content" title="查询用户">查询用户</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/user/admin_addUserPage.action" target="content" title="添加用户">添加用户</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/user/admin_selectAllPrepareUserYZ.action" target="content" title="用户申请">用户申请</a></li>
				</ul>
			</li>
			<li>
				<div class="menu">
					<img src="${pageContext.request.contextPath}/admin_file/images/top_6.jpg" width="14" height="14" class="img_1" id="1"/>
					<img src="${pageContext.request.contextPath}/admin_file/images/top_7.jpg" width="14" height="14" class="img_2" id="2"/>
					<span>社区管理</span>
				</div>				
				<ul class="menu_two" id="_2">
					<li><a href="${pageContext.request.contextPath}/admin/sq/admin_selectAllSq.action" target="content" title="查询社区">查询社区</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/sq/admin_selectAllPrepareSq.action" target="content" title="社区申请">社区申请</a></li>
				</ul>
			</li>
			<li>
				<div class="menu">
					<img src="${pageContext.request.contextPath}/admin_file/images/top_6.jpg" width="14" height="14" class="img_1" id="3"/>
					<img src="${pageContext.request.contextPath}/admin_file/images/top_7.jpg" width="14" height="14" class="img_2" id="4"/>
					<span>帖子管理</span>
				</div>				
				<ul class="menu_two" id="_3">
					<li><a href="${pageContext.request.contextPath}/admin/tz/admin_selectAllTz.action" target="content" title="查询帖子">查询帖子</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/tz/admin_selectAllIndexJingTz.action" target="content" title="首页帖子">首页帖子</a></li>
				</ul>
			</li>
			<li>
				<div class="menu">
					<img src="${pageContext.request.contextPath}/admin_file/images/top_6.jpg" width="14" height="14" class="img_1" id="5"/>
					<img src="${pageContext.request.contextPath}/admin_file/images/top_7.jpg" width="14" height="14" class="img_2" id="6"/>
					<span>图片管理</span>
				</div>				
				<ul class="menu_two" id="_4">
					<li><a href="${pageContext.request.contextPath}/admin/img/admin_selectImgs.action" target="content" title="首页图片">首页图片</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/img/admin_selectHomeImgs.action" target="content" title="主页图片">主页图片</a></li>
				</ul>
			</li>
		</ul>

		<div class="reamrk">
			<span>月下社区后台管理系统&nbsp;&nbsp;版本：1.0</span>
			<span>建议分辨率：1024*768</span>
			<span>技术支持：Nothing</span>
			<span>因为创新，所以专业。</span>
			<span>因为心动，所以坚持。</span>
			<span style="text-align:right">--&nbsp;XLB</span>
		</div>
	</div>
</body>
</html>
