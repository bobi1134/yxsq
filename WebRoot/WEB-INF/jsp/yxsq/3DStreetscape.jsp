<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<head>
	<title> ${sq.sq_name}3D街景 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/css/community.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script src="http://map.qq.com/api/js?v=2.exp&key=SMKBZ-MVFHU-FD3VI-4L6KR-ZPUD7-LDBG4"></script>
	<Script type="text/javascript"> 
		$(function(){
			/** 导航条操作 */
			if ("${session_user.nickname}" == "") {
				$(".warp .header .ul_2 .li_1").hide();
				$(".warp .header .ul_2 ._2_li").hide();
			}else{
				$(".warp .header .ul_2 .dl_li").hide();
				
			}
			
			//单击导航条上面的用户名
			$(".warp .header .ul_2 .dl_li .dl").click(function(){
				$(".tck").css("top","150px").addClass("animated bounceIn").show();
				$(".yy").css({"height":$(document).height(),"width":$(window).width()}).show();
				$(".tck .box_1 .qx").click(function(){
					$(".yy").hide();
					$(".tck").hide();
				});
				$("#login").click(function(){
					var username = $("#username");
					var password = $("#password");
					var vcode = $("#vcode");
					if ($.trim(username.val()) == ""){
						$(".tck .box_2 span").text("请输入账号！");
						username.focus();
					}
					else if(!/^[1-9][0-9]{4,10}$/.test(username.val())){
						$(".tck .box_2 span").text("请输入正确的用户名！");
						username.focus();
					}
					else if($.trim(password.val()) == ""){
						$(".tck .box_2 span").text("请输入密码！");
						password.focus();
					}
					else if(!/^\w{6,20}$/.test(password.val())){
						$(".tck .box_2 span").text("密码格式不正确！");
						password.focus();
					}
					else if($.trim(vcode.val()) == ""){
						$(".tck .box_2 span").text("请输入验证码！");
						vcode.focus();
					}
					else if(!/^\d{4}$/.test(vcode.val())){
						$(".tck .box_2 span").text("验证码格式不正确！");
						vcode.focus();
					}
					else{
						$(".tck .box_2 span").text("正在登陆...");
						$.ajax({
							type:"post",
							url:"${pageContext.request.contextPath}/loginAjax.action",
							dataType:"json",
							data:$("#loginForm").serialize(),
							success:function(json){
								if (json.flag != 2) {
									$(".tck .box_2 span").text(json.tip);
									$("#vimg").trigger("click");
								}
								else{
									window.location = "${pageContext.request.contextPath}/yxsq/sq/threeDStreetscape.action?sqId=${sq.id}&sqName=${sq.sq_name}";
								}
							},
							error:function(){
								$(".tck .box_2 span").text("异步登陆请求失败！");
							}
						});
					}
				});
			});
		});
		
		/** 修改社区资料 */
		$(function(){
			/** ststus必须是1或者2切当前状态必须是登陆状态才显示[修改资料]权限 */
			if (($.trim(${session_user.status}) == 1 || $.trim(${session_user.status}) == 2) && $.trim(${session_user.status}) != "") {
				$(".warp .content_2 .box_1 .two .xg").show();
			}else{
				$(".warp .content_2 .box_1 .two .xg").hide();
			}
			/** 单击时 */
			$(".warp .content_2 .box_1 .two .xg").click(function(){
				window.location = "${pageContext.request.contextPath}/yxsq/sq/updateSqZLPage.action?sqId=${sq.id}&userId=${session_user.id}";
			});
		});
		
		var init = function() {
            var pano = new qq.maps.Panorama(document.getElementById('pano_holder'), {
                pano: '${sq.sq_pano}',
                pov: {
                    heading: 270,
                    pitch: 0
                },
                zoom: 1,
                addressControl: true,
                addressControlOptions: {
                position: qq.maps.ControlPosition.RIGHT_TOP
                }
            });

        }
	</script>
