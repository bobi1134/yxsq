package org.yxsq.action.yxsq.user;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class test5 {

	public static void main(String[] args) {
		/*String str = "1_2_3_7";
		String[] arr = str.split("_");
		arr.
		System.out.println(arr.length);*/
		
		String str = "1_3_5_8";
		String[] arr = str.split("_");
		List<String> lists = new ArrayList<String>();
		for (String s : arr) {
			lists.add(s);
		}
		//lists.remove(3);
		lists.add(0,"9");
		System.out.println(lists.get(0));
		System.out.println(lists.get(1));
		System.out.println(lists.get(2));
		//System.out.println(lists.size());
		System.out.println(lists.get(3));
		System.out.println(lists.get(4));
		System.out.println(lists.get(0)+"_"+lists.get(1)+"_"+lists.get(2)+"_"+lists.get(3)+"_");
	}

}
