<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy_2" uri="/Nohting-tags_2"%>
<!DOCTYPE html>
<html>
	<head>
		<title> sq.jsp </title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pageStyle/css.css"/>
		<style type="text/css">
			body{width:768px;height:542px;border:1px solid #b6c0c9;border-radius:5px;font-family:"微软雅黑";font-size:12px;margin:0px;padding:0px;margin-left:10px;}
			.dqwz{margin-top:5px;}
			.ss{width:766px;height:57px;border:1px solid #b6c0c9;margin:5px 0px 5px 0px;background-color:#f5f7fa}
			.ss .text_1,.text_2{font-family:"微软雅黑";font-size:12px}
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
			/** 导出社区资料 */
			function excelFn(){
				window.location = "${pageContext.request.contextPath}/admin/sq/admin_excelSQ.action?sq_name=${sq_name}&sq_location=${sq_location}";
			}
		</script>
	</head>
	<body>
		<div class="dqwz">
			当前位置：社区管理&gt;&gt;查询社区
		</div>
		<div class="ss">
			<form action="${pageContext.request.contextPath}/admin/sq/admin_selectAllSq.action" method="post">
				社区名称：<input type="text" autocomplete="off" placeholder="按名称搜索" class="text_1" name="sq_name" value="${sq_name}"><br>
				社区属于：<input type="text" autocomplete="off" placeholder="按省份搜索" class="text_2" name="sq_location" value="${sq_location}"/>
				<input type="submit" value="搜索" class="btn_1"/>
				<input type="button" value="导出Excel" class="btn_2" onclick="excelFn();"/>
			</form>
		</div>
		<table width="100%" border="1" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
			<tr style="background-color:#f5f7fa; color:#1f324d;" align="left" height="25">
				<th>编号</th>
				<th>社区名称</th>
				<th>社区签名</th>
				<th>社区街景</th>
				<th>省份</th>
				<th colspan="2" align="center">操作</th>
			</tr>
			<s:iterator value="sqs">
				<tr onMouseOver="move(this);" onMouseOut="out(this);" height="30">
					<td><s:property value="id"/></td>
					<td><s:property value="sq_name"/></td>
					<td><s:property value="sq_introduction"/></td>
					<td><s:property value="sq_pano"/></td>
					<td><s:property value="sq_location"/></td>
					<td align="center"><a href="${pageContext.request.contextPath}/admin/sq/admin_updateSqPage.action?id=${id}"><img src="${pageContext.request.contextPath}/admin_file/images/update.gif" width="15" height="15"/></a></td>
					<td align="center"><a href="#"><img src="${pageContext.request.contextPath}/admin_file/images/delete.gif" width="15" height="15"/></a></td>
				</tr>
			</s:iterator>
		</table>
		<div class="page">
			<xy_2:pager_2 pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.recordCount}" submitUrl="${pageContext.request.contextPath}/admin/sq/admin_selectAllSq.action?pageModel.pageIndex={0}&sq_name=${sq_name}&sq_location=${sq_location}"/>
		</div>
	</body>
</html>