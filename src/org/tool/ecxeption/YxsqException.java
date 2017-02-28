package org.tool.ecxeption;

/**
 * 月下社区自定义异常
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月28日
 */
public class YxsqException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public YxsqException() {
		// TODO Auto-generated constructor stub
	}

	public YxsqException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public YxsqException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	public YxsqException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public YxsqException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

}
