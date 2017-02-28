<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy_2" uri="/Nohting-tags_2"%>
<!DOCTYPE html>
<html>
	<head>
		<title> huo_tz.jsp </title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pageStyle/css.css"/>
		<style type="text/css">
			body{width:768px;height:542px;border:1px solid #b6c0c9;border-radius:5px;font-family:"微软雅黑";font-size:12px;margin:0px;padding:0px;margin-left:10px;}
			a{text-decoration:none;color:#000;}
			a:hover{color:#92afcd;text-decoration:underline;}
			.dqwz{margin-top:5px;}
			.dqwz a{color:#000;text-decoration:none;width:70px;border:0 none;background:#5a98de;color:#fff;border-radius: 5px;display:inline-block;text-align: center;}
			.ss{width:768px;height:57px;border:1px solid #b6c0c9;margin:5px 0px 5px 0px;background-color:#f5f7fa;border-left:none}
			.ss .text_1,.text_2{font-family:"微软雅黑";font-size:12px;}
			.text_1{margin:5px 0px 5px 0px;}
			.btn_1{width:45px;height:20px;border:0 none;background:#3a83f1;border-radius:3px;font-family:"微软雅黑";color:#fff;line-height:20px;}
			.btn_1:hover{cursor:pointer;}
			.btn_1:focus{outline:none}	
					
		</style>
		<!-- js -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
		<script type="text/javascript">
			/** table表格鼠标放置颜色 */
			function move(row) {
				row.style.backgroundColor = "#ebf0f5";
				row.style.cursor = "pointer";
			}
			function out(row) {
				row.style.backgroundColor = "#ffffff";
			}
			
			/** 公告预览 */
			function prevTz(id){
				//window.showModalDialog("${pageContext.request.contextPath}/admin/tz/admin_prevTz.action?id="+id, null, "dialogWidth:650px;dialogHeight:500px");
				window.open ("${pageContext.request.contextPath}/admin/tz/admin_prevTz.action?id="+id, "_blank","height=500,width=650, top=100, left=350");
			}
			
			/** 提示信息 
			if ("${tip}" != "") {
				alert("${tip}");
			}*/
		</script>
	</head>
	<body>
		<div class="dqwz">
			当前位置：帖子管理&gt;&gt;首页精帖管理&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/tz/admin_selectAllIndexJingTz.action" target="content">去精帖管理</a>
			<div style="width:450px;height:12px;float:right;margin-right:10px">
				<marquee scrollAmount="2"><font color="red">${session_user.nickname}</font>，你好！首页目前只能设置最多8条社区热帖！您可以在所有帖子中选取好的帖子设置为热帖，系统会根据您所选择的所有热帖中按照评论的多少抽取前面8条帖子进行展示！如何更换其他评论较少的帖子成为热帖，您可以删除之前的热帖然后重新选择！</marquee>
			</div>
		</div>
		<div class="ss">
			<form action="${pageContext.request.contextPath}/admin/tz/admin_selectAllIndexHuoTz.action" method="post">
				社区：<input type="text" autocomplete="off" placeholder="社区名搜索" class="text_1" name="sqName" value="${sqName}"><br>
				标题：<input type="text" autocomplete="off" placeholder="标题名搜索" class="text_2" name="tzTitle" value="${tzTitle}"/>
				<input type="submit" value="搜索" class="btn_1"/>
			</form>
		</div>
		<table width="100%" border="1" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
			<tr style="background-color:#f5f7fa; color:#1f324d;" align="left" height="25">
				<th>编号</th>
				<th>社区</th>
				<th>帖子标题</th>
				<th>评论总数</th>
				<th>发帖者</th>
				<th colspan="2" align="center">操作</th>
			</tr>
			<s:iterator value="tzs">
				<tr onMouseOver="move(this);" onMouseOut="out(this);" height="30">
					<td><s:property value="id"/></td>
					<td><s:property value="sq.sq_name"/></td>
					<td><s:property value="tz_title"/></td>
					<td><s:property value="remarkCount"/></td>
					<td><s:property value="user.nickname"/></td>
					<td align="center"><a href="javascript:void(0);" title="帖子预览" onclick="prevTz(${id});"><img src="${pageContext.request.contextPath}/admin_file/images/prev.gif" width="15" height="15"/></a></td>
					<td align="center"><a href="${pageContext.request.contextPath}/admin/tz/deleteTohuoTz_2.action?id=${id}" title="取消加火"><img src="${pageContext.request.contextPath}/admin_file/images/huo.png" width="15" height="15" id="jing"/></a></td>
				</tr>
			</s:iterator>
		</table>
		<div class="page">
			<xy_2:pager_2 pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.recordCount}" submitUrl="${pageContext.request.contextPath}/admin/tz/admin_selectAllIndexHuoTz.action?pageModel.pageIndex={0}&sqName=${sqName}&tzTitle=${tzTitle}"/>
		</div>
	</body>
</html>