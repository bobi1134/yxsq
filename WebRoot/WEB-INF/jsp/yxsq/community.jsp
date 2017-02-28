<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy" uri="/Nohting-tags"%>
<!DOCTYPE html>
<head>
	<title> <s:property value="sq.sq_name"/> | 月下社区 </title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/tools/ckeditor/ckeditor.js"></script>
	<Script type="text/javascript"> 
		$(function(){
			/** 点击验证啊图片换一下验证码 */
			$("#vimg").bind({mouseover:function(){$(this).css("cursor", "pointer");}, click:function(){
					$("#vimg").attr("src", "${pageContext.request.contextPath}/verify.action?random=" + Math.random());
			}});
			
			/** 点击添加帖子 */
			$("#insertBtn").click(function(){
				var insert_title = $("#insert_title");
				var insert_title_val = $("#insert_title").val();
				var ckeditor = CKEDITOR.instances.ckeditor.getData();
				if ($.trim(insert_title.val()) == "") {
					$(".warp .content_5 .one ._1 .span_3").addClass("animated shake").text("请输入标题！").css("color","red");
					//$(".warp .content_5 .one ._1 .span_3").delay (3000).fadeOut(3000);
				}
				else if($.trim(ckeditor) == ""){
					$(".warp .content_5 .one ._1 .span_3").addClass("animated shake").text("请输入内容！").css("color","red");
					//$(".warp .content_5 .one ._1 .span_3").delay (3000).fadeOut(3000);
				}
				else{
					if ($.trim("${session_user.id}") == "") {
						$(function(){
							var height = $("#insertBtn").offset().top;
							$(".tck").addClass("animated bounceIn").css("top",height-400).show();
							$(".yy").css({"height":$(document).height(),"width":$(window).width()}).show();
							
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
												window.location = "${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq.sq_name}"+"&tz_title="+insert_title_val+"&ckeditor="+ckeditor;
											}
										},
										error:function(){
											$(".tck .box_2 span").text("异步登陆请求失败！");
										}
									});
								}
							});
							
							$(".tck .box_1 .qx").click(function(){
								$(".yy").hide();
								$(".tck").hide();
							});
						});
					} 
					else{
						$("#insertForm").submit();
						//alert("请稍等！");
					}
				}
				
			});
			
			if ("${xs}" == 1) {
				$(".fz_success").show().delay (1000).fadeOut(3000);
			}
			
			if ("${tip}" != "") {
				$(".bdcftj").show().delay (1000).fadeOut(3000);
			}
			
			/** 导航条操作 */
			if ("${session_user.nickname}" == "") {
				$(".warp .header .ul_2 .li_1").hide();
				$(".warp .header .ul_2 ._2_li").hide();
			}else{
				$(".warp .header .ul_2 .dl_li").hide();
				
			}
			
			//单击用户名
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
									window.location = "${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sqName}";
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
		
		/** 点击用户名跳转 */
		function clickName(clicknickname){
			//alert(clicknickname);
			$(function(){
				/** 必须要求用户登陆才能当问自己或者所点击用户的主页 */
				if ($.trim(${session_user.id})  == "") {
					var height = $("#clicknickname").offset().top;
					$(".tck").addClass("animated bounceIn").css("top",height-200).show();
					$(".yy").css({"height":$(document).height(),"width":$(window).width()}).show();
					
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
										window.location = "${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sqName}";
									}
								},
								error:function(){
									$(".tck .box_2 span").text("异步登陆请求失败！");
								}
							});
						}
					});
					
				}else{
					if ("${session_user.nickname}" == clicknickname) {
						window.location = "${pageContext.request.contextPath}/yxsq/user/homepage.action?nickname="+clicknickname;
					}else if(clicknickname == "暂无评论"){
						//alert("(*^__^*) 嘻嘻……");
					}else{
						window.location = "${pageContext.request.contextPath}/yxsq/user/other_homepage.action?nickname="+clicknickname+"&fwId=${session_user.id}";
					}
				}
				
				$(".tck .box_1 .qx").click(function(){
					$(".yy").hide();
					$(".tck").hide();
				});
			});
		} 
		
		$(function(){
			/** 当前用户必须是当前社区的Y主时才显示[修改资料]权限 */
			if (($.trim(${session_user.status}) == 1 || $.trim(${session_user.status}) == 2) && $.trim(${session_user.status}) != "" && $.trim(${session_user.yz_sqId}) == ${sq.id}) {
				$(".warp .content_2 .box_1 .two .xg").show();
				$(".warp .content_2 .box_1 .two .sq").hide();
			}else{
				$(".warp .content_2 .box_1 .two .xg").hide();
			}
			
			/** 若该用户已经是某个社区的Y主，则[申请Y主]永不显示 */
			if ($.trim(${session_user.id}) != "") {
				if ($.trim(${session_user.yz_sqId}) != "" || $.trim(${sq.sq_yz}) != "") {
					$(".warp .content_2 .box_1 .two .sq").hide();
				}
			}else{
				$(".warp .content_2 .box_1 .two .sq").hide();
			}
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
				<li class="_2_li"><a href="${pageContext.request.contextPath}/loginout/loginout_3.action?sqName=${sqName}">安全退出</a>&nbsp;|&nbsp;</li>
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
					<a href=""><span class="span_1"><s:property value="sq.sq_name"/>社区</span></a>
					<a href=""><span class="span_2"></span></a>
					<span class="span_3">关注:&nbsp;<font class="num">67070</font></span>
					<span class="span_4">帖子:&nbsp;<font class="num"><s:property value="ftzs"/></font></span>
				</div>
				<div class="two">
					<span><s:property value="sq.sq_introduction"/></span>
					<span class="span_2"><font color="#AAA">目录：</font><a href="#"><s:property value="sq.sq_location"/>院校</a></span>
					<a href="${pageContext.request.contextPath}/yxsq/sq/updateSqZLPage.action?sqId=${sq.id}&userId=${session_user.id}" class="xg">修改社区资料</a>
					<a href="${pageContext.request.contextPath}/yxsq/sq/applySqYZPage.action?sqId=${sq.id}" class="sq">申请社区Y主</a>
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
				<a href="#"><li>看帖</li></a>
				<a href="#"><li>图片</li></a>
				<a href="#"><li>精品</li></a>
				<a href="${pageContext.request.contextPath}/yxsq/sq/bb_onePage.action?sqId=${sq.id}"><li>表白墙</li></a>
				<a href="#"><li style="width:100px;">弹幕交流</li></a>
				<a href="${pageContext.request.contextPath}/yxsq/sq/threeDStreetscape.action?sqId=${sq.id}&sqName=${sq.sq_name}"><li style="width:120px;">校园3D导航</li></a>
			</ul>
			<form>
				<input type="text" class="txt"/>
				<button class="btn" type="button"></button>
			</form>
		</div>
		<!-- end content_3 -->
		<!-- content_4 start -->
		<div class="content_4">
			<div class="left">
				<ul>
				<s:iterator value="tzs">
					<li>
					
						<div class="gk">
							<div class="one">
								<span class="span_1" title="回复"><s:property value="remarkCount"/></span>
								<span class="span_2" title="发帖时间"><s:date name="tz_time" format="HH:mm"/></span>
							</div>
							<div class="two">
							<div class="first">
								<div class="_1">
									<span class="span_1" title="${tz_title}"><a href="${pageContext.request.contextPath}/yxsq/tz/selectAllRemark.action?tzId=${id}&sqId=${sqId}"><s:property value="tz_title"/></a></span>
								</div>
								<div class="_2" title="发帖人">
									<span class="span_1"></span>
									<a href="javascript:void(0)" onclick="clickName('${user.nickname}');" id="clicknickname"><span class="span_2"><s:property value="user.nickname"/></span></a>
								</div>
							</div>
							<div class="second">
								<div class="_1">
									<span><s:property value="tz_content" escape='false'/></span>
								</div>
								<div class="_2" title="最后回复者">
									<span class="span_1"></span>
									<a href="javascript:void(0)" onclick="clickName('${lastRemark}');" id="clicknickname"><span class="span_2"><s:property value="lastRemark"/></span></a>
								</div>
							</div>
							
						</div>
					</li>
				</s:iterator>
				</ul>
			</div>
			<div class="right">
				<div class="box_1">
					<div class="one">
						<span>我在月下</span>
					</div>
					<div class="two">
						<img src="${pageContext.request.contextPath}/images/comunity/tx.jpg" width="86" height="86"/>
						<span><a href="#"><i class="i_1"></i></a>&nbsp;&nbsp;<a href="#">MyLove_CM</a></span>
						<span><i class="i_2"></i>&nbsp;&nbsp;<a href="#">[获取]</a></span>
					</div>
				</div>
				<div class="box_2">
					<div class="one">
						<span class="span_1">本社信息</span>
						<span class="span_2"><a href="#">查看详情&gt;&gt;</a></span>
					</div>
					<div class="two">
						<div class="_1">
							<ul>
								<li>
									<img src="${pageContext.request.contextPath}/images/comunity/yz.jpg" width="60" height="60"/>
									<span class="yz">Y主</span>
									<span class="name"><a href="#">Nothing</a></span>
								</li>
								<li>
									<img src="${pageContext.request.contextPath}/images/comunity/yz.jpg" width="60" height="60"/>
									<span class="yz">Y主</span>
									<span class="name"><a href="#">Nothing</a></span>
								</li>
								<li>
									<img src="${pageContext.request.contextPath}/images/comunity/yz.jpg" width="60" height="60"/>
									<span class="yz">Y主</span>
									<span class="name"><a href="#">Nothing</a></span>
								</li>
							</ul>
						</div>
						<div class="_2">
							<span class="">Y主：本社区共<font color="#ff7f3e">3</font>位Y主</span>
							<span class="">目录：<a href="#">四川院校</a></span>
							<span class=""><a href="#">阅读本社区社刊&gt;&gt;</a></span>
						</div>
					</div>
				</div>
				<div class="box_3">
					<div class="one">
						<span>社区传送</span>
					</div>
					<div class="two">
						<ul>
							<li><a href="#">【吧友必看】四川农业大学吧吧规（修订版）</a></li>
							<li><a href="#">【吧务吐槽贴】专贴吐槽，今天你有什么不满？</a></li>
							<li><a href="#">【广告贴总贴】交易|招聘等消息发布专贴链接汇总贴</a></li>
							<li><a href="#">【交友、征友专帖】征友类消息专帖，另贴不留</a></li>
							<li><a href="#">【吧务记录专贴】删帖|加精|封禁|等记录贴</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- end content_4 -->
		<div style="height:45px;padding-left:20px;">
			<xy:pager pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.recordCount}" submitUrl="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sqName}&pageModel.pageIndex={0}"/>
		</div>		
		<!-- content_5 start -->
		<div class="content_5">
			<div class="one">
				<div class="_1">
					<span class="span_1"></span>
					<span class="span_2">发表新帖</span>
					<span class="span_3">
					</span>
				</div>
			</div>
		 	<div class="two">
		 		<form action="${pageContext.request.contextPath}/yxsq/sq/insertTz.action?userId=${session_user.id}&sqId=${sq.id}&flag=1" method="post" id="insertForm">
		 			<input type="hidden" name="sqName" value="${sq.sq_name}"/>
					<input type="text" placeholder="请输入标题！" class="text_input" id="insert_title" name="tz_title" value="${tz_title}" autocomplete="off" onkeypress="if(event.keyCode==13||event.which==13){return false;}"/>
					<textarea id="ckeditor" class="ckeditor" name="ckeditor">
					${ckeditor}
					</textarea>
					<script type="text/javascript">
						$(function(){
							CKEDITOR.replace("ckeditor",{
								width:720,
								height:200,
							});
						});
					</script>
					<input type="button" class="btn" value="提交" id="insertBtn"/>
				</form>
			</div>
		</div>
		<!-- end content_5 -->
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
	<!-- start 发帖成功 -->
	<div class="fz_success">
		<span>发帖成功！<font color="#eb6f49">经验<b>＋1</b></font></span>
	</div>
	<!-- end 发帖成功 -->
	<!-- 表单重复提交start -->
	<div class="bdcftj">
		禁止表单重复提交！
	</div>
	<!-- end表单重复提交 -->
</body>
</html>
