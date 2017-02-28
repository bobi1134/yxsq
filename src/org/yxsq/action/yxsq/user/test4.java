package org.yxsq.action.yxsq.user;

public class test4 {

	public static void main(String[] args) {
		String aa = "<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt='' src='http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg' style='height:291px; width:440px' /></p>";
		String bb = aa.substring(aa.indexOf("http://"), aa.indexOf(" style"));
		String cc = bb.substring(0, bb.length()-1);
		
		System.out.println(cc);
	}

}
