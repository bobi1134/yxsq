<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 预览首页index.html的背景设置6张图片 -->
		<title>背景${img.id-5}</title>
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
		<div>
			<img alt="" src="${pageContext.request.contextPath}/images/bg/${img.img_src}" width="780" height="460">
		</div>
	</body>
</html>