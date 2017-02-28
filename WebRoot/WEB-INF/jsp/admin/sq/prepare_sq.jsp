<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy_2" uri="/Nohting-tags_2"%>
<!DOCTYPE html>
<html>
	<head>
		<title> prepare_sq.jsp </title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pageStyle/css.css"/>
		<style type="text/css">
			body{width:768px;height:542px;border:1px solid #b6c0c9;border-radius:5px;font-family:"微软雅黑";font-size:12px;margin:0px;padding:0px;margin-left:10px;}
			.dqwz{margin-top:5px;}
			.ss{width:766px;height:20px;border:1px solid #b6c0c9;margin:5px 0px 5px 0px;background-color:#f5f7fa;line-height:20px}
			.ss ._1 .num{color:red;font-weight:bold;}
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
			/** 导出社区资料 */
			function excelFn(){
				window.location = "${pageContext.request.contextPath}/admin/sq/admin_excelSQ.action?sq_name=${sq_name}&sq_location=${sq_location}";
			}
			
			/** jQuery */
			$(function(){
				/** 区域显示隐藏操作 */
				if ("${prepare_sq_Count}" > 0) {
					$(".ss ._1").show();
					$(".ss ._2").hide();
				}else {
					$(".ss ._1").hide();
					$(".ss ._2").show();
				}
				
				/** 操作提示信息
				if ("${tip}" != "") {
					alert("${tip}");
				} */
			});
		</script>
	</head>
	<body>
		<div class="dqwz">
			当前位置：社区管理&gt;&gt;社区申请处理
		</div>
		<div class="ss">
			<div class="_1">
				您当前有<span class="num">${prepare_sq_Count}</span>条新申请未处理！
				<img src="${pageContext.request.contextPath}/admin_file/images/new.gif" width="33" height="16"/>
			</div>
			<div class="_2">
				您当前没有新申请要处理！您可以<a href="${pageContext.request.contextPath}/admin/sq/admin_selectAllSq.action">查看</a>所有社区！
			</div>
		</div>
		<table width="100%" border="1" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
			<tr style="background-color:#f5f7fa; color:#1f324d;" align="left" height="25">
				<th>编号</th>
				<th>社区名称</th>
				<th>社区签名</th>
				<th>省份</th>
				<th colspan="2" align="center">操作</th>
			</tr>
			<s:iterator value="prepareSqs">
				<tr onMouseOver="move(this);" onMouseOut="out(this);" height="30">
					<td><s:property value="id"/></td>
					<td><s:property value="sq_name"/></td>
					<td><s:property value="sq_introduction"/></td>
					<td><s:property value="sq_location"/></td>
					<td align="center"><a href="${pageContext.request.contextPath}/admin/sq/admin_passPrepareSq.action?id=${id}" onclick="return confirm('你确定允许该社区建立吗？')"><img src="${pageContext.request.contextPath}/admin_file/images/pass.png" width="15" height="15" title="通过"/></a></td>
					<td align="center"><a href="${pageContext.request.contextPath}/admin/sq/admin_failPrepareSq.action?id=${id}" onclick="return confirm('你确定不允许该社区建立吗？')"><img src="${pageContext.request.contextPath}/admin_file/images/fail.png" width="15" height="15" title="不通过"/></a></td>
				</tr>
			</s:iterator>
		</table>
		<div class="page">
			<xy_2:pager_2 pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.recordCount}" submitUrl="${pageContext.request.contextPath}/admin/sq/admin_selectAllPrepareSq.action?pageModel.pageIndex={0}"/>
		</div>
	</body>
</html>