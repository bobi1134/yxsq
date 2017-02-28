<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 预览首页homepage.html的12张头部背景图片 -->
		<title>${img.img_title}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<!-- css -->
		<style type="text/css">
			body{font-family:"微软雅黑"}
		</style>
		<!-- js -->
		<script type="text/javascript">
			window.onload = function(){
				if (location.href.indexOf("&xyz=")<0 && location.href.indexOf("t_i_m_e=")<0) {
					location.href = location.href+"?xyz="+Math.random();
				}
			}
		</script>
	</head>
	<body>
		<div style="margin:10px auto;">
			${img.img_title }
		</div>
		<div>
			<img alt="" src="${pageContext.request.contextPath}/images/homepage/${img.img_src}" width="980" height="260">
		</div>
	</body>
</html>