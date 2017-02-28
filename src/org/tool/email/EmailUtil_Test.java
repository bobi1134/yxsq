package org.tool.email;

import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * javaMail发送
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年5月26日
 */
public class EmailUtil_Test 
{
	public static boolean send(String to, String subject, String msg)
	{
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp"); // 邮件传输的协议
		props.put("mail.host", "smtp.qq.com"); // 连接的邮件服务器
		props.put("mail.from", "1451965355@qq.com"); // 发送人
		// 第一步：创建Session
		Session session = Session.getDefaultInstance(props);
		session.setDebug(true);
		try
		{
			// 第二步：获取邮件传输对象
			Transport ts = session.getTransport();
			ts.connect("1451965355@qq.com", "login123"); // 连接邮件服务器
			// 第三步: 创建邮件消息体
			MimeMessage message = new MimeMessage(session);
			message.setSubject(subject); // 设置邮件的主题
			message.setContent(msg, "text/html;charset=utf-8"); // 设置邮件的内容
			// 第四步：设置发送昵称
			String nick="";  
			try {
				nick=javax.mail.internet.MimeUtility.encodeText("Nothing");  
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();  
			}
			message.setFrom(new InternetAddress(nick+" <1451965355@qq.com>"));  
			// 第五步：设置发送人
			ts.sendMessage(message, InternetAddress.parse(to));
			return true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
	
	/**
	 * test
	 * @param args
	 */
	
	public static void main(String[] args) {
		EmailUtil_Test.send("761328790@qq.com", "月下社区", "请点此链接<a href='http://localhost:8080/yxsq/user/activeUser.action?username="+66666 +"><font style='color:red'>Here!</font></a>进行激活！");
	}
}
