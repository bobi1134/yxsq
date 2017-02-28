<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 预览首页index.html的导航滚动5张图 -->
		<title>${img.img_title}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="Keywords" content="KeyWords, KeyWords"/>
		<meta name="description" content=""/>
		<meta name="author" content="Nothing"/>
		<style type="text/css">
			body{font-family:"微软雅黑"}
		</style>
	</head>
	<body>
		<div style="margin:10px auto;">
			${img.img_title }
		</div>
		<div>
			<img alt="" src="${img.img_src}" width="692" height="200">
		</div>
	</body>
</html>