<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<head>
	<title> 首页 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing"/>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>  
	<!-- css -->
	<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/welcome.css" rel="stylesheet" type="text/css"/>
	
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/welcome.js"></script>	
	<script type="text/javascript">
		$(function(){
			$("#vimg").bind({mouseover:function(){$(this).css("cursor", "pointer");}, 
				click:function(){
					$("#vimg").attr("src", "${pageContext.request.contextPath}/verify.action?random=" + Math.random());
				}});
			
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
								/** 此URL功能暂停使用 */
								//window.location = "${pageContext.request.contextPath}/yxsq/user/homepage.action?username=" + username_2;
								/** 登陆成功，后台为index.html准备数据 */
								//window.location = "${pageContext.request.contextPath}/yxsq/home/indexSj.action";
								//location.reload();
								window.location = "${pageContext.request.contextPath}";
							}
						},
						error:function(){
							$(".tck .box_2 span").text("异步登陆请求失败！");
						}
					});
				}
			});
			
			/** 导航条操作 */
			if ("${session_user.nickname}" == "") {
				$(".head_top .kg .dh ul .dl_li").show();
				$(".head_top .kg .dh ul ._2_li").hide();
				$(".head_top .kg .dh ul .session_username").hide();
			}else{
				$(".head_top .kg .dh ul .session_username").show();
				$(".head_top .kg .dh ul ._2_li").show();
				$(".head_top .kg .dh ul .dl_li").hide();
			}
			/** 社区数 */
			var a = "${sqCount}";
			$(".content_1 .pic_2 .num ._1").text(Math.floor(a/10));
			$(".content_1 .pic_2 .num ._2").text(a%10);
			
			/** 格式化当前时间 */
			var date = new Date();
			var fotmat = (date.getMonth()+1)+"月"+date.getDate()+"日"; 
			$(".head_top .kg .date span").text(fotmat);
			
			/** 切换城市时异步查询天气情况 */
			$(".wrap .qhtq .qd").click(function(){
				$(".head_top .kg .weather .address").text($("#city").val());
				$(".wrap .qhtq").slideUp("slow");
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/yxsq/home/selectTqAjx.action",
					dataType:"json",
					data:$("#cxtqForm").serialize(),
					success:function(json){
						if (json.flag == 1) {
							$(".head_top .kg .weather .sj_1").addClass("animated zoomIn").text(json.sj_1);
							$(".head_top .kg .weather .sj_2").addClass("animated zoomIn").text(json.sj_2);
						}
					},
					error:function(){
						$(".head_top .kg .weather .sj_1").addClass("animated zoomIn").text("");
						$(".head_top .kg .weather .sj_2").addClass("animated zoomIn").text("暂未查到该城市天气数据！");
					}
				});
			});
			
			/** 获取IP提示信息 */
			if ("${getIpTip}" != "") {
				alert("${getIpTip}");
			}
			
			
			/** 点击用户名跳转_1 */
			$(".head_top .kg .dh ul .session_username").click(function(){
				var clicknickname = $(".head_top .kg .dh ul .session_username a").html();
				if ("${session_user.nickname}" == clicknickname) {
					//跳进该用户自己的主页
					window.location = "${pageContext.request.contextPath}/yxsq/user/homepage.action?nickname="+clicknickname;
				}
			});
		});
		
		/** 设为首页的js函数*/
		 function SetHome(url){
	        if (document.all) {
	            document.body.style.behavior='url(#default#homepage)';
	            document.body.setHomePage(url);
	        }else{
	            alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
	        }
		 
		}
		 /** 加入收藏的js函数*/
		 function AddFavorite(sURL, sTitle) {
            sURL = encodeURI(sURL); 
	        try{   
	            window.external.addFavorite(sURL, sTitle);   
	        }catch(e) {   
	            try{   
	                window.sidebar.addPanel(sTitle, sURL, "");   
	            }catch (e) {   
	                alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
	            }   
	        }
	    }
		 
		/** 点击用户名跳转_2 */
		function clickName(clicknickname){
			//alert(clicknickname);
			$(function(){
				/** 必须要求用户登陆才能当问自己或者所点击用户的主页 */
				if ($.trim("${session_user.id}")  == "") {
					var height = $("#clicknickname").offset().top;
					$(".tck").addClass("animated bounceIn").css("top",height-200).show();
					$(".yy").css({"height":$(document).height(),"width":$(window).width()}).show();
				}else{
					if ("${session_user.nickname}" == clicknickname) {
						window.location = "${pageContext.request.contextPath}/yxsq/user/homepage.action?nickname="+clicknickname;
					}else{
						window.location = "${pageContext.request.contextPath}/yxsq/user/other_homepage.action?nickname="+clicknickname+"&fwId=${session_user.id}";
					}
				}
			});
		} 
	</script>
