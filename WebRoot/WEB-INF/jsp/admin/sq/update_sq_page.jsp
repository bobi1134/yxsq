<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<title> update_sq_page.jsp </title>
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
			.ss .form{width:300px;height:160px;margin:0px auto}
			.ss .form input{margin-top:10px;width:236px;font-family:"微软雅黑";}
			.ss .form .btn{width:50px;height:25px;font-family:"微软雅黑";border:0 none;background:#5a98de;color:#fff;border-radius: 5px;margin-left:80px}
			.ss .form .btn:hover{cursor: pointer;}
			.ss .form .btn:focus{outline:none;}
		</style>
		<!-- js -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#updateBtn").click(function(){
					var sq_name = $("#sq_name").val();
					var sq_introduction = $("#sq_introduction").val();
					var sq_location = $("#sq_location").val();
					var sq_pano = $("#sq_pano").val();
					if (sq_name == "") {
						alert("社区名称不能为空！");
					}else if (sq_introduction == "") {
						alert("社区签名不能为空！");
					}else if (sq_location == "") {
						alert("社区省份不能为空！");
					}else if (sq_pano == "") {
						alert("社区街景不能为空！");
					}else {
						$("#updateForm").submit();	
					}
				});
				
				/** 修改后提示信息 */
				if ("${tip}" != "") {
					alert("${tip}");
				}
			});
		</script>
	</head>
	<body>
		<div class="dqwz">
			当前位置：社区管理&gt;&gt;修改社区资料
		</div>
		<div class="ss">
			<fieldset style="border:1px dashed;width:400px;margin:100px auto">
				<legend>社区资料修改</legend>
				<div class="form">
					<form action="${pageContext.request.contextPath}/admin/sq/updateSq.action" method="post" id="updateForm">
						社区名称：<input type="text" value="${sq.sq_name}" name="sq_name" id="sq_name" autocomplete="off"/><br/>
						社区简介：<input type="text" value="${sq.sq_introduction }" name="sq_introduction" id="sq_introduction" autocomplete="off"/><br/>
						社区省份：<input type="text" value="${sq.sq_location }" name="sq_location" id="sq_location" autocomplete="off"/><br/>
						社区街景：<input type="text" value="${sq.sq_pano }" name="sq_pano" id="sq_pano" autocomplete="off"/><br/>
						<input type="hidden" name="id" value="${sq.id}"/>
						<input type="button" value="提交" class="btn" id="updateBtn"/>
						<input type="reset" value="重置" class="btn"/>
					</form>
				</div>
			</fieldset>
		</div>
	</body>
</html>