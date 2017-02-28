<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy_2" uri="/Nohting-tags_2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title> ${sq.sq_name}表白墙 | 月下社区 </title>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pageStyle/css.css"/>
	<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
		body{font-size:12px;font-family:"微软雅黑";color:#666;background:url(${pageContext.request.contextPath}/images/bb/bg.jpg)}
		a{text-decoration:none;color:#666;}
		a:hover{text-decoration:underline}
		ul{list-style:none}
		.main{margin:0px auto;width:1202px;height:740px;}
		.one a{color:#fec2db;color:#fff}
		.two{width:500px;height:110px;margin:0px auto;margin-top:60px;}
		.two .text{width:400px;height:80px;background:#fff;border-radius:5px;}
		.two .cz{width:400px;height:30px;line-height:25px;font-size:14px;}
		.two .cz span{float:left;margin-top:5px;color:#f793b5;}
		.two .cz span:hover{color:#fff}
		.two .cz a{width:80px;height:25px;display:block;
				 text-align:center;line-height:25px;font-size:14px;
				 text-decoration:none;color:#f793b5;
				 border:1px solid #f793b5;border-radius:15px;float:right;margin-top:5px}
		.two .cz a:hover{background:#f793b5;color:#fff;}
		.three{width:1130px;margin:0px auto;margin-top:20px;overflow:hidden;height:440px;}
		.three ul li{width:197px;height:200px;background:url(${pageContext.request.contextPath}/images/bb/bq.png);position: relative;}
		.three ul li{float:left;margin:5px 0px 5px 20px;}
		.three ul li .content{width: 128px;height: 125px;position: absolute;top: 43px;left: 28px;}
		.three ul li .content span{width:128px;height:15px; green;text-align:right;line-height:15px;display:block;position: absolute;top: 108px;}
		
		/* 弹出框 start */
		.tck{width:334px;height:387px;background:#F5F5DC;position: absolute;top:140px;left:472px;z-index:2;border-radius:5px;border: 1px solid #999;display:none}
		.tck .box_1 ._1{width:334px;height:51px;display:block;border-bottom: 1px solid #999;text-align:center;line-height:51px;font-size:18px;}
		.tck .box_1 .qx{width:16px;height:16px;background:#5E5E5E;display:block;float:right;margin:-53px -1px 0px 0px;text-align:center;line-height:13px;border-radius:8px;color:#fff;}
		.tck .box_1 .qx:hover{cursor:pointer}
		.tck .box_2{width:334px;height:260px;}
		.tck .box_2 span{width:284px;height:16px;margin:12px 0px 0px 25px;display:block;color:red}
		.tck .box_2 ._1{width:284px;height:40px;margin:2px 0px 0px 25px;font-family:"微软雅黑";}
		.tck .box_2 ._2{width:284px;height:40px;margin:20px 0px 0px 25px;font-family:"微软雅黑";}
		.tck .box_2 .login_input{width:284px;height:40px;margin:20px 0px 0px 25px;font-family:"微软雅黑";border:0 none;background:#5a98de;color:#fff;font-size:18px;border-radius: 5px}
		.tck .box_2 .login_input:hover{cursor:pointer;background-color: #6aa2e0;}
		.tck .box_2 .login_input:focus{outline:none;}
		.tck .box_2 img{width:180px;height:40px;margin:20px 0px 0px 25px;}
		.tck .box_2 ._3{width:82px;height:36px;margin:20px 22px 0px 0px;float:right;font-family:"微软雅黑";}
		.tck .box_3{width:334px;height:30px;margin-top:31px;}
		.tck .box_3 ul{margin:0px 0px 0px 118px;font-size:12px;}
		.tck .box_3 ul li{float:left}
		.yy{width:1348px;height:2060px;background:#000;position: absolute;top:0px;left:0px;right:0px;bottom:0px;opacity:0.2;z-index:1;display:none}
		/* end 弹出框 */
	</style>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/snowfall.jquery.js"></script> 
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main").snowfall('clear');
			$(".main").snowfall({
				image: "${pageContext.request.contextPath}/images/bb/xh.png",
				flakeCount:30,
				minSize: 10,
				maxSize: 60,				
				maxSpeed : 1
			});
		});

		$(function(){
			$("#bb").click(function(){
				//var info = $(".two .text").html();
				//var info = document.getElementById("biaobaiText").innerText;
				var info = document.getElementById("biaobaiText").innerHTML;
				//alert();
				if (info == undefined  || info == null || info == "") {
					alert("表白内容怎么可以为空！(*^__^*) 嘻嘻……");
				}else{
					if ("${session_user.id}" == "") {
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
											window.location = "${pageContext.request.contextPath}/yxsq/sq/bb_twoPage.action?sqId=${sq.id}&bb_content="+info;
										}
									},
									error:function(){
										$(".tck .box_2 span").text("异步登陆请求失败！");
									}
								});
							}
						});
					}else{
						var url = encodeURI(encodeURI("${pageContext.request.contextPath}/yxsq/sq/addBb.action?sqId=${sq.id}&bb_user=${session_user.nickname}&bb_content="+info));
						$.ajax({
							type:"post",
							url:url,
							dataType:"json",
							success:function(json){
								if (json.flag == 1) {
									$(".three ul").prepend("<li> <div class='content'>"+info+"<br/> <span>--${session_user.nickname}</span> </div> </li>");
									$(".three ul li:first-child").addClass("animated rollIn");
									$(".two .text").html("");
								}
							},
							error:function(){
								$(".tck .box_2 span").text("异步表白请求失败！");
							}
						});
					}
				}
			});
		});
	</script>
</head>
<body>
	<audio src="${pageContext.request.contextPath}/music/jgw.mp3" hidden="true" autoplay="true" loop="true"></audio>
	<div class="main">
		<div class="one">
			<a href="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq.sq_name}">返回${sq.sq_name}社区</a>
		</div>
		<div class="two">
			<div class="text" contentEditable="true" id="biaobaiText">
					${bb_content }	
			</div>
			<div class="cz">
				<span>30字以内</span>
				<a href="javascript:void(0)" id="bb">表白</a>
			</div>
		</div>
		<div class="three">
			<ul>
				<s:iterator value="bbs">
					<li>
						<div class="content">
							<s:property value="bb_content"/><br/>
							<span>--<s:property value="bb_user"/></span>
						</div>
					</li>
				</s:iterator>
			</ul>
		</div>
		<div style="width:1130px;height:65px;margin:0px auto;margin-top:20px">
			<xy_2:pager_2 pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.recordCount}" submitUrl="${pageContext.request.contextPath}/yxsq/sq/bb_twoPage.action?pageModel.pageIndex={0}&sqId=${sq.id}"/>
		</div>
	</div>
	
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
				<li><a href="#">注册新账号&nbsp;|&nbsp;</a></li>
				<li><a href="#">意见反馈</a></li>
			</ul>
		</div>
	</div>
	<div class="yy">
	</div>
	<!-- end 弹出框 -->
</body>
</html>

