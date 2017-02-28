<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<head>
	<title> 申请添加社区 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/css/community_addCommunityPage.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript">
		$(function(){
			/** 导航条操作 */
			if ("${session_user.nickname}" == "") {
				$(".warp .header .ul_2 .li_1").hide();
				$(".warp .header .ul_2 ._2_li").hide();
			}else{
				$(".warp .header .ul_2 .dl_li").hide();
			}
			
			/** 登陆 */
			$("#SQBtn").click(function(){
				var sqName = $("#sqName").val();
				var sqIntroduction = $("#sqIntroduction").val();
				var sqLocation = $("#sqLocation").val();
				if (sqName == "") {
					alert("请输入社区名！");
					sqName.focus();
				}else if (sqIntroduction == "") {
					alert("请输入社区签名！");
					sqIntroduction.focus();
				}else if (sqLocation == ""  || sqLocation == "==============请选择===============") {
					alert("请选择归属地！");
				}else{
					$("#SQForm").submit();
				}				
			});
			
			if ("${tip}" != "") {
				alert("${tip}");
			}
			
			if ("${session_user}" == "") {
				window.location = "${pageContext.request.contextPath}/yxsq/sq/main.action";
			}
		});
	</script>
</head>
<body>
	<div class="warp">
		<!-- header start -->
		<div class="header">
			<ul class="ul_1">
				<li>
					<a href="${pageContext.request.contextPath}">
						<i></i>
						<span>首页</span>
					</a>
				</li>
			</ul>
			<ul class="ul_2">
				<li class="li_1">
					<img src="${pageContext.request.contextPath}/images/user/${session_user.img}" width="20" height="20" alt=""/>
					<a href="${pageContext.request.contextPath}/yxsq/user/homepage.action?nickname=${session_user.nickname}">${session_user.nickname}</a>&nbsp;|&nbsp;
				</li>
				<li class="dl_li"><a href="javascript:void(0)" class="dl">登陆</a>&nbsp;|&nbsp;</li>
				<li class="_2_li"><a href="${pageContext.request.contextPath}/loginout/loginout_2.action">安全退出</a>&nbsp;|&nbsp;</li>
				<li class="li_2">
					<a href="#">
						<i></i>
						<span>通知</span>&nbsp;|&nbsp;
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/yxsq/sq/main.action">月下社区</a>
				</li>
			</ul>
		</div>
		<!-- end header -->
		<!-- content_1 start -->
		<div class="content_1">
			<div class="one">
				<span class="one_1">当前位置：社区大门&gt;&gt;申请添加社区</span>
			</div>
			<div class="two">
				<div style="width:980px;height:100px;text-align:center;line-height:100px;">
				</div>
				<fieldset style="width:500px;margin:0px auto;border:1px dashed;">
					<legend style="margin:0px auto;font-size:14px;font-weight:bold;">社区建立申请</legend>
					<form action="${pageContext.request.contextPath}/yxsq/sq/addSqRequest.action" method="post" id="SQForm">
						<ul>
							<li>
								<span>社区名称：</span>
								<input type="text" class="text_1" autocomplete="off" placeholder="社区名称" id="sqName" name="sqName" value="${sqName}"/>
							</li>
							<li>
								<span>社区签名：</span>
								<input type="text" class="text_1" autocomplete="off" placeholder="社区签名" id="sqIntroduction" name="sqIntroduction" value="${sqIntroduction }"/>
							</li>
							<li>
								<span>社区属于：</span>
								<select class="select" name="sqLocation" id="sqLocation" name="sqLocation">
									<option>==============请选择===============</option>
									<option>北京</option>
									<option>上海</option>
									<option>天津</option>
									<option>重庆</option>
									<option>黑龙江</option>
									<option>辽宁</option>
									<option>吉林</option>
									<option>河北</option>
									<option>河南</option>
									<option>湖北</option>
									<option>湖南</option>
									<option>山东</option>
									<option>山西</option>
									<option>陕西</option>
									<option>安徽</option>
									<option>浙江</option>
									<option>江苏</option>
									<option>福建</option>
									<option>广东</option>
									<option>海南</option>
									<option>四川</option>
									<option>广东</option>
									<option>云南</option>
									<option>贵州</option>
									<option>青海</option>
									<option>甘肃</option>
									<option>江西</option>
								</select>
							</li>
							<li>
								<input type="button" value="提交" class="btn" id="SQBtn"/>
								<input type="reset" value="重置" class="btn"/>
							</li>
						</ul>
					</form>
				</fieldset>
			</div>
		</div>
		<!-- end content_1 -->
	</div>
	<!-- footer start -->
	<div class="footer">
		<span><a href="#">月下</a>&nbsp;|&nbsp;</span>
		<span><a href="#">联系作者</a>&nbsp;|&nbsp;</span>
		<span><a href="#">反馈意见</a>&nbsp;|&nbsp;</span>
		<span><a href="#">欢迎纠错</a>&nbsp;|&nbsp;</span>
		<span><a href="${pageContext.request.contextPath}/main.action">后台管理</a></span><br/>
		<span>&copy;2015-4 for <a href="#">那次心动</a></span>
	</div>
	<!-- end footer -->
</body>
</html>
