<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy_2" uri="/Nohting-tags_2"%>
<!DOCTYPE html>
<html>
	<head>
		<title> dh_img.jsp </title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pageStyle/css.css"/>
		<style type="text/css">
			body{width:768px;height:542px;border:1px solid #b6c0c9;border-radius:5px;font-family:"微软雅黑";font-size:12px;margin:0px;padding:0px;margin-left:10px;}
			.dqwz{margin-top:5px;margin-bottom:5px;}
			.dqwz a{color:#000;text-decoration:none;width:80px;border:0 none;background:#5a98de;color:#fff;border-radius: 5px;display:inline-block;text-align: center;}
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
			
			/** 限制链接显示总字符数 */
			$(function(){
				$(".img_src").each(function(){
			        var maxwidth=20;
			        if($(this).text().length>maxwidth){
			            $(this).text($(this).text().substring(0,maxwidth));
			            $(this).html($(this).html()+"...");
			        }
			    });
				
				$(".img_href").each(function(){
			        var maxwidth=20;
			        if($(this).text().length>maxwidth){
			            $(this).text($(this).text().substring(0,maxwidth));
			            $(this).html($(this).html()+"...");
			        }
			    });
				
				$(".img_title").each(function(){
			        var maxwidth=20;
			        if($(this).text().length>maxwidth){
			            $(this).text($(this).text().substring(0,maxwidth));
			            $(this).html($(this).html()+"...");
			        }
			    });
			});
			
			/** 首页滚动图片预览 */
			function prevImg_1(id){
				//alert(id);
				window.open ("${pageContext.request.contextPath}/admin/img/admin_prevImg_1.action?id="+id, "_blank","height=250,width=800, top=200, left=300");
			}
			
			function prevImg_2(id){
				window.open ("${pageContext.request.contextPath}/admin/img/admin_prevImg_2.action?id="+id, "_blank","height=480,width=800, top=100, left=280");
			}
		</script>
	</head>
	<body>
		<div class="dqwz">
			当前位置：图片管理&gt;&gt;首页图片&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/img/admin_selectdhImg.action">导航图片操作</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/img/admin_selectbjImg.action">背景图片操作</a>
		</div>
		<table width="100%" border="1" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
			<tr style="background-color:#f5f7fa; color:#1f324d;" align="left" height="25">
				<th>编号</th>
				<th>图片链接</th>
				<th>图片链接</th>
				<th>图片信息</th>
				<th align="center" colspan="2">操作</th>
			</tr>
			<s:iterator value="imgs">
				<tr onMouseOver="move(this);" onMouseOut="out(this);" height="30">
					<td><s:property value="id"/></td>
					<td class="img_src" title="${img_src }"><s:property value="img_src"/></td>
					<td class="img_href" title="${img_href }"><s:property value="img_href"/></td>
					<td class="img_title" title="${img_title}"><s:property value="img_title"/></td>
					<td align="center"><a href="javascript:void(0);" title="预览" onclick="prevImg_1(${id});"><img src="${pageContext.request.contextPath}/admin_file/images/prev.gif" width="15" height="15"/></a></td>
					<td align="center"><a href="${pageContext.request.contextPath}/admin/img/admin_selectAllImgTz.action?id=${id}" title="更换"><img src="${pageContext.request.contextPath}/admin_file/images/jh.png" width="15" height="15"/></a></td>
				</tr>
			</s:iterator>
		</table>
		<div class="page">
			<xy_2:pager_2 pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.recordCount}" submitUrl="${pageContext.request.contextPath}/admin/img/admin_selectdhImg.action?pageModel.pageIndex={0}"/>
		</div>
	</body>
</html>