</head>
<body>

	<!-- wrap start -->
	<div class="wrap">
		<!-- head_top start -->
		<div class="head_top">
			<div class="kg">
				<a href="javascript:void(0)" class="sethome" onclick="SetHome(window.location)">
					<i class="home_logo"></i>
					<span>
						设为首页
					</span>
				</a>
				<div class="date" title="today">
					<i class="date_logo"></i>
					<span>4月12日</span>
				</div>
				<div class="weather">
					<i class="weather_logo"></i>
					<span class="address">${mr_address}</span>
					<span>
						<a href="javascript:void(0)" class="qh">[切换]</a>
					</span>
					<span class="sj_1">${sj_1 }</span>
					<span style="padding-left:5px;" class="sj_2">&nbsp;${sj_2 }</span>
				</div>			
				<div class="dh">
					<ul>
						<li class="session_username"><a href="javascript:void(0)">${session_user.nickname}</a>&nbsp;|&nbsp;</li>
						<li class="dl_li"><a href="javascript:void(0)" class="dl">登陆</a>&nbsp;|&nbsp;</li>
						<li class="_2_li"><a href="${pageContext.request.contextPath}/loginout/loginout_1.action">安全退出</a>&nbsp;|&nbsp;</li>
						<li><a href="${pageContext.request.contextPath}/yxsq/sq/main.action">月下社区</a>&nbsp;|&nbsp;</li>
						<li><a href="javascript:void(0)" onclick="AddFavorite(window.location,document.title)">加入收藏</a>&nbsp;|&nbsp;</li>
						<li><a href="javascript:void(0)" onclick="alert('关于月下社区配套安卓版本APP，作者正在搭建中，敬请期待...')">手机客户端</a>&nbsp;|&nbsp;</li>
						<li>
							<span><a href="javascript:void(0)" class="hf">换肤</a></span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- end head_top -->
		<!-- qhtq start -->
		<div class="qhtq">
			<form id="cxtqForm">
				<select id="province" onchange="selectprovince(this);" name="province"></select>
				<select id="city" name="city"></select>
				<a href="javascript:void(0)" class="qd">确定</a>
				<a href="javascript:void(0)" class="qx">取消</a>
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/qhtq.js"></script>
			</form>
		</div>
		<!-- end qhtq -->
		<!-- skin start -->
		<div class="skin">
			<div class="skin_menu">
				<a href="javascript:void(0)" class="_1">不使用皮肤</a>
				<a href="javascript:void(0)" class="_2">保存</a>
			</div>
			<ul class="ul">
				<s:iterator value="indexImgs_2">
					<li>
						<img src="${pageContext.request.contextPath}/images/bg/${img_src}" width="150px" height="90px"/>
					</li>
				</s:iterator>
			</ul>
		</div>
		<!-- end skin -->

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
					<li><a href="javascript:void(0)">忘了密码？&nbsp;|&nbsp;</a></li>
					<li><a href="${pageContext.request.contextPath}/yxsq/user/registerUser.action">注册新账号&nbsp;|&nbsp;</a></li>
					<li><a href="javascript:void(0)">意见反馈</a></li>
				</ul>
			</div>
		</div>
		<div class="yy">
		
		</div>
		<!-- end 弹出框 -->

		<!-- header start -->
		<div class="header">	
			<img src="${pageContext.request.contextPath}/images/2.png" height="130" width="130" class="i_1"/>
			<img src="${pageContext.request.contextPath}/images/1.png" height="100" width="400" class="i_2"/>
			<img src="${pageContext.request.contextPath}/images/3.png" height="71" width="253" class="i_3"/>
		</div>
		<!-- end header -->
		<!-- content_1 start -->
		<div class="content_1">
			<div class="pic_1">
				<ul class="pic_ul">
					<s:iterator value="indexImgs">
						<li>
							<a href="${img_href}">
								<img src="${img_src}" width="692" height="200"/>
							</a>
						</li>
					</s:iterator>
				</ul>
				<div class="btn">
					<ul>
						<li class="sel"></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</div>
			</div>
			<div class="pic_2">
				<div class="num">
					<i class="_1">9</i>
					<i class="_2">9</i>
				</div>
			</div>
		</div>
		<!-- end content_1 -->
		<!-- content_2 start -->
		<div class="content_2">
			<div class="jptz">
				<div class="box_1">
					<img src="${pageContext.request.contextPath}/images/down.png" width="28" height="25"/>
					<span class="_s1">精品帖子</span>
					<span class="_s2"><a href="javascript:void(0)">更多...</a></span>
				</div>
				<div class="box_2">
					<ul>
						<s:iterator value="tzs" status="index">
							<li>
								<i class="i_1"><s:property value="#index.index+1"/></i>
								<span><a href="${pageContext.request.contextPath}/yxsq/tz/selectAllRemark.action?tzId=${id}&sqId=${sqId}" title="${tz_title}"><s:property value="tz_title"/></a></span>
								<a href="javascript:void(0)"><i class="i_2"></i></a>
								<span class="num_1">${remarkCount}</span>
							</li>
						</s:iterator>
					</ul>
					<ul>
						<s:iterator value="tzs_2" status="index">
							<li>
								<i class="i_1_1"><s:property value="#index.index+4"/></i>
								<span><a href="${pageContext.request.contextPath}/yxsq/tz/selectAllRemark.action?tzId=${id}&sqId=${sqId}" title="${tz_title}"><s:property value="tz_title"/></a></span>
								<a href="javascript:void(0)"><i class="i_2"></i></a>
								<span class="num_1">${remarkCount}</span>
							</li>
						</s:iterator>
					</ul>
				</div>
			</div>
			<div class="gxrt">
				<div class="box_1">
					<img src="${pageContext.request.contextPath}/images/down.png" width="28" height="25"/>
					<span class="_s1">高校热帖</span>
					<span class="_s2"><a href="javascript:void(0)">更多分类...</a></span>
				</div>
				<div class="box_2">
					<ul class="gxrt_ul">
						<s:iterator value="tzs_3">
							<li>
								<i class="i_1"></i>
								<span><a href="${pageContext.request.contextPath}/yxsq/tz/selectAllRemark.action?tzId=${id}&sqId=${sqId}">${tz_title }</a></span>
								<span class="name"><a href="javascript:void(0)" onclick="clickName('${user.nickname}');" id="clicknickname">${user.nickname }</a></span>
							</li>
						</s:iterator>
					</ul>
				</div>
			</div>
			<div class="xhy">
				<div class="box_1">
					<img src="${pageContext.request.contextPath}/images/new.png" width="28" height="25"/>
					<span class="_s1">新会员</span>
				</div>
				<div class="box_2">
					<ul>
						<s:iterator value="users">
							<li>
								<span class="name"><a href="javascript:void(0)" onclick="clickName('${nickname}');" id="clicknickname">${nickname }</a></span>
								<span class="date"><s:date name="register_time" format="mm-dd"/></span>
							</li>
						</s:iterator>
					</ul>
				</div>
			</div>
		<div>
		<!-- end content_2 -->
	</div>
	<!-- end wrap -->
	<!-- footer start -->
	<div class="footer">
		<span><a href="javascript:void(0)">月下</a>&nbsp;|&nbsp;</span>
		<span><a href="javascript:void(0)">联系作者</a>&nbsp;|&nbsp;</span>
		<span><a href="javascript:void(0)">反馈意见</a>&nbsp;|&nbsp;</span>
		<span><a href="javascript:void(0)">欢迎纠错</a>&nbsp;|&nbsp;</span>
		<span><a href="${pageContext.request.contextPath}/main.action">后台管理</a></span><br/>
		<span>&copy;2015-4 For <a href="javascript:void(0)">那次心动</a></span>
	</div>
	<!-- end footer -->
</body>
</html>
