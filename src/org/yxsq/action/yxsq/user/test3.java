package org.yxsq.action.yxsq.user;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.tool.email.EmailUtil;

public class test3 {

	public static void main(String[] args) {
		 List<List<String>> listList=new ArrayList<List<String>>();
         List<String> li=new ArrayList<String>();
         li.add("姓名");
         li.add("势力");
         li.add("职务");
         listList.add(li);
        li=new ArrayList<String>();
        li.add("刘备");
        li.add("蜀");
        li.add("老大");
        listList.add(li);
        li=new ArrayList<String>();
        li.add("关羽");
        li.add("蜀");
        li.add("老2");
        listList.add(li);
        li=new ArrayList<String>();
        li.add("张飞");
        li.add("蜀");
        li.add("老3");
        listList.add(li);
        li=new ArrayList<String>();
        li.add("赵云");
        li.add("蜀");
        li.add("大将");
        listList.add(li);
        
        System.out.println(listList.get(0));
        
       // EmailUtil.send("1451965355@qq.com", "月下社区会员注册", "请点此链接<a href='http://localhost:8080/yxsq/user/activeUser.action?username="+6666 +"><font style='color:red'>Here!</font></a>进行激活！");
	}

}
