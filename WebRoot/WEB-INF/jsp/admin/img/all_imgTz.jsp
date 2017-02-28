<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy_2" uri="/Nohting-tags_2"%>
<!DOCTYPE html>
<html>
	<head>
		<title> all_imgTz.jsp </title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pageStyle/css.css"/>
		<style type="text/css">
			body{width:768px;height:542px;border:1px solid #b6c0c9;border-radius:5px;font-family:"微软雅黑";font-size:12px;margin:0px;padding:0px;margin-left:10px;}
			.dqwz{margin-top:5px;margin-bottom:5px;}
			.dqwz a{color:#000;text-decoration:none}
			.dqwz a:hover{color:#92afcd;text-decoration:underline;}
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
			
			$(function(){
				if ("${tip}" != "") {
					alert("${tip}");
				}
			});
		</script>
	</head>
	<body>
		<div class="dqwz">
			<a href="${pageContext.request.contextPath}/admin/img/admin_selectdhImg.action">返回</a>
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
					<td align="center"><a href="${pageContext.request.contextPath}/admin/img/admin_dhOk.action?ghId=${ghId}&okId=${id}" title="确认更换"><img src="${pageContext.request.contextPath}/admin_file/images/qdgh.jpg" width="15" height="15"/></a></td>
				</tr>
			</s:iterator>
		</table>
		<div class="page">
			<xy_2:pager_2 pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.recordCount}" submitUrl="${pageContext.request.contextPath}/admin/tz/admin_selectAllImgTz.action?pageModel.pageIndex={0}"/>
		</div>
	</body>
</html>