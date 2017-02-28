package org.yxsq.dao.support;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 处理结果集的接口
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月26日
 * 
 * Explain: ResultSetHandler是用来简化查询到的数据处理的.ResultSetHandler的实现方法可以不用创建实例对象去封装就能打印出来
 */
public interface ResultSetHandler<T>{
	public T execute(ResultSet rs) throws SQLException;
}
