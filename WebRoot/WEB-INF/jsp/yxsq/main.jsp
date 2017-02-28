<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<head>
	<title> 社区选择 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>  
	<!-- css -->
	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
	<script type="text/javascript">
		$(function(){
			/** 点击验证啊图片换一下验证码 */
			$("#vimg").bind({mouseover:function(){$(this).css("cursor", "pointer");}, click:function(){
					$("#vimg").attr("src", "${pageContext.request.contextPath}/verify.action?random=" + Math.random());
			}});
			
			/** 点击进入社区 */
			$("#btn").click(function(){
				var sqName = $("#sqName");
				if ($.trim(sqName.val()) == "") {
					$(".warp .dh .search .tip span").text("亲，请输入社区名字！").css("color","red").addClass("animated shake");
					$(".warp .dh .search .tip span").delay (3000).fadeOut(3000);
				}
				else{
					$("#searchForm").submit();
					//window.location = "${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName="+$("#sqName").val();					
				}
			});
			
			/** 导航条操作 */
			if ("${session_user.nickname}" == "") {
				$(".warp .header .ul_2 .li_1").hide();
				$(".warp .header .ul_2 ._2_li").hide();
			}else{
				$(".warp .header .ul_2 .dl_li").hide();
				
			}
			
			$(".warp .header .ul_2 .dl_li .dl").click(function(){
				$(".tck").addClass("animated bounceIn").show();
				$(".yy").css({"height":$(document).height(),"width":$(window).width()}).show();
				$(".tck .box_1 .qx").click(function(){
					$(".yy").hide();
					$(".tck").hide();
				});
				$("#login").click(function(){
					var username = $("#username");
					var password = $("#password");
					var vcode = $("#vcode");
					if ($.trim(username.val()) == ""){
						$(".tck .box_2 span").text("请输入账号！");
						username.focus();
					}
					else if(!/^[1-9][0-9]{4,10}$/.test(username.val())){
						$(".tck .box_2 span").text("请输入正确的用户名！");
						username.focus();
					}
					else if($.trim(password.val()) == ""){
						$(".tck .box_2 span").text("请输入密码！");
						password.focus();
					}
					else if(!/^\w{6,20}$/.test(password.val())){
						$(".tck .box_2 span").text("密码格式不正确！");
						password.focus();
					}
					else if($.trim(vcode.val()) == ""){
						$(".tck .box_2 span").text("请输入验证码！");
						vcode.focus();
					}
					else if(!/^\d{4}$/.test(vcode.val())){
						$(".tck .box_2 span").text("验证码格式不正确！");
						vcode.focus();
					}
					else{
						$(".tck .box_2 span").text("正在登陆...");
						$.ajax({
							type:"post",
							url:"${pageContext.request.contextPath}/loginAjax.action",
							dataType:"json",
							data:$("#loginForm").serialize(),
							success:function(json){
								if (json.flag != 2) {
									$(".tck .box_2 span").text(json.tip);
									$("#vimg").trigger("click");
								}
								else{
									window.location = "${pageContext.request.contextPath}/yxsq/sq/main.action";
								}
							},
							error:function(){
								$(".tck .box_2 span").text("异步登陆请求失败！");
							}
						});
					}
				});
			});
			
			$("#goAddSqPage").click(function(){
				if ("${session_user.nickname}" == "") {
					$(".tck").addClass("animated bounceIn").show();
					$(".yy").css({"height":$(document).height(),"width":$(window).width()}).show();
					$(".tck .box_1 .qx").click(function(){
						$(".yy").hide();
						$(".tck").hide();
					});
					$("#login").click(function(){
						var username = $("#username");
						var password = $("#password");
						var vcode = $("#vcode");
						if ($.trim(username.val()) == ""){
							$(".tck .box_2 span").text("请输入账号！");
							username.focus();
						}
						else if(!/^[1-9][0-9]{4,10}$/.test(username.val())){
							$(".tck .box_2 span").text("请输入正确的用户名！");
							username.focus();
						}
						else if($.trim(password.val()) == ""){
							$(".tck .box_2 span").text("请输入密码！");
							password.focus();
						}
						else if(!/^\w{6,20}$/.test(password.val())){
							$(".tck .box_2 span").text("密码格式不正确！");
							password.focus();
						}
						else if($.trim(vcode.val()) == ""){
							$(".tck .box_2 span").text("请输入验证码！");
							vcode.focus();
						}
						else if(!/^\d{4}$/.test(vcode.val())){
							$(".tck .box_2 span").text("验证码格式不正确！");
							vcode.focus();
						}
						else{
							$(".tck .box_2 span").text("正在登陆...");
							$.ajax({
								type:"post",
								url:"${pageContext.request.contextPath}/loginAjax.action",
								dataType:"json",
								data:$("#loginForm").serialize(),
								success:function(json){
									if (json.flag != 2) {
										$(".tck .box_2 span").text(json.tip);
										$("#vimg").trigger("click");
									}
									else{
										window.location = "${pageContext.request.contextPath}/yxsq/sq/main.action";
									}
								},
								error:function(){
									$(".tck .box_2 span").text("异步登陆请求失败！");
								}
							});
						}
					});
				}else{
					window.location = "${pageContext.request.contextPath}/yxsq/sq/goAddSqPage.action";
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
		<!-- head start -->
		<div class="dh">
			<div class="img" title="创新，让我们更专业！">
				<img src="${pageContext.request.contextPath}/images/main/head/1.png" class="img_1"/>
				<img src="${pageContext.request.contextPath}/images/main/head/2.png" class="img_2"/>
			</div>
			<div class="search">
				<div class="input">
					<form action="${pageContext.request.contextPath}/yxsq/sq/sqGo.action" method="post" id="searchForm">
						<input type="text" class="input_1" id="sqName" autocomplete="off" onkeypress="if(event.keyCode==13||event.which==13){return false;}" value="${sqName}" name="sqName"/>
						<input type="button" class="input_2" value="进入社区" id="btn"/>
					</form>
				</div>
				<div class="tip">
					<span>
						<s:property value='tip' escape='false'/>
					</span>
				</div>
			</div>
		</div>
		<!-- end head -->
		<!-- content_1 start -->
		<div class="content_1">
			<div class="xt">		
			</div>
			<div class="all">
				<ul>
					<s:iterator value="sqs">
						<a href="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq_name}"><li><s:property value="sq_name"/></li></a>
					</s:iterator>
				</ul>
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
	<!-- 弹出框 start -->
	<div class="tck">
		<div class="box_1">
			<span class="_1">账号密码登陆</span>
			<span class="qx">x</span>
		</div>
		<div class="box_2">
			<form method="post" id="loginForm">
				<span></span>
				<input type="text" placeholder="请输入用户名" class="_1" id="username" name="username" autocomplete="off"/>
				<input type="text" onfocus="this.type='password'" placeholder="请输入密码" class="_2" id="password" name="password" autocomplete="off"/>
				<img src="${pageContext.request.contextPath}/verify.action" id="vimg"/>
				<input type="text" placeholder="验证码" class="_3" id="vcode" name="vcode" autocomplete="off"/>					
				<input type="button" value="登  陆" class="login_input" id="login"/>
			</form>
		</div>
		<div class="box_3">
			<ul>
				<li><a href="#">忘了密码？&nbsp;|&nbsp;</a></li>
				<li><a href="${pageContext.request.contextPath}/yxsq/user/registerUser.action">注册新账号&nbsp;|&nbsp;</a></li>
				<li><a href="#">意见反馈</a></li>
			</ul>
		</div>
	</div>
	<div class="yy">
	</div>
	<!-- end 弹出框 -->
</body>
</html>
