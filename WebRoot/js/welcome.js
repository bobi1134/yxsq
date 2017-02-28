var index = 0;
function timer(){
	index ++;
	if(index > 4) {index = index % 5;}
	$(".content_1 .pic_1 .pic_ul").find("li").eq(index).fadeIn("slow").siblings().hide();
	$(".content_1 .pic_1 .btn").find("li").eq(index).addClass("sel").siblings().removeClass("sel");
}

$(function(){


	
	

	/* 选择省份城市 start */
	/**********要进行修改*********/
	$(".wrap .head_top .kg .weather .qh").click(function(){
		$(".wrap .qhtq").addClass("animated bounceIn").show();
	});
	$(".wrap .qhtq .qx").click(function(){
		$(".wrap .qhtq").slideUp("slow");
	});
	/* end 选择省份城市 */


	/* 换肤 start */
	//点击"换肤"按钮
	$(".wrap .head_top .kg .dh ul li span .hf").click(function(){
		/* 有问题：.animate({height:"133px"}) */
		$(".wrap .skin").addClass("animated fadeInDown").show();
	});

	//点击"不使用皮肤"按钮
	$(".wrap .skin .skin_menu ._1").click(function(){
		$("body").css("background","#fff"); 
		$(".wrap .skin").slideUp("slow");
	});

	//点击"保存"按钮
	$(".wrap .skin .skin_menu ._2").click(function(){
		$(".wrap .skin").slideUp("slow");
	});

	//点击各个li
	$(".wrap .skin .ul > li").click(function(){
		var nowindex = $('.ul>li').index(this);
		$("body").css({'background-image':'url(images/bg/'+(nowindex+1)+'.jpg)'}); 
	});
	/* end 换肤 */


	
	var t;
	var play=function(){
		 t = setInterval(timer, 2000);
	}
	play();


	/* 切换图片 start */
	$(".content_1 .pic_1 .btn").find("li").mouseover(function(){//控制小白点
		clearInterval(t);
		$(this).addClass("sel").siblings().removeClass("sel");
		$(".content_1 .pic_1 .pic_ul").find("li").eq($(this).index()).fadeIn("slow").siblings().hide();
	}).mouseout(function(){
		play();
		index = $(this).index();
	});
	/* end 切换图片 */


	/* 弹出登陆窗口 start */
	$(".wrap .head_top .kg .dh ul li .dl").click(function(){
		$(".wrap .tck").addClass("animated bounceIn").show();
		$(".wrap .yy").show();
	});
	//点击x 关闭弹出窗口
	$(".tck .box_1 .qx").click(function(){
		$(".wrap .yy").hide();
		$(".wrap .tck").hide();
		/*
			$(".wrap .tck").show().animate({width:"-300px",height:"-200px"}, 2000, function(){
				$(this).hide();
			});
		*/
	});
	/* end 弹出登陆窗口 */
});

