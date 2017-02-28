<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="xy" uri="/Nohting-tags"%>
<!DOCTYPE html>
<head>
	<title> <s:property value="tz.tz_title"/> | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing" />
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/css/invitation.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/invitation.js"></script>
	<script type="text/javascript">
		$(function(){
			/** 点击验证啊图片换一下验证码 */
			$("#vimg").bind({mouseover:function(){$(this).css("cursor", "pointer");}, click:function(){
					$("#vimg").attr("src", "${pageContext.request.contextPath}/verify.action?random=" + Math.random());
			}});
			
			/** 回复用户 */
			$("#remarkBtn").click(function(){
				/** 1.  先进行表单校验 */
				var remarkText = $("#remarkText").val();
				if($.trim(remarkText) == ""){
					$(".warp .content_5 .zd ._1 .span_3").addClass("animated rubberBand").show().delay (3000).fadeOut(3000);
				}else{
					/** 校验用户是否已经登陆 */
					if ($.trim(${session_user.id}) == "") {
						var height = $("#remarkBtn").offset().top;
						$(".tck").addClass("animated bounceIn").css("top",height-400).show();
						$(".yy").css({"height":$(document).height(),"width":$(window).width()}).show();
						$(".tck .box_1 .qx").click(function(){
							$(".yy").hide();
							$(".tck").hide();
						});
						/** 登陆验证start */
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
											window.location = "${pageContext.request.contextPath}/yxsq/tz/selectAllRemark.action?tzId=${tzId}&sqId=${sqId}&remarkText="+remarkText;
										}
									},
									error:function(){
										$(".tck .box_2 span").text("异步登陆请求失败！");
									}
								});
							}
						});
					/** end登陆验证 */
					}else{
						$("#remarkForm").submit();
					}
				}
			});
			
			if ("${xs}" == 1) {
				$(".fz_success").show().delay (1000).fadeOut(3000);;
			}
			if ("${pageModel.pageIndex}" > 1) {
				$(".warp .content_4 .left .two ul li:eq(0)").hide();
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
									window.location = "${pageContext.request.contextPath}/yxsq/tz/selectAllRemark.action?tzId=${tzId}&sqId=${sqId}";
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
										window.location = "${pageContext.request.contextPath}/yxsq/tz/selectAllRemark.action?tzId=${tzId}&sqId=${sqId}";
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
						window.location = "${pageContext.request.contextPath}/yxsq/user/other_homepage.action?nickname="+clicknickname;
					}
				}
			});
		} 
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
				<li class="_2_li"><a href="${pageContext.request.contextPath}/loginout/loginout_4.action?tzId=${tzId}&sqId=${sqId}">安全退出</a>&nbsp;|&nbsp;</li>
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
			<div class="left">
				<img src="${pageContext.request.contextPath}/images/invitation/tx.jpg" width="48" height="48"/>
				<a href="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq.sq_name}"><span class="span_1">${sq.sq_name}社区</span></a>
				<!--<a href=""><span class="span_2"></span></a>-->
				<span class="span_2_ygz"><a href=""></a></span>
				<span class="span_3">关注:&nbsp;<font color="#ff7f3e">67070</font></span>
				<span class="span_4">帖子:&nbsp;<font color="#ff7f3e">${count}</font></span>
			</div>
			<div class="right">
				<div class="one">
					<a href="#"></a>
				</div>
				<!--先暂时隐藏
					<div class="one_qdh">
						<span>连续2天</span>
					</div>-->
				
				<div class="two">
					<span>04月21日</span>
					<span>漏签<font color="#ff7f3e">18</font>天</span>
				</div>
			</div>
		</div>
		<!-- end content_1 -->
		<!-- content_2 start -->
		<div class="content_2">
			<ul>
				<a href="#"><li>看帖</li></a>
				<a href="#"><li>图片</li></a>
				<a href="#"><li style="width:90px">弹幕交流</li></a>
			</ul>
		</div>
		<!-- end content_2 -->
		<!-- content_3 start -->
		<div class="content_3">
			<div class="page">
				
			</div>
			<a href="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq.sq_name}"><span class="span_2">&lt;&lt;返回${sq.sq_name}社区</span></a>
		</div>
		<!-- end content_3 -->
		<!-- content_4 start -->
		<div class="content_4">
			<div class="left">
				<div class="one">
					<span class="span_1"><s:property value="tz.tz_title"/></span>
					<div class="yb">
						<a href="#"><span class="yb_span_1">只看楼主</span></a>
						<a href="#"><span class="yb_span_2">收藏</span></a>
						<a href="#tdhf"><span class="yb_span_3"><span class="hf">回复</span></span></a>
					</div>
				</div>
				<div class="two">
					<ul>
						<li>
							<div class="two_left">
								<img src="${pageContext.request.contextPath}/images/user/${tz.user.img}" width="96" height="96"/>
								<span><a href="javascript:void(0)" onclick="clickName('${tz.user.nickname}');" id="clicknickname">${tz.user.nickname}</a></span>
							</div>	
							<div class="two_right">
								<div class="txt">
									<s:property value="tz.tz_content" escape="false"/>
								</div>
							</div>
						</li>
						<!-- 叠加数据-1 start -->
						<s:iterator value="tzRemarks" status="index">
							<li>
								<div class="two_left">
									<img src="${pageContext.request.contextPath}/images/user/${user.img}" width="96" height="96"/>
									<span><a href="javascript:void(0)" onclick="clickName('${user.nickname}');" id="clicknickname">${user.nickname }</a></span>
								</div>	
								<div class="two_right">
									<div class="txt">
									${tz_remark_content }
									</div>
									<div class="cz">
										<div class="_1">
											<span class="span_1">
												<span class="lcValue" style="display:none">${id}</span>
												${lcNum}楼&nbsp;<s:date name="tz_remark_time" format="yyyy-MM-dd HH:mm"/>&nbsp;&nbsp;
												<a href="javascript:void(0)">回复(<span class="ejzs">${lchCount}</span>)</a>
											</span>
											<span class="span_2">
												${lcNum}楼&nbsp;<s:date name="tz_remark_time" format="yyyy-MM-dd HH:mm"/>&nbsp;&nbsp;
												<a href="javascript:void(0)">回复(<span class="ejzs">${lchCount}</span>)</a>
											</span>
											<div class="pl">
												<ul class="ul"> 
													<!-- 叠加数据-2 start -->
													<s:iterator value="lchRemarks" var="lchRemark">
														<li>
															<a href="javascript:void(0)" class="hf_name" onclick="clickName('${user.nickname}');" id="clicknickname">${user.nickname}：</a>
																${lch_remark_content }
															<span class="t_h"><s:date name="lch_remark_time" format="yyyy-MM-dd HH:mm"/>&nbsp;<a href="javascript:void(0)" class="hf">回复</a></span>
														</li>
													</s:iterator>
													<!-- end 叠加数据-2 -->
												</ul>
												<div class="say">
													<a href="javascript:void(0)">我也说一句</a>
												</div>
												<div class="say_2">
													<a href="javascript:void(0)">我也说一句</a>
												</div>
												<div class="pl_from">
													<form method="post">
														<!-- 评论楼层id也可以通过隐藏表单传到后台，当然也可以用jQuery获取！
															<input type="hidden" name="tzReamrkId" value="${id}"/>
														 -->
														 <!-- 只有一个input时，防止表单回车提交方法1 -->
														<input type="text" style="display:none"/>
														<!-- 只有一个input时，防止表单回车提交方法2
															onkeypress="if(event.keyCode==13||event.which==13){return false;}"
														 -->
														<input type="text" class="input_text" id="lch_text" autocomplete="off"/>
														<span class="hfjy">回复不能为空</span>
														<input type="button" class="input_btn" value="发 表" id="lchHF"/>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</s:iterator>
						<!-- end 叠加数据-1 -->
					</ul>
				</div>
			</div>
			<div class="right">
				<div class="_1">
					<span>我在月下</span>
				</div>
				<div class="_2">
					<div class="img">
						<img src="${pageContext.request.contextPath}/images/homepage/tx.jpg" width="90" height="90"/>
					</div>
					<div class="js">
						<span class="_1"><a href="#">MyLove_CMMynnnm</a></span>
						<span>男</span>
						<span>1.8Y</span>
					</div>
				</div>
			</div>
		</div>
		<!-- end content_4 -->
		<!-- content_3 start -->
		<div class="content_3">
			<div class="page">
				<xy:pager pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.recordCount}" submitUrl="${pageContext.request.contextPath}/yxsq/tz/selectAllRemark.action?tzId=${tzId}&sqId=${sqId}&pageModel.pageIndex={0}"/>
			</div>
			<a href="${pageContext.request.contextPath}/yxsq/sq/sqGo.action?sqName=${sq.sq_name}"><span class="span_2">&lt;&lt;返回${sq.sq_name}社区</span></a>
		</div>
		<!-- end content_3 -->
		<!-- content_5 start -->
		<div class="content_5">
			<div class="zd">
				<div class="_1">
					<span class="span_1"></span>
					<span class="span_2">发表回复</span>
					<span class="span_3">回复不能为空</span>
				</div>
				<a name="tdhf"/>
				<div class="_2">
					<form method="post" id="remarkForm" action="${pageContext.request.contextPath}/yxsq/tz/insertOneRemark.action?pageIndex=${pageModel.pageIndex}&pageSize=${pageModel.pageSize}&recordCount=${pageModel.recordCount}">
						<input type="hidden" name="tzId" value="${tz.id}"/>
						<input type="hidden" name="sqId" value="${sqId}"/>
						<input type="hidden" name="userId" value="${session_user.id}"/>
						<input type="text" class="text" id="remarkText" name="remarkText" value="${remarkText}" autocomplete="off" onkeypress="if(event.keyCode==13||event.which==13){return false;}"/>
						<input type="button" value="发 表" class="btn" id="remarkBtn"/>
					</form>
				</div>
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
		<span>回帖成功！<font color="#eb6f49">经验<b>＋1</b></font></span>
	</div>
	<!-- end 发帖成功 -->
	<!-- 表单重复提交start -->
	<div class="bdcftj">
		禁止表单重复提交！
	</div>
	<!-- end表单重复提交 -->
	<script type="text/javascript">
		(function($){
	        $(".warp .content_4 .left .two ul li .two_right .cz").on("click",".span_2",function(){
				var _this = $(this);
				_this.parent().find("ul").slideUp("slow");
				_this.parent().find(".say").slideUp("slow");
				_this.parent().find(".span_2").hide();
				_this.parent().find(".span_1").show();
				
				_this.parent().find(".say_2").slideUp("slow");
				_this.parent().find(".pl_from").slideUp("slow");
			}); 
	        $(".warp .content_4 .left .two ul li .two_right .cz").on("click",".span_1",function(){
				var _this = $(this);
				_this.parent().find("ul").slideDown("slow");
				_this.parent().find(".say").slideDown("slow");
				_this.parent().find(".span_2").show();
				_this.parent().find(".span_1").hide();
				
			}); 
	        $(".warp .content_4 .left .two ul li .two_right .cz").on("click",".say",function(){
				var _this = $(this);
				/** 判断用户是否登陆start */
				if ($.trim(${session_user.id}) == "") {
        			var height = $("#lchHF").offset().top;
        			$(".tck").addClass("animated bounceIn").css("top",height+100).show();
					$(".yy").css({"height":$(document).height(),"width":$(window).width()}).show();
					$(".tck .box_1 .qx").click(function(){
						$(".yy").hide();
						$(".tck").hide();
					});
					/** 登陆验证start */
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
										window.location = "${pageContext.request.contextPath}/yxsq/tz/selectAllRemark.action?tzId=${tzId}&sqId=${sqId}";
									}
								},
								error:function(){
									$(".tck .box_2 span").text("异步登陆请求失败！");
								}
							});
						}
					});
				/** end登陆验证 */
				}else{
					_this.parent().find(".pl_from").slideDown("slow");
					_this.parent().find(".say").hide();
					_this.parent().find(".say_2").show();
        		}
				/** end判断用户是否登陆 */
			});
	        $(".warp .content_4 .left .two ul li .two_right .cz").on("click",".say_2",function(){
				var _this = $(this);
				_this.parent().find(".pl_from").slideUp("slow");
				_this.parent().find(".say_2").hide();
				_this.parent().find(".say").show();
			});	        
	        $(".warp .content_4 .left .two ul li .two_right .cz").on("click",".hf",function(){
	        	var _this = $(this);
	        	var hf_name = _this.parent().parent().find(".hf_name").html();
	        	_this.parent().parent().parent().parent().find(".pl_from").slideDown("slow");
	        	_this.parent().parent().parent().parent().find(".input_text").val("回复 "+hf_name);
			});	 
	        $(".warp .content_4 .left .two ul li .two_right .cz").on("click","#lchHF",function(){
	        	var _this = $(this);
	        	var lch_text = _this.parent().find("#lch_text").val();
	        	if ($.trim(lch_text) == "") {
					_this.parent().find(".hfjy").text("回复不能为空").addClass("animated rubberBand").show().delay (3000).fadeOut(3000);
				}
	        	else{
	        		var lcValue = _this.parent().parent().parent().parent().parent().parent().find(".lcValue").html();
	        		var lch_text = _this.parent().parent().parent().parent().parent().find("#lch_text").val();
	        		//alert("lch_text: "+lch_text);
	        		var url = encodeURI(encodeURI("${pageContext.request.contextPath}/yxsq/tz/lchRemarkAjax.action?userId=${session_user.id}&tzRemarkId="+lcValue+"&lch_text="+lch_text));
	        		var ejzs = parseInt( _this.parent().parent().parent().parent().find(".ejzs").html());
	        		$.ajax({
						type:"post",
						url:url,
						dataType:"json",
						success:function(json){
							if (json.flag == 1) {
								//$(".warp .content_4 .left .two ul li .two_right .cz ._1 .pl ul li:last-child").addClass("animated rotateInDownLeft");
								_this.parent().parent().parent().find(".ul").append("<li>" +"<a href='#' class='hf_name'>"+json.nickname+"：</a>"+lch_text+"<span class='t_h'>"+json.date+"<a href='javascript:void(0)' class='hf'>回复</a></span>"+"</li>");
								_this.parent().parent().parent().parent().find(".ul li:last-child").addClass("animated rotateInDownLeft");
								_this.parent().parent().parent().parent().parent().find("#lch_text").attr("value","");
								_this.parent().parent().parent().parent().find(".ejzs").text(ejzs+1);
							}
						},
						error:function(){
							_this.parent().find(".hfjy").text("异步回复请求失败！").addClass("animated rubberBand").show().delay (3000).fadeOut(3000);
						}
					});
	        	}
	        });
		})(window.jQuery);
	</script>
</body>
</html>
