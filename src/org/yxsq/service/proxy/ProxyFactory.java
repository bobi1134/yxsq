package org.yxsq.service.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;

import org.tool.annotation.Transcation;
import org.yxsq.dao.support.DBConnection;

/**
 * 实现业务层动态代理
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月26日
 */
public class ProxyFactory{	
	@SuppressWarnings("unchecked")
	public static <T> T getProxy(final T bean){		
		return (T)Proxy.newProxyInstance(bean.getClass().getClassLoader(),
				bean.getClass().getInterfaces(), new InvocationHandler(){						
			@Override
			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable{
				// 获取数据库连接
				Connection conn = DBConnection.getConnection();
				// 默认不需要事务
				boolean isAutoCommit = true;
				try{
					// 设置连接到业务层
					bean.getClass().getMethod("setConnection", Connection.class).invoke(bean, conn);
					// 获取实现类的方法
					Method m = bean.getClass().getMethod(method.getName(), method.getParameterTypes());
					// 判断方法上的注解是不是Transcation类型
					if (m.isAnnotationPresent(Transcation.class)){
						Transcation t = m.getAnnotation(Transcation.class);
						isAutoCommit = t.readOnly();
					}
					/**
					 * 根据注解来决定是否开启事物
					 */
					conn.setAutoCommit(isAutoCommit);
					Object obj =  method.invoke(bean, args);
					if(!isAutoCommit){
						conn.commit();
					}
					return obj;
				}
				catch(Throwable ex){
					if (!isAutoCommit) conn.rollback();
					throw new Throwable(ex);
				}
				finally{
					DBConnection.close(conn);
				}
			}
		});
	}
}
