package org.tool.ipAddress;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;

public class IpAddress {

	/**
	 * 根据主机ip获取该地理位置
	 * @return
	 * @throws UnknownHostException 
	 */
	public static String getAddressByIp() throws Exception{
		InetAddress addr = InetAddress.getLocalHost();
		String ip = addr.getHostAddress();
		System.out.println("该主机IP："+ip);
		URL url = new URL( "http://ip.qq.com/cgi-bin/searchip?searchip1=" + ip); 
		URLConnection conn = url.openConnection();      
		BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "GBK"));      
		String line = null;      
		StringBuffer result = new StringBuffer();      
		while((line = reader.readLine()) != null)     
		{        
			result.append(line);      
		}      
		reader.close();
		String address = new String();
		address = result.substring(result.indexOf( "该IP所在地为：<span>" ));    
		if(!address.substring(14, 16).equals("中国")) {
			address = "您当前主机的IP地址为局域网IP或者其他IP："+ip+"  无法定位您的当前位置，默认为您定位到站长位置，【四川-雅安】！如需获取你的地理位置，请手动设置！";
		}else{
			address = address.substring(16, address.indexOf("市")+1);
		}
		return address; 
	}

	/**
	 * 打印测试
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		System.out.println(getAddressByIp());
	}
}