</head>
<body onLoad="init()">
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
				<li class="_2_li"><a href="${pageContext.request.contextPath}/loginout/loginout_5.action?sqId=${sq.id}&sqName=${sq.sq_name}">安全退出</a>&nbsp;|&nbsp;</li>
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
			<img src="${pageContext.request.contextPath}/images/sq_img/${sq.sq_img}" width="980" height="180"/>
		</div>
		<!-- end content_1 -->
		<div class="tx">
			<img src="${pageContext.request.contextPath}/images/sq_img/${sq.sq_logo_img}" width="150" height="150"/>
		</div>
		<!-- content_2 start -->
		<div class="content_2">
			<div class="box_1">
				<div class="one">
					<a href="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq.sq_name}"><span class="span_1"><s:property value="sq.sq_name"/>社区</span></a>
					<a href=""><span class="span_2"></span></a>
					<span class="span_3">关注:&nbsp;<font class="num">67070</font></span>
					<span class="span_4">帖子:&nbsp;<font class="num"><s:property value="ftzs"/></font></span>
				</div>
				<div class="two">
					<span><s:property value="sq.sq_introduction"/></span>
					<span class="span_2"><font color="#AAA">目录：</font><a href="#"><s:property value="sq.sq_location"/>院校</a></span>
					<a href="#" class="xg">修改社区资料</a>
				</div>
			</div>
			<div class="box_2">
				<div class="left">
					<a href="#"></a>
				</div>
				<!--先暂时隐藏
					<div class="left_2">
						<span>连续2天</span>
					</div>
				-->
				<div class="right">
					<span>04月21日</span>
					<span>漏签<font color="#ff7f3e">18</font>天</span>
				</div>
			</div>
		</div>
		<!-- end content_2 -->
		<!-- content_3 start -->
		<div class="content_3">
			<ul>
				<a href="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq.sq_name}"><li>看帖</li></a>
				<a href="#"><li>图片</li></a>
				<a href="#"><li>精品</li></a>
				<a href="${pageContext.request.contextPath}/yxsq/sq/bb_onePage.action?sqId=${sq.id}"><li>表白墙</li></a>
				<a href="#"><li style="width:100px;">弹幕交流</li></a>
				<a href="${pageContext.request.contextPath}/yxsq/sq/threeDStreetscape.action?sqId=${sq.id}&sqName=${sq.sq_name}"><li style="width:120px;">校园3D导航</li></a>
			</ul>
			<form>
				<input type="text" class="txt"/>
				<button class="btn" type="submit"></button>
			</form>
		</div>
		<!-- end content_3 -->
		<!-- start content_4 -->
		<div style="width:980px;height:600px;" id="pano_holder">
		</div>
		<!-- end content_4 -->
	</div>
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
	<!-- 弹出框 start -->
	<div class="tck">
		<div class="box_1">
			<span class="_1">账号密码登陆</span>
			<span class="qx">x</span>
		</div>
		<div class="box_2">
			<form method="post" id="loginForm">
				<span></span>
				<input type="text" placeholder="请输入用户名" class="_1" id="username" name="username" autocomplete="off"/>
				<input type="text" onfocus="this.type='password'" placeholder="请输入密码" class="_2" id="password" name="password" autocomplete="off"/>
				<img src="${pageContext.request.contextPath}/verify.action" id="vimg"/>
				<input type="text" placeholder="验证码" class="_3" id="vcode" name="vcode" autocomplete="off"/>					
				<input type="button" value="登  陆" class="login_input" id="login"/>
			</form>
		</div>
		<div class="box_3">
			<ul>
				<li><a href="#">忘了密码？&nbsp;|&nbsp;</a></li>
				<li><a href="#">注册新账号&nbsp;|&nbsp;</a></li>
				<li><a href="#">意见反馈</a></li>
			</ul>
		</div>
	</div>
	<div class="yy">
	</div>
	<!-- end 弹出框 -->
</body>
</html>
