package org.tool.interceptor;

import org.tool.consts.WebConstant;
import org.yxsq.dto.User;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 登陆拦截器
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月28日
 */
public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	public LoginInterceptor() {
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("static-access")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		User user = (User)invocation.getInvocationContext().getContext().getSession().get(WebConstant.SESSION_USER);
		if (user != null)
		{
			return invocation.invoke();
		}
		else
		{
			return WebConstant.USER_LOGIN;
		}
	}

}
