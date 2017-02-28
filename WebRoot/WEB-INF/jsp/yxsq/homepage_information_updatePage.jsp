<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy" uri="/Nohting-tags"%>
<!DOCTYPE html>
<head>
	<title> 修改资料 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/css/homepage_information_updatePage.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<Script type="text/javascript"> 
		$(function(){
			
			/** 用户session失效时跳转到main.html */
			if ("${session_user.nickname}" == "") {
				window.location = "${pageContext.request.contextPath}/yxsq/sq/main.action";
			}else{
				alert("温馨提示：修改资料后，请退出一次再行登陆！");
			}
			
			/** select选中 */
			if ("${user.sex}" == 1) {
				$(".selector_sex").val("1");
			}else{
				$(".selector_sex").val("2");
			}
			
			
			/** 导航条操作 */
			if ("${session_user.nickname}" == "") {
				$(".warp .header .ul_2 .li_1").hide();
				$(".warp .header .ul_2 ._2_li").hide();
			}else{
				$(".warp .header .ul_2 .dl_li").hide();
			}
			
			/** 基本信息修改 */
			$("#jbxxBtn").click(function(){
				var nickname = $("#nickname").val();
				var msg = "";
				if ($.trim(nickname) == "") {
					msg = "请输入昵称！";
				}
				
				if (msg != "") {
					alert(msg);
				}else{
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/yxsq/user/updateHomePageUserMesAjax.action",
						dataType:"json",
						data:$("#jbxxForm").serialize(),
						success:function(json){
							if (json.flag == 1) {
								alert("修改基本资料成功！");
							}
						},
						error:function(){
							alert("异步修改基本资料出错！！");
						}
					});
				}
			});
			
			/** 异步上传图片 */
			$("#txxxBtn").click(function(){
				var tx = $("#tx").val();
				if (tx == "") {
					alert("请选择上传图片！");
				}else{
					$("#txForm").ajaxForm({
						type:"post",
						url:"${pageContext.request.contextPath}/yxsq/user/updateHomePageUserTxAjax.action",
						dataType:"text",
						success:function(imgSrc){
							if (imgSrc != "") {
								$(".warp .content_1 ._3 .txxx ._three").slideDown(5000);
								$(".warp .content_1 ._3 .txxx ._three img").attr("src", "${pageContext.request.contextPath}/images/user/"+imgSrc);
							}
						},
						error:function(){
							alert("修改头像失败~");
						}
					});
				}
			});
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
			<div class="_1">
				<span class="mess">当前位置：个人主页&gt;&gt;个人资料修改</span>	
			</div>
			<div class="_2">
				<div class="jbxx">
					<fieldset style="border:1px dashed; width:400px;margin:20px 0px 20px 300px">
						<legend style="font-size:14px;font-weight:bold;">基本信息修改</legend>
						<form method="post" id="jbxxForm">	
							<input type="hidden" name="userId" value="${session_user.id }"/>
							<ul class="ul_1">
								<li>类别</li>
								<li>昵称</li>
								<li>性别</li>
							</ul>
							<ul class="ul_2">
								<li>修改</li>
								<li><input type="text" name="nickname" value="${user.nickname}" id="nickname" onkeypress="if(event.keyCode==13||event.which==13){return false;}" autocomplete="off"/></li>
								<li>
									<select class="selector_sex" name="sex">
										<option value="1">男</option>
										<option value="2">女</option>
									</select>
								</li>
							</ul>
							<input type="button" value="提交" class="btn_1" id="jbxxBtn"/>
							<input type="reset" value="重置" class="btn_2"/>
						</form>
					</fieldset>
				</div>
			</div>
			<div class="_1_1">
					<span class="mess">当前位置：个人主页&gt;&gt;头像修改</span>	
			</div>
			<div class="_3">
				<div class="txxx">
					<fieldset style="width:960px;border:1px dashed;margin:0px 10px 0px 10px">
						<legend style="font-size:14px;font-weight:bold;">用户头像修改</legend>
						<div class="_one">
							<span class="re">原头像</span>
							<img src="${pageContext.request.contextPath}/images/user/${user.img}" width="150" height="150"/>
						</div>
						<div class="_two">
							<fieldset style="width:220px;float:left;margin:10px 0px 0px 160px;border:1px dotted">
								<legend>修改图片</legend>
								<form id="txForm">
									<input type="hidden" name="userId" value="${session_user.id}"/>
									<input type="hidden" name="imgUrl" value="${user.img}"/>
									<input type="file" class="in_1" name="tx" id="tx"/><br/>
									<input type="submit" value="提交" class="btn_1" id="txxxBtn"/>
								</form>
							</fieldset>
						</div>
						<div class="_three">
							<span class="re">新头像</span>
							<img src="${pageContext.request.contextPath}/images/user/1.jpg" width="150" height="150"/>
						</div>
					</fieldset>
				</div>
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
