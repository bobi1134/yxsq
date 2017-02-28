<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy" uri="/Nohting-tags"%>
<!DOCTYPE html>
<head>
	<title> homepage_information_updatePage.html </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/css/applySqYZ_Page.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<Script type="text/javascript"> 
		$(function(){
			/** 用户session失效时跳转到main.html */
			if ("${session_user.nickname}" == "") {
				window.location = "${pageContext.request.contextPath}/yxsq/sq/main.action";
			}
			
			/** 导航条操作 */
			if ("${session_user.nickname}" == "") {
				$(".warp .header .ul_2 .li_1").hide();
				$(".warp .header .ul_2 ._2_li").hide();
			}else{
				$(".warp .header .ul_2 .dl_li").hide();
			}
			
			/** 点击提交按钮 */
			$("#applyBtn").click(function(){
				var introduce = $("#introduce").val();
				var apply_reason = $("#apply_reason").val();
				if (introduce == "") {
					alert("自我介绍不能为空！");
				}else if (apply_reason == "") {
					alert("申请理由不能为空！");
				}else{
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/yxsq/sq/applySqYZFormAjax.action",
						dataType:"json",
						data:$("#applySqYZForm").serialize(),
						success:function(json){
							if (json.flag == 1) {
								alert("申请已经提交，请静待结果！");
							}
						},
						error:function(){
							alert("异步申请社区Y主出错！！");
						}
					});
				}
				
			});
		});
	</script>
</head>
<body>
	<div class="warp">
		<!-- header start -->
		<div class="header">
			<ul class="ul_1">
				<li>
					<a href="${pageContext.request.contextPath}">
						<i></i>
						<span>首页</span>
					</a>
				</li>
			</ul>
			<ul class="ul_2">
				<li class="li_1">
					<img src="${pageContext.request.contextPath}/images/user/${session_user.img}" width="20" height="20" alt=""/>
					<a href="${pageContext.request.contextPath}/yxsq/user/homepage.action?nickname=${session_user.nickname}">${session_user.nickname}</a>&nbsp;|&nbsp;
				</li>
				<li class="dl_li"><a href="javascript:void(0)" class="dl">登陆</a>&nbsp;|&nbsp;</li>
				<li class="_2_li"><a href="${pageContext.request.contextPath}/loginout/loginout_2.action">安全退出</a>&nbsp;|&nbsp;</li>
				<li class="li_2">
					<a href="#">
						<i></i>
						<span>通知</span>&nbsp;|&nbsp;
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/yxsq/sq/main.action">月下社区</a>
				</li>
			</ul>
		</div>
		<!-- end header -->
		<!-- content_1 start -->
		<div class="content_1">
			<div class="_1">
				<span class="mess">当前位置：社区主页&gt;&gt;申请Y主</span>	
			</div>
		</div>
		<div class="content_2">
			<fieldset style="width:600px;margin:0px auto;border:1px dashed;margin-top:30px;margin-bottom:30px">
				<legend style="margin:0px auto;font-size:14px;font-weight:bold;">申请Y主</legend>
				<div class="form">
					<form id="applySqYZForm">
						当前社区：<input type="text" class="text_1"  readonly="readonly" value="${sq.sq_name}" name="apply_sq"/><br/>
						自我介绍：<input type="text" class="text_1" autocomplete="off" placeholder="自我介绍" id="introduce" name="introduce"/><br/>
						申请理由：<input type="text" class="text_1" autocomplete="off" placeholder="申请理由" id="apply_reason" name="apply_reason"/>
						<input type="hidden" name="apply_usernickname" value="${session_user.nickname}"/>
						<input type="hidden" name="userId" value="${session_user.id}"/>
						<input type="hidden" name="sqId" value="${sq.id}"/>
						<input type="button" value="提交" class="btn" id="applyBtn"/>
						<input type="reset" value="重置" class="btn"/>
					</form>
				</div>
			</fieldset>
		</div>
		<div class="applyRules">
			<div class="one">
				社区Y主申请规则
			</div>
			<div class="two">
				<ul>
					<li><font color="red">Y主特权</font>：Y主可以对该社区的Logo、社区图片进行修改！</li>
					<li><font color="red">Y主特权</font>：对社区帖子以及评论的删除功能将在后期开放，敬请期待！</li>
					<li><font color="red">申请规则</font>：每个社区只能有一个Y主，若该社区已经有Y主，则申请Y主任在前任Y主卸职之前不予开放！</li>
					<li><font color="red">申请规则</font>：一个用户只能申请当一个社区的Y主，若用户已经是某社区的吧主，则在其他社区不予开放申请功能！</li>
					<li><font color="red">申请规则</font>：申请结果将提交给后台管理员，最终结果由管理员决定！</li>
					<li><font color="red">申请规则</font>：自我介绍和申请理由越详细申请成功的概率越大！</li>
					<li>于所在社区的每周平均活动时间长，帐号从未违反过月下社区协议等相关规定。</li>
					<li>于所在社区内有过适当的贡献，发表一定数量的，有建设意义并对其他网友有帮助作用的内容。</li>
					<li>社区的建设需要Y主来引领，社区的人气需要Y主来聚拢。</li>
				</ul>
			</div>
		</div>
		<!-- end_content_1 -->
		<!-- footer start -->
		<div class="footer">
			<span><a href="#">月下</a>&nbsp;|&nbsp;</span>
			<span><a href="#">联系作者</a>&nbsp;|&nbsp;</span>
			<span><a href="#">反馈意见</a>&nbsp;|&nbsp;</span>
			<span><a href="#">欢迎纠错</a>&nbsp;|&nbsp;</span>
			<span><a href="${pageContext.request.contextPath}/main.action">后台管理</a></span><br/>
			<span>&copy;2015-4 For <a href="#">那次心动</a></span>
		</div>
		<!-- end footer -->
</body>
</html>
