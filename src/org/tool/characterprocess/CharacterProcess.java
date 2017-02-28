package org.tool.characterprocess;

import org.apache.struts2.ServletActionContext;
import org.apache.commons.lang.StringUtils;

public class CharacterProcess {

	/**
	 * GET请求转码
	 * @param str
	 * @return
	 */
	public static String isoToUtf8(String str){
		// 获取请求方式
		String method = ServletActionContext.getRequest().getMethod();
		if (method.equalsIgnoreCase("get") && !StringUtils.isEmpty(str))
		{
			try 
			{
				return  new String(str.getBytes("iso8859-1"), "UTF-8");
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		return str;
	}

}
