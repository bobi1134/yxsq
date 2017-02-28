package org.yxsq.action.base;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 处理后台所有的异步请求
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月27日
 */
public abstract class AbstractAjaxAction extends ActionSupport{
	
	private static final long serialVersionUID = -5563706302363891688L;

	@Override
	public String execute() throws Exception{
		String json = this.getJson();
		System.out.println("提交的json处理数据为：--->"+json);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println(json);
		return NONE;
	}
	
	// 提供一个抽像的获取JSON字符串格式的方法留给子类去实现
	protected abstract String getJson() throws Exception;
}
