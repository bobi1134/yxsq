<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title> 用户注册 | 月下社区 </title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
		<!-- css -->
		<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet" type="text/css"/>
		<style type="text/css">
			*{margin:0px;padding:0px;}
			body{font-size:12px;font-family:"微软雅黑";color:#666;background:#dceffe}
			a{text-decoration:none;color:#666;}
			a:hover{color:#92afcd}
			ul{list-style:none}
			img{border:none}
			
			.main{width:980px;margin:0px auto;position: relative;min-width:980px;}
			.main .zc{width:390px;height:485px;border:1px solid #999;margin:50px auto;border-radius:5px;background:#F5F5DC;}
			.main .zc .one{width:390px;height:50px;}
			.main .zc .one ._1{width:200px;height:50px;float:left;font-size:30px;color:#fff;text-align:center;line-height:50px}
			.main .zc .one ._2{width:80px;height:50px;float:left;font-size:16px;color:#fff;line-height:65px}
			.main .zc .one ._3{width:80px;height:50px;float:left;font-size:16px;line-height:65px}
			.main .zc .one ._3 a{color:#fff;}
			.main .zc .one ._3 a:hover{text-decoration:underline;}
			
			
			.main .zc .two{width:390px;height:250px;}
			.main .zc .two .text{width:386px;height:40px;font-family:"微软雅黑"}
			.main .zc .two .yzm{width:390px;height:40px;margin-bottom:20px;}
			.main .zc .two .yzm img{width:200px;height:40px;float:left}
			.main .zc .two .yzm .yzm_text{width:180px;height:36px;float:right;font-family:"微软雅黑"}
			.main .zc .two .zc_text{width:390px;height:40px;font-family:"微软雅黑";border:0 none;background:#5a98de;color:#fff;font-size:18px;border-radius: 5px;margin-top:10px}
			.main .zc .two .zc_text:hover{cursor:pointer;background-color: #6aa2e0;}
			.main .zc .two .zc_text:focus{outline:none;}
			
			.main .zc .two .tip_k{width:390px;height:20px;margin-bottom:5px;}
			.main .zc .two .tip_k .tip_1{width:390px;display:block;text-align:center;color: red}
			.main .zc .two .tip_k .tip_2{width:390px;display:block;text-align:center;color: red}
			.main .zc .two .tip_k .tip_3{width:390px;display:block;text-align:center;color: red}
			.main .zc .two .tip_k .tip_4{width:390px;display:block;text-align:center;color: red}
			.main .zc .two .tip_k .tip_5{width:390px;display:block;text-align:center;color: red}
			.main .zc .two .tip_k .tip_6{width:390px;display:block;text-align:center;color: red}
			.main .zc .two .tip_k img{margin-left:180px;display:none}
			
			.footer{width:980px;height:50px;margin:0px auto;text-align:center;}
		</style>
		<!-- js -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
		<script type="text/javascript">
			$(function(){
				/** 鼠标点击验证码图片 */
				$("#vimg").bind({mouseover:function(){$(this).css("cursor", "pointer");}, click:function(){
					$("#vimg").attr("src", "${pageContext.request.contextPath}/verify.action?random=" + Math.random());
				}});
				
				/** 点击立即注册 */
				$("#registerBtn").click(function(){
					var username = $("#username").val();
					var password = $("#password").val();
					var nickname = $("#nickname").val();
					var email = $("#email").val();
					var yzm = $("#yzm").val();
					if (username == "") {
						$(".main .tip_k .tip_1").text("请输入用户名！").addClass("animated rubberBand");
					}else if (password == "") {
						$(".main .tip_k .tip_2").text("请输入密码！").addClass("animated rubberBand");
					}else if (nickname == "") {
						$(".main .tip_k .tip_3").text("请输入昵称！").addClass("animated rubberBand");
					}else if (email == "") {
						$(".main .tip_k .tip_4").text("请输入邮箱！").addClass("animated rubberBand");
					}else if (yzm == "") {
						$(".main .tip_k .tip_5").text("请输入验证吗！").addClass("animated rubberBand");
					}else{
						$("#registerForm").submit();
					}
				});
				
				/** 验证码提示 */
				if ("${tip}" != "") {
					alert("${tip}");
				}
			});
			
			function jyFunction(id){
				var id_j = "#" + id.valueOf();
				var id_j_val = $(id_j).val();
				//var idName = $(id).val();
				//alert(idName);
				if (id == "username") {
					if (id_j_val == "") {
						$(".main .tip_k .tip_1").text("请输入用户名！").addClass("animated rubberBand");
					}else if (!/^[1-9][0-9]{4,10}$/.test(id_j_val)) {
						$(".main .tip_k .tip_1").text("用户名只能为5-10位纯数字！").addClass("animated rubberBand");
					}else{
						/** 异步查询用户名是否重复！ */
						$.ajax({
							type:"post",
							url:"${pageContext.request.contextPath}/yxsq/user/check_usernameAjax.action?username="+id_j_val,
							dataType:"json",
							success:function(json){
								if (json.flag == 1) {
									$(".main .tip_k .img_1").hide();
									$(".main .tip_k .tip_1").text("用户名已经存在，请更换！").addClass("animated rubberBand").show();
								}else{
									if (/^[1-9][0-9]{4,10}$/.test(id_j_val)) {
										$(".main .tip_k .tip_1").hide();
										$(".main .tip_k .img_1").show();
									}
								}
							},
							error:function(){
								alert("异步查询用户名是否重复失败！");
							}
						});
					}
				}else if(id == "password"){
					if (id_j_val == "") {
						$(".main .tip_k .tip_2").text("请输入密码！").addClass("animated rubberBand");
					}else if (!/^[0-9a-zA-Z]{6,10}$/.test(id_j_val)) {
						$(".main .tip_k .tip_2").text("密码只能为6-10位字母、数字！").addClass("animated rubberBand");
					}
					
					if (/^[0-9a-zA-Z]{6,10}$/.test(id_j_val)) {
						$(".main .tip_k .tip_2").hide();
						$(".main .tip_k .img_2").show();
					}
				}else if (id == "nickname") {
					if (id_j_val == "") {
						$(".main .tip_k .tip_3").text("请输入昵称！").addClass("animated rubberBand");
					}else{
						/** 异步查询昵称是否重复！ */
						var url = encodeURI(encodeURI("${pageContext.request.contextPath}/yxsq/user/check_nicknameAjax.action?nickname="+id_j_val));
						$.ajax({
							type:"post",
							url:url,
							dataType:"json",
							success:function(json){
								if (json.flag == 1) {
									alert("存在！");
									$(".main .tip_k .img_3").hide();
									$(".main .tip_k .tip_3").text("昵称已经存在，请更换！").addClass("animated rubberBand").show();
								}else{
									alert("不存在！");
									$(".main .tip_k .tip_3").hide();
									$(".main .tip_k .img_3").show();
								}
							},
							error:function(){
								alert("异步查询昵称是否重复失败！");
							}
						});
					}
				}else if (id == "email") {
					if (id_j_val == "") {
						$(".main .tip_k .tip_4").text("请输入邮箱！").addClass("animated rubberBand");
					}else if (!/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/.test(id_j_val)) {
						$(".main .tip_k .tip_4").text("请输入正确的邮箱格式！").addClass("animated rubberBand");
					}else{
						/** 异步查询邮箱是否重复！ */
						$.ajax({
							type:"post",
							url:"${pageContext.request.contextPath}/yxsq/user/check_emailAjax.action?email="+id_j_val,
							dataType:"json",
							success:function(json){
								if (json.flag == 1) {
									$(".main .tip_k .img_4").hide();
									$(".main .tip_k .tip_4").text("邮箱已经被注册，请更换！").addClass("animated rubberBand").show();
								}else{
									if (/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/.test(id_j_val)) {
										$(".main .tip_k .tip_4").hide();
										$(".main .tip_k .img_4").show();
									}
								}
							},
							error:function(){
								alert("异步查询邮箱是否重复失败！");
							}
						});
					}
				}else if (id == "yzm") {
					if (id_j_val == "") {
						$(".main .tip_k .tip_5").text("请输入验证吗！").addClass("animated rubberBand");
					}else if (!/^\d{4}$/.test(id_j_val)) {
						$(".main .tip_k .tip_5").text("请输入4位数字验证码！").addClass("animated rubberBand");
					}
					
					if (/^\d{4}$/.test(id_j_val)) {
						$(".main .tip_k .tip_5").hide();
						$(".main .tip_k .img_5").show();
					}
				}
			}
		</script>
	</head>
	<body>
		<div class="main">
			<div class="zc">
				<div class="one">
					<div class="_1">月下社区</div>
					<div class="_2">用户注册</div>
					<div class="_3"><a href="${pageContext.request.contextPath}">返回首页</a></div>
				</div>
				<div class="tip_k">
					<span class="tip_mes"></span>
				</div>
				<div class="two">
					<form action="${pageContext.request.contextPath}/yxsq/user/addUser.action" method="post" id="registerForm">
						<input type="text" class="text" placeholder="请输入用户名" autocomplete="off" id="username" name="username" onblur="jyFunction(this.id);" value="${username}"/>
						<div class="tip_k">
							<span class="tip_1"></span>
							<img src="${pageContext.request.contextPath}/images/ok.gif" class="img_1"/>
						</div>
						<input type="text" class="text" onfocus="this.type='password'" placeholder="请输入密码" autocomplete="off" id="password" name="password" onblur="jyFunction(this.id);"/>
						<div class="tip_k">
							<span class="tip_2"></span>
							<img src="${pageContext.request.contextPath}/images/ok.gif" class="img_2"/>
						</div>
						<input type="text" class="text" placeholder="请输入昵称" autocomplete="off" id="nickname" name="nickname" onblur="jyFunction(this.id);" value="${nickname}"/>
						<div class="tip_k">
							<span class="tip_3"></span>
							<img src="${pageContext.request.contextPath}/images/ok.gif" class="img_3"/>
						</div>
						<input type="text" class="text" placeholder="请输入邮箱" autocomplete="off" id="email" name="email" onblur="jyFunction(this.id);" value="${email}"/>
						<div class="tip_k">
							<span class="tip_4"></span>
							<img src="${pageContext.request.contextPath}/images/ok.gif" class="img_4"/>
						</div>
						<div class="yzm">
							<img src="${pageContext.request.contextPath}/verify.action" id="vimg"/>
							<input type="text" class="yzm_text" placeholder="请输入验证码" autocomplete="off" id="yzm" name="yzm" onblur="jyFunction(this.id);"/>
						</div>
						<div class="tip_k">
							<span class="tip_5"></span>
							<img src="${pageContext.request.contextPath}/images/ok.gif" class="img_5"/>
						</div>
						<input type="button" class="zc_text" value="立即注册" id="registerBtn"/>
					</form>
				</div>				
			</div>	
		</div>
		<div class="footer">
			<span><a href="#">月下</a>&nbsp;|&nbsp;</span>
			<span><a href="#">联系作者</a>&nbsp;|&nbsp;</span>
			<span><a href="#">反馈意见</a>&nbsp;|&nbsp;</span>
			<span><a href="#">欢迎纠错</a>&nbsp;|&nbsp;</span>
			<span><a href="${pageContext.request.contextPath}/main.action">后台管理</a></span><br/>
			<span>&copy;2015-4 For <a href="#">那次心动</a></span><br/>
			<span>Register Version 1.0</span>
		</div>
	</body>
</html>