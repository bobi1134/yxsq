<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<title> home_update_tbbjImg_page.jsp </title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pageStyle/css.css"/>
		<style type="text/css">
			body{width:768px;height:542px;border:1px solid #b6c0c9;border-radius:5px;font-family:"微软雅黑";font-size:12px;margin:0px;padding:0px;margin-left:10px;}
			.dqwz{margin-top:5px;}
			.dqwz a{color:#000;text-decoration:none}
			.dqwz a:hover{color:#92afcd;text-decoration:underline;}
			.ss{width:768px;height:514px;border:1px solid #b6c0c9;margin:5px 0px 5px 0px;background-color:#f5f7fa;border-bottom:none;border-left:none;border-right:none}
			.ss .form{width:300px;height:110px;margin:0px auto;}
			.ss .form input{margin-top:10px;width:236px;font-family:"微软雅黑";}
			.ss .form .btn{width:50px;height:25px;font-family:"微软雅黑";border:0 none;background:#5a98de;color:#fff;border-radius: 5px;margin-left:80px}
			.ss .form .btn:hover{cursor: pointer;}
			.ss .form .btn:focus{outline:none;}
		</style>
		<!-- js -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
		<script type="text/javascript">
			$(function(){
				/** 提交信息校验 */
				$("#updateBtn").click(function(){
					var img_title = $("#img_title").val();
					var homeTbImg = $("#homeTbImg").val();
					if (img_title == "") {
						alert("图片信息不能为空！");
					}else if (homeTbImg == "") {
						alert("上传图片不能为空！");
					}else{
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
			<a href="${pageContext.request.contextPath}/admin/img/admin_selectHomeImgs.action">返回</a>
		</div>
		<div class="ss">
			<fieldset style="border:1px dashed;width:400px;margin:100px auto">
				<legend>主页背景图片修改</legend>
				<div class="form">
					<form action="${pageContext.request.contextPath}/admin/img/admin_updateHomeTbBjImg.action" method="post" id="updateForm" enctype="multipart/form-data">
						图片信息：<input type="text" name="img_title" id="img_title" autocomplete="off" value="${img.img_title}"/><br/>
						上传图片：<input type="file" class="file" name="homeTbImg" id="homeTbImg"/>
						<input type="hidden" name="id" value="${img.id}"/>
						<input type="hidden" name="img_src" value="${img.img_src}"/>
						<input type="button" value="提交" class="btn" id="updateBtn"/>
						<input type="reset" value="重置" class="btn"/>
					</form>
				</div>
			</fieldset>
		</div>
	</body>
</html>