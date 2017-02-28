<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy_2" uri="/Nohting-tags_2"%>
<!DOCTYPE html>
<html>
	<head>
		<title> tz.jsp </title>
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
			当前位置：帖子管理&gt;&gt;查询帖子
		</div>
		<div class="ss">
			<form action="${pageContext.request.contextPath}/admin/tz/admin_selectAllTz.action" method="post">
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
				<th colspan="4" align="center">操作</th>
			</tr>
			<s:iterator value="tzs">
				<tr onMouseOver="move(this);" onMouseOut="out(this);" height="30">
					<td><s:property value="id"/></td>
					<td><s:property value="sq.sq_name"/></td>
					<td><s:property value="tz_title"/></td>
					<td><s:property value="remarkCount"/></td>
					<td><s:property value="user.nickname"/></td>
					<td align="center"><a href="javascript:void(0);" title="帖子预览" onclick="prevTz(${id});"><img src="${pageContext.request.contextPath}/admin_file/images/prev.gif" width="15" height="15"/></a></td>
					<s:if test="status==1">
						<td align="center"><a href="${pageContext.request.contextPath}/admin/tz/deleteTojingTz.action?id=${id}&pageIndex=${pageModel.pageIndex}&pageSize=${pageModel.pageSize}&recordCount=${pageModel.recordCount}" title="取消加精"><img src="${pageContext.request.contextPath}/admin_file/images/jing.gif" width="15" height="15" id="jing"/></a></td>
					</s:if>
					<s:else>
						<td align="center"><a href="${pageContext.request.contextPath}/admin/tz/addTojingTz.action?id=${id}&pageIndex=${pageModel.pageIndex}&pageSize=${pageModel.pageSize}&recordCount=${pageModel.recordCount}" title="首页加精"><img src="${pageContext.request.contextPath}/admin_file/images/jing.jpg" width="15" height="15" id="jing"/></a></td>
					</s:else>
					
					<s:if test="status==2">
						<td align="center"><a href="${pageContext.request.contextPath}/admin/tz/deleteTohuoTz.action?id=${id}&pageIndex=${pageModel.pageIndex}&pageSize=${pageModel.pageSize}&recordCount=${pageModel.recordCount}" title="取消首页加火"><img src="${pageContext.request.contextPath}/admin_file/images/huo.png" width="15" height="15"/></a></td>
					</s:if>
					<s:else>
						<td align="center"><a href="${pageContext.request.contextPath}/admin/tz/addTohuoTz.action?id=${id}&pageIndex=${pageModel.pageIndex}&pageSize=${pageModel.pageSize}&recordCount=${pageModel.recordCount}" title="首页加火"><img src="${pageContext.request.contextPath}/admin_file/images/huo.jpg" width="15" height="15"/></a></td>
					</s:else>
					<td align="center"><a href="#" title="删除"><img src="${pageContext.request.contextPath}/admin_file/images/delete.gif" width="15" height="15"/></a></td>
				</tr>
			</s:iterator>
		</table>
		<div class="page">
			<xy_2:pager_2 pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.recordCount}" submitUrl="${pageContext.request.contextPath}/admin/tz/admin_selectAllTz.action?pageModel.pageIndex={0}&sqName=${sqName}&tzTitle=${tzTitle}"/>
		</div>
	</body>
</html>