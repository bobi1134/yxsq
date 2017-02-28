<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy_2" uri="/Nohting-tags_2"%>
<!DOCTYPE html>
<html>
	<head>
		<title> user.jsp </title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pageStyle/css.css"/>
		<style type="text/css">
			body{width:768px;height:542px;border:1px solid #b6c0c9;border-radius:5px;font-family:"微软雅黑";font-size:12px;margin:0px;padding:0px;margin-left:10px;}
			.dqwz{margin-top:5px;}
			.ss{width:768px;height:57px;border:1px solid #b6c0c9;margin:5px 0px 5px 0px;background-color:#f5f7fa;border-left:none}
			.ss .text_1,.text_2{font-family:"微软雅黑";font-size:12px;}
			.text_1{margin:5px 0px 5px 0px;}
			.btn_1{width:45px;height:20px;border:0 none;background:#3a83f1;border-radius:3px;font-family:"微软雅黑";color:#fff;line-height:20px;}
			.btn_1:hover{cursor:pointer;}
			.btn_1:focus{outline:none}			
			.btn_2{width:80px;height:20px;border:0 none;background:#3a83f1;border-radius:3px;font-family:"微软雅黑";color:#fff;line-height:20px}
			.btn_2:hover{cursor:pointer;}
			.btn_2:focus{outline:none}
		</style>
		<!-- js -->
		<script type="text/javascript">
			/** table表格鼠标放置颜色 */
			function move(row) {
				row.style.backgroundColor = "#ebf0f5";
				row.style.cursor = "pointer";
			}
			function out(row) {
				row.style.backgroundColor = "#ffffff";
			}
			/** 导出会员资料 */
			function excelFn(){
				window.location = "${pageContext.request.contextPath}/admin/user/admin_excelHY.action?username=${username}&nickname=${nickname}";
			}
		</script>
	</head>
	<body>
		<div class="dqwz">
			当前位置：用户管理&gt;&gt;查询用户
		</div>
		<div class="ss">
			<form action="${pageContext.request.contextPath}/admin/user/admin_selectAllUser.action" method="post">
				账号：<input type="text" autocomplete="off" placeholder="账号搜索" class="text_1" name="username" value="${username}"><br>
				昵称：<input type="text" autocomplete="off" placeholder="账号搜索" class="text_2" name="nickname" value="${nickname}"/>
				<input type="submit" value="搜索" class="btn_1"/>
				<input type="button" value="导出Excel" class="btn_2" onclick="excelFn();"/>
			</form>
		</div>
		<table width="100%" border="1" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
			<tr style="background-color:#f5f7fa; color:#1f324d;" align="left" height="25">
				<th>编号</th>
				<th>账号</th>
				<th>昵称</th>
				<th>性别</th>
				<th>角色</th>
				<th>注册时间</th>
				<th colspan="2" align="center">操作</th>
			</tr>
			<s:iterator value="users">
				<tr onMouseOver="move(this);" onMouseOut="out(this);" height="30">
					<td><s:property value="id"/></td>
					<td><s:property value="username"/></td>
					<td><s:property value="nickname"/></td>
					<td>
						<s:if test="sex==1">男</s:if>
						<s:else>女</s:else>
					</td>
					<td>
						<s:if test="status==1">管理员</s:if>
						<s:elseif test="status==2">Y主</s:elseif>
						<s:else>普通会员</s:else>
					</td>
					<td><s:date name="age" format="yyyy-MM-dd"/></td>
					<td align="center"><a href="${pageContext.request.contextPath}/admin/user/admin_updateUserPage.action?userId=${id}"><img src="${pageContext.request.contextPath}/admin_file/images/update.gif" width="15" height="15"/></a></td>
					<td align="center"><a href="#"><img src="${pageContext.request.contextPath}/admin_file/images/delete.gif" width="15" height="15"/></a></td>
				</tr>
			</s:iterator>
		</table>
		<div class="page">
			<xy_2:pager_2 pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.recordCount}" submitUrl="${pageContext.request.contextPath}/admin/user/admin_selectAllUser.action?pageModel.pageIndex={0}&username=${username}&nickname=${nickname}"/>
		</div>
	</body>
</html>