<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<title> update_user_page.jsp </title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pageStyle/css.css"/>
		<style type="text/css">
			body{width:768px;height:542px;border:1px solid #b6c0c9;border-radius:5px;font-family:"微软雅黑";font-size:12px;margin:0px;padding:0px;margin-left:10px;}
			.dqwz{margin-top:5px;}
			.ss{width:768px;height:514px;border:1px solid #b6c0c9;margin:5px 0px 5px 0px;background-color:#f5f7fa;border-bottom:none;border-left:none;border-right:none}
			.ss .form{width:300px;height:235px;margin:0px auto;}
			.ss .form input{margin-top:10px;width:236px;font-family:"微软雅黑";}
			.selector_sex{margin-top:10px;width:240px;font-family:"微软雅黑";}
			.selector_status{margin-top:10px;width:240px;font-family:"微软雅黑";}
			.ss .form .btn{width:50px;height:25px;font-family:"微软雅黑";border:0 none;background:#5a98de;color:#fff;border-radius: 5px;margin-left:80px}
			.ss .form .btn:hover{cursor: pointer;}
			.ss .form .btn:focus{outline:none;}
		</style>
		<!-- js -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#updateBtn").click(function(){
					var username = $("#username").val();
					var password = $("#password").val();
					var nickname = $("#nickname").val();
					var email = $("#email").val();
					if (username == "") {
						alert("用户名不能为空！");
					}else if (password == "") {
						alert("密码不能为空！");
					}else if (nickname == "") {
						alert("昵称不能为空！");
					}else if (email == "") {
						alert("邮箱不能为空！");
					}else{
						$("#updateForm").submit();;
					}
				});
				
				/** 修改后提示信息 */
				if ("${tip}" != "") {
					alert("${tip}");
				}
				
				/** 性别选择 */
				if ("${user.sex}" == 1) {
					$(".selector_sex").val("1");
				}else{
					$(".selector_sex").val("2");
				}
				
				/** 角色选择 */
				if ("${user.status}" == 1) {
					$(".selector_status").val("1");
				}else if("${user.status}" == 2){
					$(".selector_status").val("2");
				}else{
					$(".selector_status").val("3");
				}
				
				
				
			});
		</script>
	</head>
	<body>
		<div class="dqwz">
			当前位置：用户管理&gt;&gt;修改用户资料
		</div>
		<div class="ss">
			<fieldset style="border:1px dashed;width:400px;margin:100px auto">
				<legend>用户资料修改</legend>
				<div class="form">
					<form action="${pageContext.request.contextPath}/admin/user/admin_updateUser.action" method="post" id="updateForm">
						用户名称：<input type="text" value="${user.username}" name="username" id="username" autocomplete="off"/><br/>
						用户密码：<input type="text" value="${user.password}" name="password" id="password" autocomplete="off"/><br/>
						用户昵称：<input type="text" value="${user.nickname}" name="nickname" id="nickname" autocomplete="off"/><br/>
						用户邮箱：<input type="text" value="${user.email}" name="email" id="email" autocomplete="off"/><br/>
						用户性别：<select class="selector_sex" name="sex">
									<option value="1">男</option>
									<option value="2">女</option>
								</select><br/>
						用户角色：<select class="selector_status" name="status">
									<option value="1">管理员</option>
									<option value="2">Y主</option>
									<option value="3">普通会员</option>
								</select><br/>
						<input type="hidden" name="id" value="${user.id}"/>
						<input type="button" value="提交" class="btn" id="updateBtn"/>
						<input type="reset" value="重置" class="btn"/>
					</form>
				</div>
			</fieldset>
		</div>
	</body>
</html>