<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<head>
	<title> 个人主页 | 月下社区 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="Keywords" content="KeyWords, KeyWords"/>
	<meta name="description" content=""/>
	<meta name="author" content="Nothing"/>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/2.png"/>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/css/homepage.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet" type="text/css"/>
	<!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/homepage.js"></script>
	<script type="text/javascript">
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
			
			/** 点击换头部背景操作 */
			// @1. 弹出换肤框
			$(".warp .content_1 .hbj").click(function(){
				$(".yy").css({"height":$(document).height(),"width":$(window).width()}).show();
				$(".warp .hbj_tck").addClass("animated flip").show();
			});
			// @2. 点击X关闭换肤框
			$(".warp .hbj_tck .box_1 .box_1_1 .s_2").click(function(){
				$(".warp .hbj_tck").hide();
				$(".yy").hide();
			});
			// @3. 点击各个li
			$(".warp .hbj_tck .box_1_2 .ul > li").click(function(){
				var nowindex = $('.ul>li').index(this);
				$(".warp .content_1").css({'background':'url(${pageContext.request.contextPath}/images/homepage/'+(nowindex+1)+'.jpg)'});
				
				// @4. 点击取消按钮
				$(".warp .hbj_tck .box_1 .box_1_3 .btn_2").click(function(){
					//alert("${pageContext.request.contextPath}/images/homepage/${user.homepage_img}");
					$(".yy").hide();
					$(".warp .hbj_tck").hide();
					$(".warp .content_1").css("background","url(${pageContext.request.contextPath}/images/homepage/${user.homepage_img})"); 
				});
				
				// @5. 点击确定按钮 异步修改头部背景
				$(".warp .hbj_tck .box_1 .box_1_3 .btn_1").click(function(){
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/yxsq/user/updateHomepageImgAjax.action?img_src="+(nowindex+1)+".jpg&userId=${session_user.id}",
						dataType:"json",
						success:function(json){
							if (json.flag == 1) {
								//alert("修改成功");
								$(".update_success").show().text("修改成功！").delay (1000).fadeOut(3000);
							}
						},
						error:function(){
							//alert("异步修改头部背景出错！");
							$(".update_success").show().text("异步修改头部背景出错！").delay (1000).fadeOut(3000);
						}
					});
					$(".yy").hide();
					$(".warp .hbj_tck").hide();
				});
			});
			
			/** 用户性别设置 */
			//alert("${user.sex}");
			if ("${user.sex}" == 1) {
				$(".warp .content_2 .box_1 .box_1_2 .sex").css("background-position", "3px -32px");
			}else {
				$(".warp .content_2 .box_1 .box_1_2 .sex").css("background-position", "3px -63px");
			}
			
			
			
			/** 添加爱逛的社区 */
			$(".warp .content_3 .box_1 .box_1_2 .box_1_2_2 ul .last").click(function(){
				$(".tck").addClass("animated bounceIn").css("top",460).show();
				$(".yy").css({"height":$(document).height(),"width":$(window).width()}).show();
			});
			
			/** 关闭弹出框 */
			$(".tck .box_1 .qx").click(function(){
				$(".yy").hide();
				$(".tck").hide();
			});
			
			/** 用户添加爱逛社区 */
			$("#addAgsqBtn").click(function(){
				//alert(0);
				var ttsq = $("#ttsq").val();
				if (ttsq == "") {
					$(".tck .box_3 .tsxx").text("社区名称不能为空！").addClass("animated rubberBand").delay (1000).fadeOut(3000).show();
				}else{
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/yxsq/sq/addAgsqAjax.action",
						dataType:"json",
						data:$("#addAgsqForm").serialize(),
						success:function(json){
							if (json.flag == 1) {
								$(".tck .box_3 .tsxx").text("添加成功！").addClass("animated rubberBand").delay (1000).fadeOut(3000).show();
								$(".warp .content_3 .box_1 .box_1_2 .box_1_2_2 ul").prepend(
										"<a href='javascript:void(0)'><li>"+ttsq+"<span></span></li></a>"		
								);
							}else{
								$(".tck .box_3 .tsxx").text("该社区不存在，请更换！").addClass("animated rubberBand").delay (1000).fadeOut(3000).show();
							}
						},
						error:function(){
							$(".tck .box_3 .tsxx").text("异步添加爱逛社区失败！").addClass("animated rubberBand").delay (1000).fadeOut(3000).show();
						}
					});
				}
			});
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
				<li class="_2_li"><a href="${pageContext.request.contextPath}/loginout/loginout_2.action">安全退出</a>&nbsp;|&nbsp;</li>
				<li class="li_2">
					<a href="javascript:void(0)">
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
		<div class="content_1" style="background:url(${pageContext.request.contextPath}/images/homepage/${user.homepage_img}) no-repeat;">
			<a href="javascript:void(0)" class="hbj"><i></i></a>
			<a href="${pageContext.request.contextPath}//yxsq/user/goUpdateUserZLpage.action?userId=${session_user.id}" class="bjzl"></a>
		</div>
		<!-- 换肤弹出框 statrt -->
		<div class="hbj_tck">
			<div class="box_1">
				<div class="box_1_1">
					<span class="s_1">头部背景设置</span>
					<a href="javascript:void(0)"><span class="s_2"></span></a>
				</div>
				<div class="box_1_2">
					<ul class="ul">
					<s:iterator value="imgs">
						<li>
							<a href="javascript:void(0)">
								<img src="${pageContext.request.contextPath}/images/homepage/${img_src}" width="102" height="62"/>
								<span>${img_title}</span>
							</a>
						</li>
					</s:iterator>
					</ul>
				</div>
				<div class="box_1_3">
					<a href="javascript:void(0)" class="btn_1">保 存</a>
					<a href="javascript:void(0)" class="btn_2">取 消</a>
				</div>
			</div>
		</div>
		<!-- end 换肤弹出框 -->
		<!-- end content_1 -->
		<!-- 插入头像 start -->
		<div class="image">
			<img src="${pageContext.request.contextPath}/images/user/${session_user.img}" width="150" height="150"/>
		</div>
		<!-- end 插入头像 -->
		<!-- content_2 start -->
		<div class="content_2">
			<div class="box_1">
				<div class="box_1_1">
					<span>${session_user.nickname}</span>
				</div>
				<div class="box_1_2">
					<span class="sex"></span>
					<span>Y龄：<s:property value="Y_L"/>年</span>
					<span class="sx"></span>
					<span>发帖：<s:property value="count"/></span>
				</div>
				<div class="box_1_3">
					<a href="javascript:void(0)" class="_1"></a>
					<a href="javascript:void(0)" class="_2"></a>
				</div>
			</div>
			<div class="box_2">
				<ul>
					<li><a href="javascript:void(0)">服务中心</a></li>
					<li><span class="sx"></span></li>					
					<li><a href="javascript:void(0)">我在月下</a></li>
					<li><span class="sx"></span></li>
					<li><a href="javascript:void(0)">我的i月下</a></li>
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
							<a href="javascript:void(0)"><span class="bg_txt">我的主页</span></a>
							<li><span class="sx"></span></li>
						</li>
						<li class="_2">
							<a href="javascript:void(0)"><span class="bg_txt">通知</span></a>
							<li><span class="sx"></span></li>
						</li>
						<li class="_3">
							<a href="javascript:void(0)"><span class="bg_txt">收藏</span></a>
							<li><span class="sx"></span></li>
						</li>
						<li class="_4">
							<a href="javascript:void(0)"><span class="bg_txt">关注的社区</span></a>
							<li><span class="sx"></span></li>
						</li>
						<li class="_5">
							<a href="javascript:void(0)"><span class="bg_txt">帖子</span></a>
							<li><span class="sx"></span></li>
						</li>
						<li class="_6">
							<a href="javascript:void(0)"><span class="bg_txt">成就</span></a>
						</li>
					</ul>
				</div>
				<div class="box_1_2">
					<div class="box_1_2_1">
						<span class="s">|</span>
						<span class="title">爱逛的社区</span>
						<a href="javascript:void(0)" class="yjqd"></a>
					</div>
					<div class="box_1_2_2">
						<ul>
							<s:iterator value="agsqs">
								<a href="javascript:void(0)"><li><s:property value="agsq_name"/><span></span></li></a>
							</s:iterator>
							
							<a href="javascript:void(0)"><li class="last"></li></a>
						</ul>
					</div>
				</div>
				<div class="box_1_3">
					<div class="box_1_3_1">
						<span class="s">|</span>
						<span class="title">热门动态</span>
						<a href="#" class="yjqd"></a>
					</div>
					<div class="box_1_3_2">
						<ul class="ul">
							<s:iterator value="tzs">
								<li>
									<div class="_1">
										<div class="img">
											<img src="${pageContext.request.contextPath}/images/sq_img/<s:property value="sq.sq_logo_img"/>" width="43" height="43"/>
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
								<li><img src="${pageContext.request.contextPath}/images/user/${img}" width="44" height="44" title="${nickname}"/></li>
							</s:iterator>
						</ul>
					</div>
				</div>
				<div class="box_2_2">
					<span>我关注的人(6)</span>
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
					<span>关注我的人(8)</span>
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
				<div class="box_2_4">
					<a href="javascript:void(0)">我的相册&gt;&gt;</a>
					<a href="javascript:void(0)">我的网盘&gt;&gt;</a>
				</div>
			</div>
		</div>
		<!-- end content_3 -->
	</div>
	<div class="footer">
		<span><a href="javascript:void(0)">月下</a>&nbsp;|&nbsp;</span>
		<span><a href="javascript:void(0)">联系作者</a>&nbsp;|&nbsp;</span>
		<span><a href="javascript:void(0)">反馈意见</a>&nbsp;|&nbsp;</span>
		<span><a href="javascript:void(0)">欢迎纠错</a>&nbsp;|&nbsp;</span>
		<span><a href="${pageContext.request.contextPath}/main.action">后台管理</a></span><br/>
		<span>&copy;2015-4 For <a href="#">那次心动</a></span>
	</div>
	<!-- end footer -->	
	<!-- start 修改头部背景成功 -->
	<div class="update_success">
		<span></span>
	</div>
	<!-- end 修改头部背景成功 -->
	
	
	
	
	<!-- 弹出框 start -->
	<div class="tck">
		<div class="box_1">
			<span class="qx">x</span>
		</div>
		<div class="box_2">
			<form id="addAgsqForm">
				<input type="text" class="text" autocomplete="off" id="ttsq" name="agsq_name"/>
				<input type="hidden" name="userId" value="${session_user.id}"/>
				<input type="text" style="display:none"/>
				<input type="button" value="添加" class="btn" id="addAgsqBtn"/>
			</form>
		</div>
		<div class="box_3">
			<span class="tsxx"></span>
		</div>
	</div>
	<div class="yy">
	</div>
	<!-- end 弹出框 -->
</body>
</html>
