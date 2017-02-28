<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy" uri="/Nohting-tags"%>
<!DOCTYPE html>
<head>
	<title> ${sq.sq_name}社区资料修改 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/css/community_information_updatePage.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<Script type="text/javascript"> 
		$(function(){
			/** 导航条操作 */
			if ("${session_user.nickname}" == "") {
				$(".warp .header .ul_2 .li_1").hide();
				$(".warp .header .ul_2 ._2_li").hide();
			}else{
				$(".warp .header .ul_2 .dl_li").hide();
			}
			
			/** 表单操作 */
			$("#updateBtn").click(function(){
				var sq_introduction = $("#sq_introduction").val();
				var sq_logo_img = $("#sq_logo_img").val();
				var sq_img = $("#sq_img").val();
				var msg = "";
				if ($.trim(sq_introduction) == "") {
					msg = "请输入社区简介！";
				}else if ($.trim(sq_logo_img) == "") {
					msg = "请选择社区Logo！";
				}else if ($.trim(sq_img) == "") {
					msg = "请选择社区图片！";
				}
				
				if (msg != "") {
					alert(msg);
				}else{
					$("#updateSqForm").submit();
				}
			});
			
			if ("${tip}" != "") {
				alert("${tip}");
			}
			
			if ("${tip}" == "修改成功！") {
				$(".warp .content_1 .pre").slideDown("slow");
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
				<li class="_2_li"><a href="${pageContext.request.contextPath}/loginout/loginout_3.action?sqName=${sqName}">安全退出</a>&nbsp;|&nbsp;</li>
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
			<div class="mess">当前位置：社区&gt;&gt;社区资料修改</div>
			<div class="form_sr">
				<fieldset style="width:330px;margin-left:10px;">
					<legend>基本资料修改</legend>
					<form action="${pageContext.request.contextPath}/yxsq/sq/updateSqZL.action" method="post" id="updateSqForm" enctype="multipart/form-data">
						<input type="hidden" name="sq_logo_imgUrl" value="${sq.sq_logo_img}"/>
						<input type="hidden" name="sq_imgUrl" value="${sq.sq_img}"/>
						<input type="hidden" name="sqId" value="${sq.id}"/>
						<input type="hidden" name="userId" value="${session_user.id}"/>
						<table>
							<tr>
								<td>当前社区：</td> 
								<td><a href="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq.sq_name}">${sq.sq_name}</a></td> 
							</tr>
							<tr>
								<td>当前用户：</td> 
								<td>${user.nickname}</td> 
							</tr>
							<tr>
								<td>当前角色：</td> 
								<td>
									<s:if test="user.status==1">
										超级管理员
									</s:if>
									<s:elseif test="user.status==2">
										Y主
									</s:elseif>
								</td> 
							</tr>
							<tr>
								<td>社区简介：</td> 
								<td><input type="text" class="in_1" id="sq_introduction" name="sq_introduction" autocomplete="off" value="${sq.sq_introduction}"/></td> 
							</tr>
							<tr>
								<td>社区Logo：</td> 
								<td>
									<input type="file" class="in_2" id="sq_logo_img" name="sq_logo_img"/>
								</td> 
							</tr>
							<tr>
								<td>社区图片：</td> 
								<td>
									<input type="file" class="in_3" id="sq_img" name="sq_img"/>
								</td> 
							</tr>
							<tr>
								<td>
									<input type="button" value="提交" class="btn" id="updateBtn"/>
								</td> 
								<td>
									<input type="reset" value="重置" class="btn"/>
								</td>
							</tr>
						</table>
					</form>
				</fieldset>
			</div>
			<div class="pre">
				<div class="mess">当前位置：社区&gt;&gt;社区资料修改&gt;&gt;图片修改后预览效果</div>
				<img src="${pageContext.request.contextPath}/images/sq_img/${sq.sq_img}" width="980" height="180" class="img_1"/>
				<img src="${pageContext.request.contextPath}/images/sq_img/${sq.sq_logo_img}" width="150" height="150" class="img_2"/>
			</div>
		</div>
		<!-- end_content_1 -->
		<!-- footer start -->
		<div class="footer">
			<span><a href="#">月下</a>&nbsp;|&nbsp;</span>
			<span><a href="#">联系作者</a>&nbsp;|&nbsp;</span>
			<span><a href="#">反馈意见</a>&nbsp;|&nbsp;</span>
			<span><a href="#">欢迎纠错</a>&nbsp;|&nbsp;</span>
			<span><a href="${pageContext.request.contextPath}/main.action">后台管理</a></span><br/>
			<span>&copy;2015-4 For <a href="#">那次心动</a></span>
		</div>
		<!-- end footer -->
</body>
</html>
