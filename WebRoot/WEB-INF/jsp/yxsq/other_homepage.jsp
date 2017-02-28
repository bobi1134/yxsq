<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<head>
	<title> <s:property value="nickname"/>的主页 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing"/>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/css/other_homepage.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript">
		$(function(){
			/** 导航条操作 */
			if ("${session_user.nickname}" == "") {
				$(".warp .header .ul_2 .li_1").hide();
				$(".warp .header .ul_2 ._2_li").hide();
			}else{
				$(".warp .header .ul_2 .dl_li").hide();
			}
			
		});
	</script>
</head>
<body>
	<!-- 换肤阴影 start -->
	<div class="yy">
	</div>
	<!-- end 换肤阴影 -->
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
				<li class="_2_li"><a href="${pageContext.request.contextPath}/loginout/loginout_1.action">安全退出</a>&nbsp;|&nbsp;</li>
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
		</div>
		<!-- end content_1 -->
		<!-- 插入头像 start -->
		<div class="image">
			<img src="${pageContext.request.contextPath}/images/user/<s:property value="user.img"/>" width="150" height="150"/>
		</div>
		<!-- end 插入头像 -->
		<!-- content_2 start -->
		<div class="content_2">
			<div class="box_1">
				<div class="box_1_1">
					<span><s:property value="nickname"/></span>
				</div>
				<div class="box_1_2">
					<span class="sex"></span>
					<span>Y龄：<s:property value="Y_L"/>年</span>
					<span class="sx"></span>
					<span>发帖：<s:property value="count"/></span>
				</div>
			</div>
			<div class="box_2">
				<ul>
					<li><a href="#">他在月下</a></li>
					<li><span class="sx"></span></li>					
					<li><a href="#">月下投诉</a></li>
				</ul>
			</div>
		</div>
		<!-- end content_2 -->
		<!-- content_3 start -->
		<div class="content_3">
			<div class="box_1">
				<div class="box_1_1">
					<ul>
						<li class="_1">
							<a href="#"><span class="bg_txt">他的主页</span></a>
							<li><span class="sx"></span></li>
						</li>
						<li class="_2">
							<a href="#"><span class="bg_txt">他的成就</span></a>
						</li>
					</ul>
				</div>
				<div class="box_1_2">
					<div class="box_1_2_1">
						<span class="s">|</span>
						<span class="title">爱逛的社区</span>
					</div>
					<div class="box_1_2_2">
						<ul>
							<s:iterator value="agsqs">
								<a href="#">
									<li><s:property value="agsq_name"/><span></span></li>
								</a>
							</s:iterator>
						</ul>
					</div>
				</div>
				<div class="box_1_3">
					<div class="box_1_3_1">
						<span class="s">|</span>
						<span class="title">帖子</span>
						<a href="#" class="yjqd"></a>
					</div>
					<div class="box_1_3_2">
						<ul class="ul">
							<s:iterator value="tzs">
								<li>
									<div class="_1">
										<div class="img">
											<img src="${pageContext.request.contextPath}/images/sq_img/<s:property value="sq.sq_img"/>" width="43" height="43"/>
										</div>
										<div class="txt_1">
											<div class="d_1">
												<span class="span_1"><a href="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq.sq_name}" title="${sq.sq_name}"><s:property value="sq.sq_name"/></a></span>
												<span class="span_2"><s:date name="tz_time" format="yyyy-MM-dd"/></span>
											</div>	
											<div class="d_2">
												<span class="span_1"><a href="${pageContext.request.contextPath}/yxsq/tz/selectAllRemark.action?tzId=${id}&sqId=${sqId}" title="${tz_title}"><s:property value="tz_title"/></a></span>
											</div>
										</div>
										<div class="txt_2" id="tz_content_xs">
											<s:property value="tz_content" escape="false"/>
										</div>
										<div class="txt_3">
											<span class="logo_1" title="最后评论"></span>
											<span class="name"><s:property value="lastRemark"/></span>
											<span class="sx"></span>
											<span class="logo_2" title="评论总数"></span>
											<span class="num">${remarkCount}</span>
										</div>
									</div>
								</li>
							</s:iterator>
						</ul>
					</div>
				</div>
			</div>
			<div class="box_2">
				<div class="box_2_1">
					<span>最近来访</span>
					<div class="people">
						<ul>
							<s:iterator value="zjllUsers">
								<li><img src="${pageContext.request.contextPath}/images/user/${img}" width="44" height="44" title="${nickname }"/></li>
							</s:iterator>
						</ul>
					</div>
				</div>
				<div class="box_2_2">
					<span>Ta关注的人(6)</span>
					<div class="people">
						<ul>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
						</ul>
					</div>
				</div>
				<div class="box_2_3">
					<span>关注Ta的人(8)</span>
					<div class="people">
						<ul>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
							<li><img src="${pageContext.request.contextPath}/images/homepage/zjlf.jpg" width="44" height="44"/></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- end content_3 -->
	</div>
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
