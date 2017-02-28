package org.tool.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * 事务注解
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月26日
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface Transcation {
	boolean readOnly() default true;
}
